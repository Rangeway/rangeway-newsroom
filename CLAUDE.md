# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Rangeway Newsroom is a Jekyll-based static site serving as the media center for Rangeway Energy (America's premier scenic highway EV charging network). Hosted on GitHub Pages at https://newsroom.rangeway.energy.

## Common Commands

```bash
# Local development server
bundle exec jekyll serve

# Build for production
bundle exec jekyll build

# Install dependencies (first time only)
bundle install
```

## Architecture

### Content Collections

Three Jekyll collections with distinct layouts:

- **`_posts/`** - Blog articles (format: `YYYY-MM-DD-slug.md`, layout: `post`)
- **`_press_releases/`** - Official announcements (format: `YYYY-MM-DD-slug.md`, layout: `press-release`)
- **`_case_studies/`** - Case studies (format: `slug.md`, no date required, layout: `case-study`)

### Key Directories

- `_layouts/` - Page templates (default, post, press-release, case-study)
- `_includes/` - Reusable components (header, footer, content-hero, related-content, social-share)
- `assets/css/` - Stylesheets (style-main.css is primary)
- `assets/images/` - Image assets
- `assets/downloads/` - PDF files for press releases/case studies

### RSS Feeds

Multiple feeds generated automatically:
- `/feed.xml` - All content
- `/feed-blog.xml` - Blog posts only
- `/feed-press.xml` - Press releases only
- `/feed-case-studies.xml` - Case studies only

## Content Front Matter

### Blog Post
```yaml
layout: post
date: YYYY-MM-DD HH:MM:SS
author: Author Name
title: "Article Title"
description: "SEO description (160 chars max)"
category: blog
image: /assets/images/blog-image.jpg  # Optional
```

### Press Release
```yaml
layout: press-release
date: YYYY-MM-DD HH:MM:SS
title: "Release Title"
description: "SEO description"
image: /assets/images/press-image.jpg  # Optional
pdf: /assets/downloads/release.pdf     # Optional
```

### Case Study
```yaml
layout: case-study
title: "Case Study Title"
subtitle: "Optional subtitle"
description: "SEO description"
pdf: /assets/downloads/case-study.pdf  # Optional
```

## Deployment

- **Automatic:** Push to `main` branch triggers GitHub Pages build (live in 1-2 minutes)
- **Scheduled:** GitHub Actions runs daily at 14:00 UTC (6:00 AM PST) to trigger rebuilds
- Check Actions tab for build status (green checkmark = success)

## Brand System

### Colors
- Sunset Coral (#F09060) - Primary brand color
- Golden Highway (#FFB366) - Accent/highlights
- Mountain Charcoal (#4A4A4A) - Typography
- Ocean Deep (#2C5F7C) - CTA sections

### Typography
- Headlines: Montserrat (Google Fonts)
- Body: Source Sans Pro (Google Fonts)

### Design Features
- Automatic light/dark mode based on system preference
- CSS variables in style-main.css control theming
- Asset versioning via `asset_version` in _config.yml for cache busting

## Key Configuration

- Jekyll config: `_config.yml`
- Custom domain: `CNAME` file (newsroom.rangeway.energy)
- GitHub Actions: `.github/workflows/scheduled-build.yml`
