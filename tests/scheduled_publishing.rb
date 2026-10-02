require 'tmpdir'
require 'fileutils'
require 'time'
require 'jekyll'

implementation = File.expand_path('../scripts/scheduled_build.rb', __dir__)
abort 'FAIL: no server-side scheduled builder exists' unless File.file?(implementation)
require implementation

def check(value, message)
  raise message unless value
end

Dir.mktmpdir('rangeway-schedule-test-') do |dir|
  source = File.join(dir, 'source')
  output = File.join(dir, 'output')
  FileUtils.mkdir_p(File.join(source, '_posts'))
  File.write(File.join(source, '_config.yml'), "timezone: America/Los_Angeles\nfuture: false\n")
  File.write(File.join(source, 'index.html'), "---\n---\n{% for post in site.posts %}<a href=\"{{ post.url }}\">{{ post.title }}</a>{% endfor %}")
  File.write(File.join(source, 'feed.xml'), "---\n---\n<rss><channel>{% for post in site.posts %}<item><title>{{ post.title }}</title></item>{% endfor %}</channel></rss>")
  File.write(File.join(source, '_posts/2026-10-02-scheduled.md'), "---\ntitle: Scheduled story\ndate: 2026-10-02 07:00:00 -0700\n---\nApproved article body.\n")
  File.write(File.join(source, '_posts/2026-10-02-held.md'), "---\ntitle: Held story\ndate: 2026-10-02 06:00:00 -0700\npublished: false\n---\nDo not publish.\n")

  ScheduledBuild.build(source: source, destination: output, now: Time.iso8601('2026-10-02T13:59:59Z'))
  check(!File.read(File.join(output, 'index.html')).include?('Scheduled story'), 'Story appeared before scheduled time')
  check(!File.read(File.join(output, 'feed.xml')).include?('Scheduled story'), 'Story leaked into RSS early')
  check(Dir.glob(File.join(output, '**/*scheduled.html')).empty?, 'Direct article URL published early')

  ScheduledBuild.build(source: source, destination: output, now: Time.iso8601('2026-10-02T14:00:00Z'))
  check(File.read(File.join(output, 'index.html')).include?('Scheduled story'), 'Due story missing from homepage')
  check(File.read(File.join(output, 'feed.xml')).include?('Scheduled story'), 'Due story missing from RSS')
  check(Dir.glob(File.join(output, '**/*scheduled.html')).length == 1, 'Due article was not generated')
  check(!File.read(File.join(output, 'index.html')).include?('Held story'), 'Held story was published')

  # Explicit winter offsets must remain distinct from summer Pacific time.
  File.write(File.join(source, '_posts/2026-12-02-winter.md'), "---\ntitle: Winter story\ndate: 2026-12-02 07:00:00 -0800\n---\nWinter body.\n")
  ScheduledBuild.build(source: source, destination: output, now: Time.iso8601('2026-12-02T14:59:59Z'))
  check(!File.read(File.join(output, 'index.html')).include?('Winter story'), 'Winter story appeared an hour early')
  ScheduledBuild.build(source: source, destination: output, now: Time.iso8601('2026-12-02T15:00:00Z'))
  check(File.read(File.join(output, 'index.html')).include?('Winter story'), 'Winter story missing at 7am Pacific')
end
puts 'PASS: pre-publication exclusion, exact due time, RSS, article URL, held posts, and Pacific winter time'
