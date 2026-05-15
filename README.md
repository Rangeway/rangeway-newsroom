# Rangeway Newsroom

Official newsroom for Rangeway - America's premier scenic highway EV charging network. Built with Jekyll and hosted on GitHub Pages.

## About

The Rangeway newsroom serves as the media center for Rangeway, featuring:
- Press releases
- Case studies
- Company blog
- Media kit and brand assets
- RSS feeds for all content types

**Live URL:** https://newsroom.rangeway.energy

## Brand Guidelines Implementation

### Brand Colors (Current)
- **Sunset Coral** (#F09060) - Primary brand color
- **Golden Highway** (#FFB366) - Accent and highlights
- **Mountain Charcoal** (#4A4A4A) - Typography and grounding
- **Coastal Cream** (#F5DEB3) - Supporting color
- **Ocean Deep** (#2C5F7C) - CTA sections
- **Fog Gray** (#B8B8B8) - Secondary text

### Typography
- **Montserrat** - Headlines (h1-h4), bold, generous letter-spacing
- **Source Sans Pro** - Body copy and UI elements

### Design Features
- Automatic light/dark mode based on system preference
- Full-color gradient logo (Sunset Coral to Golden Highway)
- Modern card-based layouts with clickable cards
- Smooth transitions and hover effects
- Responsive mobile-first design

## Site Structure

```
rangeway-newsroom/
├── _config.yml           # Jekyll configuration
├── _layouts/             # Page templates
│   ├── default.html
│   ├── post.html
│   ├── press-release.html
│   └── case-study.html
├── _includes/            # Reusable components
│   ├── header.html
│   └── footer.html
├── _press_releases/      # Press release collection
├── _case_studies/        # Case study collection
├── _posts/               # Blog posts
├── assets/
│   ├── css/
│   │   ├── style-main.css
│   │   ├── style.css
│   │   └── modern.css
│   └── images/
├── index.html            # Homepage
├── press.html            # Press releases archive
├── case-studies.html     # Case studies archive
├── blog.html             # Blog archive
├── media-kit.html        # Media kit page
├── CNAME
└── Gemfile
```

## Local Development

### Prerequisites
- Ruby (2.6+)
- Jekyll and Bundler

### Setup

1. Install dependencies:
```bash
gem install jekyll bundler
bundle install
```

2. Run the site locally:
```bash
bundle exec jekyll serve
```

3. View at `http://localhost:4000`

### Building

```bash
bundle exec jekyll build
```

## Adding Content

### Press Release

Create a new file in `_press_releases/` with the format `YYYY-MM-DD-title.md`:

```markdown
---
layout: press-release
title: "Your Press Release Title"
date: 2024-11-02
description: "Brief description for SEO"
---

Your press release content here...
```

### Blog Post

Create a new file in `_posts/` with the format `YYYY-MM-DD-title.md`:

```markdown
---
layout: post
title: "Your Blog Post Title"
date: 2024-11-02
author: Author Name
category: blog
---

Your blog content here...
```

### Case Study

Create a new file in `_case_studies/` with any filename:

```markdown
---
layout: case-study
title: "Case Study Title"
subtitle: "Optional subtitle"
---

Your case study content here...
```

## Deployment

This site is configured for GitHub Pages. Push to the main branch and GitHub will automatically build and deploy.

### Custom Domain Setup

1. In repository settings, add `newsroom.rangeway.energy` as custom domain
2. Add CNAME record in DNS pointing to your GitHub Pages URL
3. Enable HTTPS in repository settings

## Brand Consistency

This site uses the same design system as the main Rangeway site (rangeway.co), ensuring brand consistency across all properties.

**Note:** The main site (rangeway.co) has been updated to Version 4.0 with new brand colors:
- Warm (#f4a855)
- Charcoal (#2d2d2d)
- Cream (#f5f1eb)
- Sage (#4a5d52)

The newsroom may be updated to match in a future release.

## RSS Feeds

- **All content:** `/feed.xml`
- **Press releases:** `/press/feed.xml`
- **Blog posts:** `/blog/feed.xml`

## Contact

For media inquiries: media@rangeway.co

---

Last Updated: December 2025
