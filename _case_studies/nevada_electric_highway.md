---
layout: case-study
title: "The Nevada Electric Highway"
subtitle: "What happens when public capital builds infrastructure without an operator behind it."
description: "A field-grounded look at the Nevada Electric Highway, the $130M+ program that was supposed to electrify the state's corridors, and what its failure modes reveal about how to actually build a charging network that works."
image: /assets/images/nevada-electric-highway.png
pdf: /assets/downloads/nevada-electric-highway.pdf
---

In June 2015, Nevada Governor Brian Sandoval, the Governor's Office of Energy, and NV Energy announced what they called the first state-led electric highway in the country. The plan was straightforward and ambitious: a DC fast charger every 50 miles along every major Nevada corridor by 2020, starting with US 95 between Las Vegas and Reno. The initial incentive budget ran to roughly $15 million. The Volkswagen environmental mitigation settlement later added $22.5 million more. In 2021, the state legislature authorized NV Energy to spend up to $100 million on EV charging through SB448. The Nevada Department of Transportation pulled in another $38 million in federal NEVI funding under the bipartisan infrastructure law.

In total, Nevada had access to more than $130 million in dedicated EV charging capital. Eleven years later, fewer than four dozen stations had been built, the program had gone defunct, and most of what remained on the ground was not working.

This case study is not a critique of the public officials who launched the program. It is a strategic post-mortem on what the Nevada Electric Highway proves about the gap between capital deployment and operational infrastructure. The short version is the thesis Rangeway has built the company around: capital can build chargers, but only operators keep them running. A network without an operator is not a network. It is a depreciating asset that strands drivers.

## Background

Phase I of the Nevada Electric Highway deployed along US 95. The first station opened at Eddie World in Beatty in February 2016, followed by Fox Peak in Fallon in October 2016, then Hawthorne, Tonopah, and Indian Springs. Phase II expanded onto US 93 starting with Panaca, with later extensions onto the US 50 corridor. The hardware spec was consistent across most sites: 50 kilowatt DC fast chargers with CCS and CHAdeMO connectors, deployed in pairs, hosted primarily at gas stations under shared-investment agreements.

By 2026, that hardware is multiple generations behind current ultra-fast equipment, in a market where 350 kilowatt stations are now common and 400 to 800 kilowatt MCS deployments are entering commercial rollout. None of the original deployments included NACS plugs, which were not yet standardized when the hardware was specified.

The Governor's Office of Energy officially wound down the Nevada Electric Highway program in June 2023 and transferred remaining EV infrastructure work to the Nevada Department of Transportation. NDOT, according to the Nevada Independent's March 2026 reporting, failed to obligate its $38 million in federal NEVI funds in time, and Congress subsequently reduced that allocation to roughly $25 million. SB448's $100 million NV Energy authorization has produced limited visible deployment relative to the 120-site, 1,800-port plan it was supposed to fund.

## The field report

In early May 2026, EV reviewer Scott Allison drove a 1,182-mile loop from Las Vegas through Death Valley, up US 395 in California, across Nevada's full US 50 corridor from Reno to Ely, and back to Las Vegas via US 93. He published the trip as both a long-form blog post and a companion video. Allison documented every Nevada Electric Highway-era charger along his route: whether it worked, what it cost, and what it felt like to depend on it. The result is the most current public reliability survey of the network.

| Site | Corridor | Status (May 2026) | Notes |
|------|----------|-------------------|-------|
| Beatty | US 95 | Removed | Charger out of service and physically removed. |
| Fallon | US 50 / US 95 | Offline | Out of service since 2021. Town of nearly 10,000 at a two-highway junction with no working fast charger. |
| Hawthorne | US 95 | Status unverified | Phase I station; not on Scott's route. |
| Tonopah | US 95 | Status unverified | Phase I station; not on Scott's route. |
| Indian Springs | US 95 | Status unverified | Phase I station; not on Scott's route. |
| Silver Springs | US 50 | Working | Two 50 kW chargers. |
| Middlegate Station | US 50 | Offline | Off-grid solar plus battery installation. Hardware bricked after vendor Freewire's bankruptcy. Level 2 (5.7 kW) still functions. |
| Cold Springs Station | US 50 | Working | Two 50 kW chargers, CCS plus CHAdeMO. Charging at $0.95/kWh. |
| Austin (Champs gas station) | US 50 | Working | Two 50 kW chargers at $0.95/kWh. |
| Eureka | US 50 | Offline | Two chargers, both offline. |
| Ely (original Nevada Electric Highway) | US 50 / US 93 | Offline | Failed summer 2024. Function replaced when Tesla opened a V3 supercharger at end of 2024. |
| Panaca | US 93 | Offline | First Phase II station; Lincoln County Power District build. |
| Baker / Border Inn | US 50 | Offline | Both fast chargers out of service. |
| Alamo | US 93 | Partial | Single 50 kW charger. Offline more than a year; restored March 2026 with community advocacy. |

Three observations from Allison's route stand out.

First, the working sites work in spite of the network, not because of it. Cold Springs Station and the Champs gas station in Austin are functioning because their hosts have commercial reasons to keep them running. The maintenance and operational accountability sits with the host, not with the program that funded the install.

Second, the survivor pricing is punitive. Allison paid $0.95 per kilowatt-hour at Cold Springs Station and Austin, which he describes as among the most expensive charging in the country. For a driver crossing a corridor with no alternatives, this is captive pricing on aging hardware. It is not what a healthy network looks like.

