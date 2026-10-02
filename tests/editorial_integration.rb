require 'nokogiri'
require 'uri'
require 'time'

root = File.expand_path('../_site', __dir__)
def page(root, path)
  file = File.join(root, path.sub(%r{^/}, ''))
  raise "Missing #{path}" unless File.file?(file)
  Nokogiri::HTML(File.read(file))
end
def check(condition, message)
  raise message unless condition
end

home = page(root, '/index.html')
lead = home.at_css('.lead h2 a')
blog_archive = page(root, '/blog.html')
latest_archive_title = blog_archive.at_css('.story-tile h3')&.text&.strip
normalize_title = ->(text) { text.to_s.gsub(/\s+/, ' ').gsub(/,\s*/, ', ').strip }
check(lead && normalize_title.call(lead.text) == normalize_title.call(latest_archive_title), 'Latest published story is not the lead')
cards = home.css('.latest .story-grid .story-tile')
check(cards.length == 5, "Expected five latest cards, got #{cards.length}")
check(cards.map { |card| card['data-category'] }.tally == { 'Stories' => 3, 'Announcements' => 1, 'Case studies' => 1 }, 'Latest category mix changed')
check(home.at_css('.podcast-embed iframe[src*="player.fireside.fm"][src*="/latest"]'), 'Live podcast player missing')
hold_is_future = Time.now.utc < Time.parse('2026-10-02T14:00:00Z')
check(!home.text.include?('Hospitality Was in the Brief'), 'Future story on homepage') if hold_is_future

archives = {
  '/blog.html' => ['Stories', 20],
  '/press.html' => ['Announcements', 8],
  '/case-studies.html' => ['Case studies', 1]
}
archives.each do |path, (category, count)|
  doc = page(root, path)
  cards = doc.css('.story-tile')
  check(cards.length >= count, "#{path}: expected at least #{count} cards, got #{cards.length}")
  check(cards.all? { |card| card['data-category'] == category }, "#{path}: wrong card category")
  check(!doc.text.include?('Hospitality Was in the Brief'), "#{path}: future story leaked") if hold_is_future
end

articles = Dir.glob(File.join(root, '{blog,press,case-studies}', '**', '*.html')).select do |file|
  Nokogiri::HTML(File.read(file)).at_css('.article__body')
end
check(articles.length >= 29, "Expected at least 29 published articles, got #{articles.length}")
articles.each do |file|
  doc = Nokogiri::HTML(File.read(file))
  route = file.delete_prefix(root)
  body = doc.at_css('.article__body')
  check(body && !body.text.strip.empty?, "#{route}: article body missing")
  check(doc.at_css('h1') && doc.at_css('h1').text.strip.length > 2, "#{route}: title missing")
  canonical = doc.at_css('link[rel="canonical"]')&.[]('href')
  expected_path = route.sub(%r{index\.html$}, '')
  check(canonical && URI(canonical).path == expected_path, "#{route}: canonical path changed")
  check(doc.at_css('meta[property="og:image"]'), "#{route}: social image missing")
end
check(Dir.glob(File.join(root, 'blog/2026/10/02/*')).empty?, 'Future story output exists') if hold_is_future
%w[feed.xml feed-blog.xml feed-press.xml feed-case-studies.xml].each do |name|
  xml = Nokogiri::XML(File.read(File.join(root, name)))
  check(xml.errors.empty? && !xml.css('item').empty?, "#{name}: invalid or empty feed")
end
%w[docs tests scripts .superpowers CLAUDE.md CONTENT-GUIDE.md].each do |name|
  check(!File.exist?(File.join(root, name)), "Internal material published: #{name}")
end
%w[assets/css/editorial.css assets/js/editorial.js assets/downloads/nevada-electric-highway.pdf].each do |name|
  check(File.file?(File.join(root, name)), "Asset missing: #{name}")
end
if (baseline = ENV['BASELINE_DIR'])
  old_articles = Dir.glob(File.join(baseline, '{blog,press,case-studies}', '**', '*.html')).select do |file|
    Nokogiri::HTML(File.read(file)).at_css('.article__body')
  end
  check(articles.length >= old_articles.length, 'Published article count decreased from baseline')
  normalize = ->(node) { node.inner_html.gsub(/>\s+</, '><').strip }
  old_articles.each do |old_file|
    route = old_file.delete_prefix(baseline)
    new_file = File.join(root, route)
    check(File.file?(new_file), "Existing route missing: #{route}")
    old_doc = Nokogiri::HTML(File.read(old_file))
    new_doc = Nokogiri::HTML(File.read(new_file))
    check(normalize.call(old_doc.at_css('.article__body')) == normalize.call(new_doc.at_css('.article__body')), "Article body changed: #{route}")
    check(old_doc.at_css('h1').text.strip == new_doc.at_css('h1').text.strip, "Article title changed: #{route}")
    old_downloads = old_doc.css('a[download]').map { |a| a['href'] }
    new_downloads = new_doc.css('a[download]').map { |a| a['href'] }
    check((old_downloads - new_downloads).empty?, "Article download changed: #{route}")
  end
  %w[feed.xml feed-blog.xml feed-press.xml feed-case-studies.xml].each do |name|
    old_items = Nokogiri::XML(File.read(File.join(baseline, name))).css('item')
    new_items = Nokogiri::XML(File.read(File.join(root, name))).css('item')
    check(new_items.length >= old_items.length, "Feed item count decreased: #{name}")
    old_titles = old_items.map { |item| item.at_css('title')&.text }
    new_titles = new_items.map { |item| item.at_css('title')&.text }
    check((old_titles - new_titles).empty?, "Feed items changed: #{name}")
  end
  puts "PASS: all #{old_articles.length} baseline article bodies, routes, titles, downloads, and feed item titles preserved"
end
puts "PASS: dynamic lead and five cards, complete archives, #{articles.length} article routes, feeds, assets, scheduled hold, and internal exclusions"
