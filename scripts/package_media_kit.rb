# Rebuild the public press pack from one content source and an explicit asset list.
require 'yaml'
require 'tmpdir'
require 'fileutils'

root = File.expand_path('..', __dir__)
kit = YAML.safe_load_file(File.join(root, '_data/media_kit.yml'))
downloads = File.join(root, 'assets/downloads')
folder = File.join(downloads, 'media-kit')
FileUtils.mkdir_p(folder)
texts = {
  'boilerplate.txt' => kit.fetch('boilerplate'),
  'zak-winnick-bio.txt' => kit.fetch('founder_bio'),
  'usage-and-credits.txt' => ["RANGEWAY / PRESS ASSETS / #{kit.fetch('revision')}", kit.fetch('usage'), kit.fetch('credits'), 'Founder portrait: Zak Winnick. Image: Rangeway.'].join("\n\n"),
  'company-fact-sheet.txt' => ["RANGEWAY / COMPANY FACT SHEET / #{kit.fetch('revision')}", kit.fetch('overview'), kit.fetch('facts').map { |f| "#{f.fetch('label')}: #{f.fetch('value')}" }.join("\n"), 'DESTINATION FORMATS', *kit.fetch('formats').map { |f| "#{f.fetch('name')}\n#{f.fetch('description')}" }, "CHARGEVIA BY RANGEWAY\n#{kit.fetch('chargevia')}\nhttps://chargevia.net/", "FOUNDER\n#{kit.fetch('founder_bio')}", 'Media contact: media@rangeway.co'].join("\n\n")
}
texts.each { |name, body| File.write(File.join(folder, name), body + "\n") }
assets = kit.fetch('logos').map { |l| File.join(root, 'assets/images/brand', l.fetch('file')) } +
         kit.fetch('images').map { |i| File.join(folder, i.fetch('file')) } +
         [File.join(folder, 'zak-winnick.jpg')] + texts.keys.map { |name| File.join(folder, name) }
raise 'Asset names must be unique' unless assets.map { |p| File.basename(p) }.uniq.size == assets.size
assets.each { |path| raise "Missing public asset: #{path}" unless File.file?(path) }
Dir.mktmpdir('rangeway-press-pack-') do |staging|
  assets.each do |path|
    dest = File.join(staging, File.basename(path))
    FileUtils.cp(path, dest)
    File.chmod(0o644, dest)
    File.utime(Time.utc(2026, 10, 1), Time.utc(2026, 10, 1), dest)
  end
  names = assets.map { |p| File.basename(p) }.sort
  raise 'ZIP generation failed' unless system('zip', '-X', '-q', 'press-kit.zip', *names, chdir: staging)
  FileUtils.cp(File.join(staging, 'press-kit.zip'), File.join(downloads, 'rangeway-press-kit.zip'))
end
puts "Built press kit: #{assets.size} public files"
