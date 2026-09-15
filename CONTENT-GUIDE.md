# Rangeway Newsroom - Content Management Guide

Complete guide to adding, editing, and removing content from the Rangeway Energy Newsroom.

## Table of Contents
- [Adding Content](#adding-content)
  - [Press Releases](#adding-a-press-release)
  - [Blog Posts](#adding-a-blog-post)
  - [Case Studies](#adding-a-case-study)
- [Editing Content](#editing-content)
- [Removing Content](#removing-content)
- [Publishing Workflow](#publishing-workflow)
- [Adding Media](#adding-media)
- [Markdown Reference](#markdown-reference)
- [Tips & Best Practices](#tips--best-practices)

---

## Adding Content

### Adding a Press Release

1. Create a new file in `_press_releases/` folder
2. Name it: `YYYY-MM-DD-title.md` (e.g., `2024-11-15-series-a-funding.md`)
3. Use this template:

```markdown
---
layout: press-release
title: "Your Press Release Title Here"
date: 2024-11-15
description: "Brief summary for SEO (160 chars max)"
pdf: /assets/downloads/press-release-name.pdf  # Optional - for downloadable PDF
image: /assets/images/press-image.jpg  # Optional - for featured image
---

**CITY, STATE - Date** - Your press release content here...

## Subheading

More content with full Markdown support...

### Key Points
- Bullet point one
- Bullet point two
- Bullet point three

## About Rangeway Energy

Rangeway Energy is building America's premier electric vehicle charging network for scenic corridors. Every Rangeway location features climate-controlled indoor lounges, premium cafés, and ultra-fast charging infrastructure—eliminating the parking lot waits that plague traditional EV charging.

### Media Contact
**Email:** media@rangeway.co
**Phone:** (650) 420-6300
```

**Example filename:** `2024-11-15-seed-funding-announcement.md`

---

### Adding a Blog Post

1. Create a new file in `_posts/` folder
2. Name it: `YYYY-MM-DD-title.md` (e.g., `2024-11-15-behind-the-scenes.md`)
3. Use this template:

```markdown
---
layout: post
title: "Your Blog Post Title"
date: 2024-11-15
author: Your Name  # Optional
category: blog
description: "Brief summary for SEO and social sharing"
---

Your blog content here in Markdown format...

## Use Headings to Structure Content

Write naturally, as if you're telling a story. Markdown makes it easy.

### Subheadings Help Organize

**Bold text** for emphasis and *italic text* for subtle emphasis.

## Adding Lists

Unordered lists:
- First point
- Second point
- Third point

Numbered lists:
1. First step
2. Second step
3. Third step

## Adding Links

[Link to main site](https://rangeway.co)

## Adding Images

![Description of image](/assets/images/your-image.jpg)

## Adding Quotes

> "This is a blockquote. Perfect for highlighting key statements or testimonials."

---

*Want to stay updated? Subscribe to our [Field Notes newsletter](https://fieldnotes.rangeway.co).*
```

**Example filename:** `2024-11-15-construction-update-baker.md`

---

### Adding a Case Study

1. Create a new file in `_case_studies/` folder
2. Name it: `descriptive-name.md` (no date needed - e.g., `baker-construction-timeline.md`)
3. Use this template:

```markdown
---
layout: case-study
title: "Case Study Title"
subtitle: "Optional subtitle or tagline"
description: "Brief summary for SEO"
pdf: /assets/downloads/case-study-name.pdf  # Optional
---

## Challenge

Describe the problem or challenge being addressed...

### Key Issues
- Issue one
- Issue two
- Issue three

## Solution

Explain how Rangeway approached the solution...

### Implementation
1. First step taken
2. Second step taken
3. Third step taken

## Results

Present the outcomes with data and metrics...

### Key Metrics
- **Metric 1:** Result (e.g., "99% uptime")
- **Metric 2:** Result (e.g., "15-min average charge time")
- **Metric 3:** Result (e.g., "500+ travelers served daily")

## Conclusion

Summarize the impact and learnings...
```

**Example filename:** `death-valley-corridor-impact.md`

---

## Editing Content

### To Edit Existing Content:

1. **Find the file:**
   - Press releases: `_press_releases/`
   - Blog posts: `_posts/`
   - Case studies: `_case_studies/`

2. **Edit the Markdown file:**
   - Change text content
   - Update metadata (title, date, description)
   - Add/remove sections

3. **Save the file**

4. **Commit and push to GitHub** (changes go live automatically)

### Example Edit Workflow:
```bash
# Navigate to the newsroom directory
cd /Users/zakwinnick/Documents/GitHub/rangeway-newsroom

# Edit a file
nano _press_releases/2024-11-02-baker-basecamp-announcement.md

# Save changes and commit
git add .
git commit -m "Update Baker Basecamp press release with new details"
git push origin main
```

---

## Removing Content

### To Remove Content:

1. **Delete the file** from the appropriate folder
2. **Commit and push to GitHub**

```bash
# Delete a press release
rm _press_releases/2024-10-15-old-announcement.md

# Commit the deletion
git add .
git commit -m "Remove outdated press release"
git push origin main
```

**Note:** Deleted content is still in Git history if you need to recover it.

---

## Publishing Workflow

### Option 1: GitHub Web Interface (Easiest - No Technical Setup)

Perfect for quick updates and non-technical team members.

1. Go to **github.com/[your-username]/rangeway-newsroom**
2. Navigate to the appropriate folder:
   - `_press_releases/` for press releases
   - `_posts/` for blog posts
   - `_case_studies/` for case studies
3. Click **"Add file" → "Create new file"**
4. Name your file with the correct format (see above)
5. Paste your content using the Markdown templates
6. Click **"Commit changes"**
7. Add a commit message (e.g., "Add press release about funding")
8. Click **"Commit changes"** again

**✅ Your content goes live automatically in 1-2 minutes!**

---

### Option 2: Local Development + Git (More Control)

For power users who want to preview locally before publishing.

```bash
# Navigate to newsroom directory
cd /Users/zakwinnick/Documents/GitHub/rangeway-newsroom

# Create a new press release
nano _press_releases/2024-11-15-my-announcement.md
# Write your content, save with Ctrl+O, Enter, then Ctrl+X to exit

# Preview locally (optional)
bundle exec jekyll serve
# Visit http://localhost:4000 to preview

# Commit and push when ready
git add .
git commit -m "Add press release about [topic]"
git push origin main

# Changes go live in 1-2 minutes
```

---

## Adding Media

### Adding Images

1. **Upload images to `assets/images/`**
   ```bash
   # Via command line
   cp ~/Desktop/my-image.jpg assets/images/
   ```

   Or via GitHub web interface:
   - Navigate to `assets/images/`
   - Click "Add file" → "Upload files"
   - Drag and drop your images

2. **Reference images in your content:**
   ```markdown
   ![Description of image](/assets/images/my-image.jpg)
   ```

3. **For featured images in press releases:**
   ```markdown
   ---
   image: /assets/images/press-release-hero.jpg
   ---
   ```

---

### Adding Downloadable PDFs

1. **Upload PDFs to `assets/downloads/`**
   ```bash
   cp ~/Desktop/press-release.pdf assets/downloads/
   ```

2. **Reference in front matter:**
   ```markdown
   ---
   pdf: /assets/downloads/press-release.pdf
   ---
   ```

3. **A download button appears automatically** on press releases and case studies

---

## Markdown Reference

### Headings
```markdown
# Heading 1 (Page Title)
## Heading 2 (Major Section)
### Heading 3 (Subsection)
#### Heading 4 (Minor Section)
```

### Text Formatting
```markdown
**Bold text**
*Italic text*
***Bold and italic***
~~Strikethrough~~
```

### Links
```markdown
[Link text](https://rangeway.co)
[Link with title](https://rangeway.co "Rangeway Homepage")
```

### Images
```markdown
![Alt text](/assets/images/image.jpg)
![Alt text with title](/assets/images/image.jpg "Image caption")
```

### Lists

**Unordered:**
```markdown
- First item
- Second item
  - Nested item
  - Another nested item
- Third item
```

**Ordered:**
```markdown
1. First item
2. Second item
3. Third item
```

### Quotes
```markdown
> This is a blockquote.
> It can span multiple lines.
```

### Code
```markdown
Inline `code` looks like this.

```
Block code
looks like this
```
```

### Horizontal Rule
```markdown
---
```

### Tables
```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

---

## Tips & Best Practices

### File Naming
✅ **DO:**
- `2024-11-15-seed-funding-announcement.md`
- `2024-12-01-baker-construction-update.md`
- `ev-charging-infrastructure-study.md`

❌ **DON'T:**
- `Press Release Nov 15.md` (no spaces, no generic names)
- `Announcement.md` (not descriptive enough)
- `11-15-2024-news.md` (wrong date format)

### SEO Descriptions
- Keep under 160 characters
- Include key terms naturally
- Make it compelling (this shows in search results and social shares)

### Dates
- Always use `YYYY-MM-DD` format for press releases and blog posts
- Case studies don't require dates in filenames

### Testing Before Publishing
```bash
# Run Jekyll locally to preview
bundle exec jekyll serve

# Visit http://localhost:4000
# Check that everything looks right
# Then commit and push
```

### Commit Messages
Write clear commit messages:
- ✅ "Add press release about Series A funding"
- ✅ "Update Baker Basecamp construction timeline"
- ✅ "Fix typo in November blog post"
- ❌ "Update" (too vague)
- ❌ "Changes" (not helpful)

### Content Guidelines
- **Press Releases:** Formal, factual, include boilerplate at end
- **Blog Posts:** Conversational, storytelling, educational
- **Case Studies:** Data-driven, problem/solution/results format

### When Content Goes Live
- Changes typically deploy in **1-2 minutes** after pushing to GitHub
- Check the "Actions" tab on GitHub to see build status
- Green checkmark = successfully deployed
- Red X = build failed (check error messages)

---

## Example Files

Check these files in the repo for reference:

### Press Release Example
`_press_releases/2024-11-02-baker-basecamp-announcement.md`

### Blog Post Example
`_posts/2024-11-01-why-indoor-comfort-matters.md`

### Case Study Example
(Add your first case study to see the format in action)

---

## Need Help?

### Common Issues

**Q: My content isn't showing up**
- Check that the filename is formatted correctly
- Ensure the date isn't in the future
- Look at the GitHub Actions tab for build errors

**Q: Images aren't displaying**
- Check the image path starts with `/assets/images/`
- Ensure the image file was committed to the repo
- Verify the filename matches exactly (case-sensitive)

**Q: How do I preview before publishing?**
- Run `bundle exec jekyll serve` locally
- Or use a separate branch and merge when ready

### Contact
For questions about the newsroom site: **media@rangeway.co**

---

## Quick Start Checklist

- [ ] Clone or navigate to newsroom repo
- [ ] Create content file in appropriate folder
- [ ] Use correct filename format (with date if needed)
- [ ] Copy template from this guide
- [ ] Write your content in Markdown
- [ ] Add images/PDFs to assets if needed
- [ ] Commit with clear message
- [ ] Push to GitHub
- [ ] Wait 1-2 minutes and verify live site

---

*Last updated: November 2024*
