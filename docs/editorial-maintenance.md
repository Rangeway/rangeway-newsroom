# Newsroom editorial maintenance

The public templates read Jekyll content directly. Add stories in `_posts/`, announcements in `_press_releases/`, and case studies in `_case_studies/`; no homepage card list needs hand editing. Keep each item's existing URL and frontmatter when revising it. The homepage leads with the latest published post, then shows the next three posts, newest release, and newest case study. The `.html` and slash archive URLs render the same complete collections.

Use a real `date` for scheduling. `future: false` hides future posts; collection lists also filter by `site.time`. Never set `--future` for a production build. Optional `subtitle`, `description`, `author`, `image`, and `pdf` fields are used only when present. A missing heading table of contents is hidden by the small editorial script; article text remains readable without JavaScript.

The shared layout is `_layouts/article.html`. Article Markdown is rendered unmodified inside `.article__body`; keep metadata, downloads, sharing, and related links outside that wrapper. Presentation lives in `assets/css/editorial.css` and `assets/js/editorial.js`. The Media Kit adds `assets/css/media-kit.css`; it no longer loads the legacy stylesheet. The editorial script handles its copy button.

Media Kit public copy and asset names live in `_data/media_kit.yml`. After editing that data, run `ruby scripts/package_media_kit.rb` before building. This regenerates the text downloads and deterministic, allowlisted ZIP; include those generated files in the same commit. The pack contains six SVGs, three concept images, one founder portrait, and four text documents. Never package an entire source folder. Run `bundle exec ruby tests/media_kit.rb` after building to check page/download parity, links, captions, and archive contents. Concept-image captions belong below the image, not over the artwork.

For a local verification, run `bundle exec jekyll build`, then `bundle exec ruby tests/editorial_integration.rb`. Set `BASELINE_DIR` to a saved prior `_site` tree to compare every prior article body and existing feed item title. Site source and the full deployment path are documented in `DEPLOY.md`.
