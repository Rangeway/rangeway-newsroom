# Deploy & Ops — rangeway-newsroom (newsroom.rangeway.co)

Media center / blog / press releases. **Self-hosted on a Hostinger VPS** (not GitHub Pages),
served by Nginx at **https://newsroom.rangeway.co** from `/var/www/rangeway-newsroom/` on
`72.60.71.39`.

## How to deploy
**Push to `main`.** GitHub Actions (`.github/workflows/deploy.yml`) builds Jekyll and rsyncs
`_site/` to the VPS automatically. **You never run `jekyll build` by hand.**
- On failure the live site keeps its last good build; the deploy retries rsync 3×.

## ⭐ Scheduling posts & press releases (the important part)
To publish at a specific date/time, set the item's `date:` in the **future**. Best format —
local time with **no UTC offset** (the `timezone: America/Los_Angeles` config applies Pacific
and handles daylight saving for you):
```yaml
date: 2026-07-01 06:00:00     # goes live ~6:00 AM Pacific on Jul 1
```
- The item stays hidden until that time, then appears **within ~15 minutes**, automatically —
  a `*/15` cron in the deploy workflow rebuilds the site (`future: false`). **No manual build
  or trigger needed** (this replaced the old once-daily rebuild that caused late posts).
- Blog posts (`_posts/`) are gated by `future: false`. Press releases (`_press_releases/`) are
  a collection; the homepage, `/press/`, and `/archive/` filter them with
  `where_exp: "release.date <= site.time"` so future-dated ones stay hidden everywhere.
- **Don't** use malformed offsets like `-800` or `-070`; if you must add an offset, use four
  digits (`-0800` winter / `-0700` summer). Simplest is to omit it (above).
- To unpublish: set the date back to the future, or add `published: false`.

## Local development
Jekyll (github-pages gem). CI uses Ruby 3.3.
```bash
bundle install
bundle exec jekyll serve   # http://localhost:4000  (add --future to preview scheduled items)
bundle exec jekyll build   # _site/
```

## TLS / DNS
- HTTPS via **Let's Encrypt** (certbot on the VPS) — auto-renews.
- DNS at **Cloudflare, DNS-only (grey cloud)**: A record `newsroom.rangeway.co` → `72.60.71.39`.

## Infra notes
- Server path: `/var/www/rangeway-newsroom/`; Nginx server block for `newsroom.rangeway.co`.
- CI auth: SSH deploy key in repo secrets `VPS_SSH_KEY` + `VPS_KNOWN_HOSTS`.
- GitHub Pages is **disabled** for this repo — the VPS is the only host.
- `DEPLOY.md` is in `_config.yml`'s `exclude:` so it is not published.
