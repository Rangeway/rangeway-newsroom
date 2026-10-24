source "https://rubygems.org"

# GitHub Pages is disabled; the VPS publisher builds with scripts/scheduled_build.rb.
# These pins match what github-pages 232 provided, so the generated site is unchanged.
gem "jekyll", "3.10.0"
gem "kramdown-parser-gfm", "1.1.0"

group :jekyll_plugins do
  gem "jekyll-feed", "0.17.0"
  gem "jekyll-seo-tag", "2.8.0"
end

# The editorial and Media Kit tests parse the built HTML.
gem "nokogiri", "~> 1.19"

# Formerly pulled in by github-pages; leaving the standard library in Ruby 3.4.
gem "base64", "0.3.0"
gem "bigdecimal", "4.1.2"

# Lock to webrick for Ruby 3.0+
gem "webrick", "~> 1.8"

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1", :platforms => [:mingw, :x64_mingw, :mswin]
