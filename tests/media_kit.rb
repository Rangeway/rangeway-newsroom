require 'nokogiri'
require 'yaml'
require 'uri'
require 'open3'
require 'digest'

root = File.expand_path(ARGV[0] || '../_site', __dir__)
def check(value, message)
  raise message unless value
end
doc = Nokogiri::HTML(File.read(File.join(root, 'media-kit.html')))
home = Nokogiri::HTML(File.read(File.join(root, 'index.html')))
check(home.css('footer a').none? { |a| a.text.match?(/Logos\s*&\s*brand guidelines/i) }, 'Standalone brand-guidelines footer link remains')
check(home.at_css('footer a[href="/media-kit.html"]'), 'Media Kit footer entry missing')
main = doc.at_css('main')
check(main.at_css('.press-kit'), 'Editorial press kit missing')
check(!main.text.match?(/Trailhead|four formats|one business day|Rangeway Energy|Theo|Mojave|Hawai|St\. Louis|Beverly Hills/i), 'Stale or restricted public copy')
check(main.css('[data-format]').map { |n| n['data-format'] } == %w[Waystation Basecamp Summit], 'Destination format architecture changed')
check(main.at_css('[data-format="Waystation"]').text.include?('unstaffed'), 'Waystation staffing unclear')
check(main.at_css('#chargevia').text.include?('stand on its own'), 'ChargeVia standalone concept missing')
check(main.at_css('a[href="https://chargevia.net/"]'), 'ChargeVia link missing')
check(doc.css('link[rel="stylesheet"]').none? { |n| n['href'].include?('style-main.css') }, 'Legacy CSS still loaded')
check(main.css('a[download]').size >= 14, 'Incomplete direct downloads')
main.css('a[href],img[src]').each do |node|
  value = node[node.name == 'a' ? 'href' : 'src']
  next unless value.start_with?('/')
  path = URI(value).path.sub(%r{^/}, '')
  check(File.file?(File.join(root, path)), "Missing local resource: #{value}")
end
main.css('a[href^="#"]').each { |a| check(doc.at_css(a['href']), "Missing anchor #{a['href']}") }
norm = ->(s) { s.gsub(/\s+/, ' ').strip }
boilerplate = File.read(File.join(root, 'assets/downloads/media-kit/boilerplate.txt'))
check(norm.call(main.at_css('#boilerplate').text) == norm.call(boilerplate), 'Boilerplate download differs')
bio = File.read(File.join(root, 'assets/downloads/media-kit/zak-winnick-bio.txt'))
check(norm.call(main.at_css('#founder-bio').text) == norm.call(bio), 'Founder biography differs')
check(main.css('#images figure').all? { |n| n.at_css('figcaption').text.include?('Concept rendering') }, 'Concept caption missing')
check(main.css('#logos img').all? { |n| n['src'].end_with?('.svg') }, 'Raster logo introduced')
archive = File.join(root, 'assets/downloads/rangeway-press-kit.zip')
entries, status = Open3.capture2('unzip', '-Z1', archive)
check(status.success?, 'ZIP unreadable')
expected = %w[basecamp-concept.jpg drivers-lounge-concept.jpg chargevia-concept.jpg zak-winnick.jpg boilerplate.txt company-fact-sheet.txt zak-winnick-bio.txt usage-and-credits.txt rangeway-charcoal-amber.svg rangeway-cream-amber.svg rangeway-charcoal-mono.svg rangeway-cream-mono.svg rangeway-icon-charcoal.svg rangeway-icon-cream.svg]
check(entries.lines.map(&:strip).sort == expected.sort, 'Unexpected ZIP content')
expected.each do |name|
  data, result = Open3.capture2('unzip', '-p', archive, name)
  path = name.end_with?('.svg') ? "assets/images/brand/#{name}" : "assets/downloads/media-kit/#{name}"
  check(result.success? && Digest::SHA256.hexdigest(data) == Digest::SHA256.file(File.join(root, path)).hexdigest, "ZIP mismatch: #{name}")
end
brand = Nokogiri::HTML(File.read(File.join(root, 'brand.html')))
check(!brand.text.match?(/hoteliers|Credits back|Where charging becomes|Indoor comfort at every location/i), 'Brand guide has stale guidance')
puts 'PASS: Media Kit copy, architecture, links, SVGs, captions, downloads, ZIP allowlist and brand guidance'
