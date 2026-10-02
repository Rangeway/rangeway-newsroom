# Deploy & Ops — Rangeway Newsroom

The Newsroom is served by Nginx at https://newsroom.rangeway.co from
/var/www/rangeway-newsroom on the Rangeway VPS (72.60.71.39).

## Publishing

Push approved changes to main. The dedicated server timer
rangeway-newsroom-publish.timer checks main and builds every minute. It runs
content, feed, archive, and Media Kit checks before syncing the generated site.
A failed fetch uses the last fetched source so already-scheduled posts can still
publish during a GitHub outage. A failed build or validation leaves the live site
unchanged. Inspect errors in the service journal; last-success records the source
commit and the last successful UTC publication time.

GitHub Actions independently runs build and publication-boundary tests on pushes.
It is not the production scheduling clock. The old deploy-dist branch is no longer
consumed for this repository; other sites still use the shared pull-deploy timer.

## Scheduling posts

Use an explicit Pacific UTC offset in front matter:

    date: 2026-10-02 07:00:00 -0700

Use -0700 during daylight saving time and -0800 during standard time. Bare YAML
timestamps can be parsed as UTC, so do not rely on an unquoted offset-free date.
Keep future: false. Set published: false to hold an article regardless of date.
A due post should appear after the next one-minute timer tick plus build time;
this is not an exact-to-the-second publication guarantee.

Blog posts are excluded from output before their date. Press-release listings
and RSS also apply their existing date filters. Never use --future for production.

## Server components

- /usr/local/bin/rangeway-newsroom-publish (source: ops/rangeway-newsroom-publish)
- /etc/systemd/system/rangeway-newsroom-publish.service and .timer
- /var/lib/rangeway-newsroom/repository.git: source cache, main only
- /var/lib/rangeway-newsroom/runtime: tested Ruby 3.3.12 Linux runtime
- /var/lib/rangeway-newsroom/bundle-tested: matching locked Ruby dependencies
- /var/lib/rangeway-newsroom/last-success: last successful source revision and UTC time

The service runs as deploy with write access limited to its state and Newsroom
webroot. Source, tests, and operational files are never served. Dependencies are
installed separately from publication; when Gemfile.lock changes, install the
new locked bundle before relying on scheduled publication.
The validation workflow's optional package_runtime input produces a tested
Ruby 3.3.12 Linux runtime and dependency archives. Install the pair together and
validate on the VPS before enabling the timer. Do not mix native gems compiled
for GitHub's Ruby with Ubuntu's differently-linked system Ruby. The publisher
explicitly invokes the matching runtime and library path.

Read-only checks:

    systemctl status rangeway-newsroom-publish.timer
    journalctl -u rangeway-newsroom-publish.service -n 80 --no-pager
    cat /var/lib/rangeway-newsroom/last-success

Manual publication, when authorized:

    systemctl start rangeway-newsroom-publish.service

## Local verification

    bundle exec ruby tests/scheduled_publishing.rb
    bundle exec ruby scripts/scheduled_build.rb "$PWD" "$PWD/_site"
    bundle exec ruby tests/editorial_integration.rb
    bundle exec ruby tests/media_kit.rb

Scheduling tests cover pre-date exclusion, exact due-time inclusion, homepage,
RSS, direct article output, held posts, and explicit Pacific winter offsets.

## Rollback

Stop the dedicated timer before restoring a prior site archive. To return to the
old deployment mechanism, also restore the saved /etc/rangeway-deploy.conf and
previous workflow. Do not leave both publishers writing the Newsroom webroot.
Backups live outside the webroot under /var/backups.

## Hosting

TLS uses Let's Encrypt. DNS is Cloudflare DNS-only. GitHub Pages is disabled.
The workflow and ops files are maintained here; installing changed systemd or
publisher files requires a deliberate server deployment, not merely a Git push.
