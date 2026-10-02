# Rangeway Media Kit refresh

Status: proposed design and copy, awaiting written-spec review. No public changes.

## Outcome and scope

Rebuild `/media-kit.html` as a useful press resource within the approved Newsroom editorial design. Zak approved a full refresh after the audit found retired formats and outdated boilerplate. Deliver a working local preview for review before publication. Preserve the existing route and `/media-kit/` redirect.

Refresh directly related factual and usage guidance in `/brand.html`, so the Media Kit does not send journalists to conflicting instructions. Preserve existing brand-guide anchors and approved SVG artwork. Do not redesign unrelated pages, rewrite historical articles, modify scheduled publishing, or change the main or investor sites.

## Design direction

Use the existing editorial/magazine system: Raleway headings, Source Sans 3 body, cream paper, charcoal type, sage surfaces, restrained amber. Preserve the floating navigation, footer, system-driven dark mode, and reduced-motion behavior.

An oversized Media Kit title leads into a compact utility row with the press-pack download and media contact. A narrow section index sits beside the content on desktop; it becomes a wrapping in-page navigation row on mobile. Use ruled sections and generous spacing rather than a repeated card grid.

The memorable visual is a paired charcoal/cream wordmark specimen spread, with immediately usable SVG downloads below each version. Concept images retain their natural composition and have captions below, never badges over the artwork. The founder section pairs an existing portrait with a concise biography and download links.

Alternatives considered: a minimal correction would leave the resource gaps; a separate microsite would duplicate navigation, styling and maintenance. The integrated editorial resource is the recommended approach and follows the approved direction.

## Page structure and proposed public copy

### 1. Media Kit

Company information, brand assets, and images for coverage of Rangeway.

Actions: Download press kit; Contact media team.

Section links: Company / Formats / Logos / Images / Founder / Contact.

### 2. About Rangeway

Rangeway is building a hospitality-first EV charging network. Built on the conviction that EV charging is a hospitality problem, not a utility one, Rangeway treats every stop as an experience worth designing. The stop itself should be worth the time.

Facts: Founded 2025; based in San Francisco, California; founder and CEO Zak Winnick; website rangeway.co. Retain the founding year and location already published in the current Media Kit, without adding headcounts, operating-site totals or growth targets.

Provide a copyable boilerplate and downloadable plain-text company fact sheet. Proposed boilerplate:

> Rangeway is building a hospitality-first EV charging network, shaped by the conviction that the stop itself should be worth the time. Its three destination formats, Waystation, Basecamp, and Summit, bring charging together with indoor comfort, full-service hospitality, and overnight stays at different scales. ChargeVia by Rangeway extends the approach through a gas station-style fast-charging concept that can stand on its own or adapt to existing retail and roadside destinations. Founded by Zak Winnick, whose background includes 15+ years in luxury hospitality operations, Rangeway is based in San Francisco, California. Learn more at rangeway.co.

The three-format sentence describes the progression collectively; the format descriptions below specify what each provides. No blanket lounge promise applies to ChargeVia.

### 3. The formats

- **Waystation:** An automated, unstaffed stop pairing ultra-fast charging with a climate-controlled driver's lounge, premium restrooms, seating, Wi-Fi, and automated retail.
- **Basecamp:** A staffed, full-service destination with a larger driver's lounge, a hospitality-trained on-site team, and food-and-beverage or retail space for a local operator.
- **Summit:** A hospitality destination designed for overnight stays, with Lookouts, a central clubhouse, and off-grid charging.

Display ChargeVia separately from the three-format progression:

**ChargeVia by Rangeway**

The stop that always works.

ChargeVia is Rangeway's gas station-style fast-charging concept, designed to stand on its own or adapt to existing retail and roadside destinations through a flexible site-partner format.

Link to chargevia.net. Do not add a pilot location, host name, equipment selection or opening date.

### 4. Logos and brand essentials

Provide individual download links to existing approved files:

- `assets/images/brand/rangeway-charcoal-amber.svg`
- `assets/images/brand/rangeway-cream-amber.svg`
- `assets/images/brand/rangeway-charcoal-mono.svg`
- `assets/images/brand/rangeway-cream-mono.svg`
- `assets/images/brand/rangeway-icon-charcoal.svg`
- `assets/images/brand/rangeway-icon-cream.svg`

Keep transparent vectors intact; do not recreate lettering or wrap raster images in SVG. Preview cream art on charcoal and charcoal art on cream regardless of system theme.

Public guidance: Use the supplied artwork without stretching, recoloring, or rearranging it. The stylized R is the first letter of the wordmark, not a separate icon beside another full wordmark. Use the cream artwork on dark backgrounds and charcoal artwork on light backgrounds. Contact media@rangeway.co for other uses.

Show the approved palette: sage #505B4D, cream #F5EBDD, charcoal #282A29, amber #F4A855. Link to the reconciled brand guide for further usage guidance. Avoid new licensing or permission claims not established by the current record.

### 5. Concept imagery