Third, the failure at Middlegate Station is the most instructive single data point on the entire route. The site is an off-grid solar and battery installation, conceptually well-located on a corridor that desperately needs reliable charging, and exactly the kind of build that should represent the future of rural EV infrastructure. It is offline because the hardware vendor, Freewire, went bankrupt. The unit cannot be serviced. The vendor's corporate solvency, not the technology itself, is what killed the site.

## Why it failed

The Nevada Electric Highway did not fail because Nevada is too remote or because EVs were too rare. It failed because the program's operating model assumed that building chargers was the hard part. The structural issues:

**No operator accountability.** The program was a build-and-host model. The state and NV Energy funded the hardware. Host businesses operated the sites. Third-party networks handled session management. No single entity was on the hook for whether the chargers worked. When something broke, the host had little incentive to fix it and the original program no longer existed to step in. This is the inverse of how a hospitality business operates. A hotel that loses its housekeeping department does not stay open.

**No revenue model that paid for maintenance.** Charging revenue at the deployed kilowatt levels does not generate enough margin to fund equipment maintenance, network connectivity fees, and replacement reserves, particularly at low-utilization rural sites. Many of the original sites were positioned as a public good, with host agreements requiring free charging for years. Free-charging public goods do not generate the cash flow needed to keep aging hardware operational.

**Hardware vendor concentration risk.** Freewire's bankruptcy bricked the Middlegate installation. Other Nevada Electric Highway sites face similar exposure as their vendors consolidate, pivot, or exit. A network without a viable hardware service-and-support chain is a depreciating asset on a five-to-seven-year half-life.

**No experience layer to retain drivers.** Even when the chargers work, there is nothing to do at most sites except wait. The hosts that have thrived succeeded because they were already destinations. The chargers that sit in empty parking lots have no second product to fall back on when the primary product fails.

**Program discontinuity.** When the Governor's Office of Energy wound down the program in June 2023 and handed remaining work to NDOT, institutional continuity broke. The follow-on $100 million SB448 authorization has produced limited visible deployment. Federal NEVI funds went unspent. Capital allocated is not the same as infrastructure delivered.

> "Renders are easy, execution is the moat." The Nevada Electric Highway had renders. It had ribbon cuttings, press releases, and a governor's vision. What it did not have was an operator on the hook for every driver who pulled in expecting the charger to work.

## What this means for Rangeway

Five things Nevada teaches us about the network we are building.

**The operator is the product.** Public capital can fund chargers. It cannot fund the daily commitment to keeping them online, clean, safe, and worth stopping at. Rangeway exists because that commitment is the actual product. Hardware is a component. The operator is the brand. We think like hotel operators, not utility companies, because Nevada is what happens when you think like a utility.

**Hospitality is the moat.** On Allison's route, the chargers that survived are co-located with destinations that have their own reason to exist. Cold Springs Station has a restaurant. Austin's Champs has a gift shop. Middlegate has the Monster Burger. Drivers gravitate toward places where the stop itself is worth making, even when the charger is slow and expensive. The Rangeway driver's lounge concept at Waystations and Basecamps is the structural answer to this finding, and the Summit format is the same insight extended to overnight stays.

**Reliability is a corridor property, not a site property.** Allison rejected the direct 215-mile US 95 route from Las Vegas and added 967 miles of detour because of how unreliable the corridor was overall. EV drivers route at the corridor level, not the site level. A Rangeway location does not just have to work for the driver pulling in. It has to work for the driver three sites back deciding whether to take that route at all. This is why corridor density and consistent operating standards matter more than any single site's specifications.

**Hardware partner solvency is a procurement criterion.** Freewire's bankruptcy bricked a site that should still be operating. Our exclusive hardware partnership for Rangeway-owned Waystation and Basecamp deployments with an established European manufacturer is not just a quality choice. It is a counterparty risk choice. Long-term serviceability, parts availability, and corporate stability now matter as much as kilowatt rating.

**The opportunity in Nevada is wide open.** Nevada has more than 65,000 EV drivers today and one of the highest EV growth rates in the country. The state's rural corridors are a charging desert. The two corridors that most resemble the Rangeway thesis, US 50 across the Loneliest Road and US 93 between Las Vegas and Ely, are precisely the kind of long-distance leisure routes our network is built to serve. The question is not whether demand exists. The question is who builds the operator-led network that actually shows up.

## Closing

The Nevada Electric Highway is not a story about Nevada. The same pattern is visible in early state-led EV programs across the country wherever public capital was deployed without a long-horizon operator behind it. The per-project funding strategy, owner-operator model, and hospitality-led format mix we have built Rangeway around are the structural answer.

The next time someone asks why we are not chasing a network-wide grant program, the Nevada Electric Highway is the answer.

---

*Primary source: Scott Allison, ["Driving Nevada's Loneliest Highway in an EV,"](https://scottexplains.com/f/driving-nevada%E2%80%99s-loneliest-highway-in-an-ev) scottexplains.com, May 10, 2026, and the companion video on the Scott Explains YouTube channel. Additional reporting from the Nevada Independent ("More than $130M was allocated for EV charger buildout in Nevada. Few were built," March 2026), U.S. News and World Report (September 2024), and program documentation from the Nevada Governor's Office of Energy, NV Energy, and the Nevada Department of Transportation.*

*Rangeway is building America's first hospitality-driven premium EV charging network. Learn more at [rangewayev.com](https://rangewayev.com).*