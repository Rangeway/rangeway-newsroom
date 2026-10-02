# Newsroom editorial production rollout

## Goal

Integrate the user-approved editorial preview into the real Jekyll Newsroom and deploy to newsroom.rangeway.co. The user explicitly selected production deployment; do not ask again about merge/deployment. Work in the existing clean Newsroom checkout on a temporary codex branch, not the unrelated main-site worktree.

## Global Constraints

- Preserve every article body, source frontmatter, existing URL, feeds, and scheduled publishing. Never publish future posts early.
- Match the approved preview at /Users/zakwinnick/.codex/visualizations/2026/08/19/01a01bd2-0844-7d43-85e5-57f15b9e73da/newsroom-editorial (build.mjs and style.css). Do not copy the six-page static preview as production.
- SVG wordmark; Raleway and Source Sans 3; charcoal #282A29, cream #F5EBDD, sage #505B4D, amber #F4A855. Follow system light/dark setting.
- Keep the live Fireside latest-episode iframe, including the approved 680px container breakpoint with 200px desktop player height. No hardcoded episode.
- Generate article sidebar links from H2/H3 headings, sticky desktop and hidden mobile. Do not add internal notes or mockup labels.
- Keep Tinylytics, canonical URLs, social metadata, media-kit downloads, social sharing, and full archives functioning.
- Scope: Newsroom only. Do not change Rangeway main site, Investors, article prose, or publishing dates.
- Archive current production before deployment. Root has verified backup /var/backups/rangeway-newsroom/20261001-editorial-launch/site/index.html.

### Task 1: Integrate approved design with the real Jekyll content

Ownership: all Newsroom presentation source and focused integration tests; no content collection edits, no remote changes or pushes. Root handles independent baseline capture, browser QA and deployment. You are not alone in the checkout; preserve others' edits.

Files:
- Add assets/css/editorial.css from approved preview, assets/js/editorial.js.
- Replace _includes/header.html and footer.html presentation while preserving head metadata and feeds. Shared default layout remains.
- Add reusable editorial card/meta includes and shared article layout; update post, press-release and case-study wrappers. Keep article body wrapper .article__body for regression comparison, with prose style. Render {{ content }} intact.
- Replace index.html with dynamic lead latest published post; subsequent latest three posts plus latest press release and latest case study as five-card grid. Preserve approved homepage hierarchy. Real links; filters; links to full blog/press/case archives.
- Restyle blog.html, press.html and case-studies.html as complete dynamic archives with shared cards.
- Bring media-kit.html into shared editorial shell, preserving its existing content/downloads. Existing standalone brand.html guide may remain as refreshed utility guide.
- Add regression tests and brief maintenance notes. _config.yml must exclude docs, tests, scripts and development-only files from output; update cache version. Preserve future:false.

Implementation details:
1. Inspect current templates and approved preview. Prefer Liquid over generating static article copies. Preserve existing content files byte-for-byte.
2. Retain responsive CSS, dark media query, reduced-motion, accessible focus and mobile nav. Use DOM APIs to populate TOC safely (textContent), preserve existing heading IDs and create unique IDs where missing. Sidebar hidden if no headings. No JS dependency for content reading.
3. Metadata uses real title, excerpt/description, date, author, hero image; optional fields degrade gracefully. Do not invent dates or authors. Preserve PDF links/contact information on press/case articles and share links.
4. Full content lists filter publication dates and preserve complete archives. Future:false remains authoritative for posts.
5. Test dynamic homepage, every article URL/content wrapper, archives, metadata/assets, future-post absence. Ruby/Nokogiri available via PATH=/Users/zakwinnick/.rbenv/versions/3.3.11/bin:$PATH bundle exec ruby. Local Jekyll serve/build may be used for validation; production CI is authoritative.
6. Start integrated local server at 127.0.0.1:4341 (jekyll serve), report readiness for root UI QA. Commit scoped implementation to current codex branch after test pass, no push. Report tests and concerns in task report file supplied by controller.

### Task 2: Review, browser verification and release (root)

- [x] Confirm clean source and origin/main b16ef8c.
- [x] Archive current live output and verify archive index.
- [ ] Capture baseline article bodies/routes/feeds before integration.
- [ ] Review Task 1 diff, fix important findings, verify new build against baseline.
- [ ] Browser-test home, archives, representative post/press/case/media pages, mobile nav, TOC, system dark mode and Fireside clipping.
- [ ] Final whole-branch review. Merge authorized release to main and push after all gates pass.
- [ ] Wait for deploy workflow and server pull; verify actual HTTPS output, assets, article route, widget and screenshot.
- [ ] Report production URL and archived rollback availability.