Select a small set from imagery already approved for the public main site: an exterior concept, a driver's lounge interior, and the supplied ChargeVia night concept. Verify which files the current production main site uses before copying: the local main-site checkout may be older than production.

Use neutral public filenames and no named-project captions. Every image has an unobtrusive caption below the image identifying it as a concept rendering, plus credit and an actual image download. Do not imply that images show operating properties. Do not publish private source folders, project names, location metadata or unused concepts.

Suggested caption form: “Basecamp concept rendering. Image: Rangeway.” Require captions to accompany editorial reproduction; do not claim broader usage rights. Use the already supplied original image, without AI editing or new generated artwork.

### 6. Founder

**Zak Winnick / Founder and CEO**

Zak Winnick is the founder and CEO of Rangeway. He brings 15+ years in luxury hospitality operations and firsthand experience as an EV driver to the company. His work starts with a simple conviction: charging should feel like hospitality.

Provide the existing main-site `public/images/team/zak-winnick.jpg` portrait and a text biography download. Link to the main site's current team page for the broader team. Do not recreate a roster from older records or include Theo. A founder-focused press resource avoids introducing unsupported titles or biographies for other people.

### 7. Media contact

For interviews, background information, and additional images, contact media@rangeway.co.

Use the existing public media address. Remove the unverified one-business-day response promise. Do not add personal contact information or new service commitments.

## Download package

Create a reproducible, explicitly allowlisted ZIP containing only the six approved SVGs, the selected public concept images, the founder portrait, the company fact sheet, boilerplate, founder biography, and a short image-credit/usage text file. Never zip a repository, context directory, or entire brand-kit folder.

Generate public text downloads from the same content source used by the page, so the boilerplate and facts cannot diverge. Add a build script for packaging and validate every archive entry. Use a stable public URL and update the visible revision date only when the package contents change. No empty download buttons, mailto substitutes for available files, or unfinished resources.

## Brand-guide reconciliation

Replace the old tagline with “Travel farther. Stop better.” Correct “hoteliers” to “hotel operators” and body references to lowercase “driver's lounge.” Qualify destination-format lounge descriptions so they do not promise indoor comfort for every ChargeVia configuration. Remove unapproved loyalty credits/benefit instructions. Retain the current integrated logo, palette, typography, and useful artwork-usage guidance.

## Implementation boundaries

Expected changes: `media-kit.html`, a scoped Media Kit stylesheet, its stylesheet inclusion in `_includes/header.html`, related passages in `brand.html`, maintenance documentation, public allowlisted download assets, packaging script and targeted tests. Remove the Media Kit's legacy `style-main.css` dependency after replacing its legacy classes. Reuse the existing copy-button interaction, with accessible success/failure feedback and selectable text when the clipboard is unavailable.

Do not change article bodies, article URLs, feeds, collection scheduling, Fireside integration, theme behavior, analytics configuration or the deployment destination. Any need to expand beyond these boundaries gets reported before implementation.

## Verification and acceptance

1. Build Jekyll with future posts disabled. Run the existing editorial integration tests against a saved baseline of the current deployed revision.
2. Assert that Trailhead and four-format claims are absent from the refreshed Media Kit and downloads; do not scrub historical articles.
3. Check that Waystation is unstaffed, Basecamp staffed, Summit uses Lookouts, and ChargeVia appears outside the three-format list.
4. Check page content, metadata and archive contents for unannounced sites, financial information, private paths, unsupported launch claims and internal review notes.
5. Validate all local links, SVG/image responses, filename extensions and ZIP contents. Confirm download assets render and preserve transparency.
6. Compare on-page copy and generated text downloads; test successful and failed clipboard interactions and keyboard focus.
7. Visually inspect desktop, tablet and mobile in light and dark system modes. Confirm no horizontal overflow, clipped navigation, illegible logo specimens or unusable image crops. Verify reduced-motion behavior.
8. Open the local preview for Zak. Do not merge, push or deploy without approval of the finished preview.

## Sources and decisions

Checked October 1, 2026: current Newsroom repository at e6438a1; its live Media Kit; maintained Rangeway `BRAND_AND_VOICE.md`, `PEOPLE_AND_PARTNERS.md`, `DECISIONS.md`, `CURRENT_STATE.md`, `SOURCE_MAP.md`, and `INITIATIVES/website-and-design.md`; main-site copy and existing assets. Current explicit user instructions control the content and privacy boundaries. Older repository comments or brand-guide prose do not override maintained brand decisions.

## Work checklist

- [x] Inspect the existing page, design system and available assets.
- [x] Reconcile public copy with maintained brand decisions.
- [x] Record the integrated approach and alternatives.
- [x] Draft page structure, copy, download scope and verification requirements.
- [x] Self-review scope, consistency, disclosure boundaries and acceptance criteria.
- [ ] Obtain written-spec review.
- [ ] Produce the implementation plan, then build and verify the local preview.
- [ ] Obtain finished-preview approval before publication.
