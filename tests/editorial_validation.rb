require 'tmpdir'
require 'fileutils'
require 'open3'
require 'nokogiri'
require 'rbconfig'

root = File.expand_path(ARGV[0] || '../_site', __dir__)
validator = File.expand_path('editorial_integration.rb', __dir__)
validate = ->(path) { Open3.capture3(RbConfig.ruby, validator, path) }

stdout, stderr, status = validate.call(root)
raise "Current published source must validate after editorial removals:\n#{stdout}#{stderr}" unless status.success?

Dir.mktmpdir('newsroom-validation-test-') do |dir|
  fixture = File.join(dir, 'site')
  FileUtils.cp_r(root, fixture)
  %w[press.html press/index.html].each do |path|
    file = File.join(fixture, path)
    doc = Nokogiri::HTML(File.read(file))
    card = doc.at_css('.story-tile')
    raise 'Regression fixture requires a published announcement' unless card
    card.remove
    File.write(file, doc.to_html)
  end
  stdout, stderr, status = validate.call(fixture)
  raise 'A missing announcement passed validation' if status.success?
  raise "Missing announcement was not detected by source comparison:\n#{stdout}#{stderr}" unless stderr.include?('/press.html: archive differs from published source')
end

puts 'PASS: deliberate editorial removals validate; accidental archive omissions still fail'
