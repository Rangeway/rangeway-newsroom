require 'jekyll'

# The VPS supplies the clock; the publication date remains owned by front matter.
module ScheduledBuild
  def self.build(source:, destination:, now: Time.now)
    Dir.chdir(source) do
      config = Jekyll.configuration(
        'source' => source,
        'destination' => destination,
        'config' => File.join(source, '_config.yml'),
        'future' => false,
        'time' => now,
        'incremental' => false
      )
      ENV['TZ'] = config['timezone'] if config['timezone']
      Jekyll::Site.new(config).process
    end
  end
end

if $PROGRAM_NAME == __FILE__
  abort 'Usage: scheduled_build.rb SOURCE DESTINATION' unless ARGV.length == 2
  ScheduledBuild.build(source: File.expand_path(ARGV[0]), destination: File.expand_path(ARGV[1]))
end
