# About Rook

Company overview · New hire packet, section 1 · Revised July 2026

## What we do
Rook Industries builds coordination and provisioning software for the protective-response sector. Publicly we are a logistics and workforce-coordination vendor serving emergency services. Our actual customers are independently operating masked responders themselves, and the handlers and quartermasters who keep them in the field.
Rook does not employ responders. We sell software directly to them and to the handlers who look after them. When a responder is unhappy with the product we hear about it from their handler, and on two occasions through a wall.

## The company
- Founded 2014. Headquartered at Site Aleph, a converted research station set into a Pleistocene ice shelf. It predates the company, arrived with the 2014 asset purchase, and the lease terms were extremely favorable.
- Regional offices in Berlin, Singapore, and a decommissioned lighthouse on the Cornish coast, also part of the asset purchase, for reasons nobody has established. Site Aleph is served by scheduled transport twice weekly, so most staff work remotely — not a benefit, a consequence.
- 241 employees, of whom 240 have never met a responder.
- Revenue is subscription, priced per active responder. Responders who are temporally non-linear are billed as one seat. This was litigated.

## Our two products
| Product | What it does | Who uses it |
| --- | --- | --- |
| Rook Dispatch | Responder coordination: availability, proximity, who gets pinged about a callout, and whether they take it. | Handlers; responders on their phones. |
| Rook Supply | Gear provisioning: requisitions, maintenance, failure reports. | Handlers and quartermasters. |

We ship monthly on a release train, and point releases carry a 4.x number. Support runs three tiers; tickets filed from inside an active callout bypass the queue, a category we did not anticipate needing.

## A note on confidentiality
Responder cover identities are never stored in production. We hold capability tags, availability windows and callout history; the mapping to a legal identity is never our business, and we have no way to reconstruct it. This is contractual, not a preference — read Security Policy 4.1 before designing anything that touches responder records.
Do not attempt to work out who anyone is. Two people have been let go for this. One of them was correct.
