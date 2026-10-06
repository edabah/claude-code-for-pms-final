# Glossary

Rook terminology · Internal glossary · Maintained by Product Management · Last updated 4 August 2026
If you are new here, read this before your first call with a responder or handler. Several of these words mean something specific at Rook and something looser everywhere else.

## The people
Responder — An individual who takes callouts and goes to incidents. Not a Rook employee — independently operating. Appears in our systems as a record with capability tags and availability, never as a legal identity.
Handler — The person responsible for a specific responder or small group of them — their availability, their gear, their readiness. The handler is usually who is actually clicking around in our product.
Quartermaster — Owner of equipment stock and the approvals on it. A Supply user, rarely a Dispatch one.
Cover identity — A responder's public-facing persona. Rook holds no mapping between a cover identity and a legal identity. Do not design features that assume we do.

## The callout cycle
Callout — A request for a responder to attend an incident. The unit of work in Dispatch.
Ping — A specific callout offered to a specific responder on their phone: this one's yours, are you taking it?
Taken — The responder said yes. The callout is theirs.
Turned down — The responder said no. The ping moves to the next responder.
Missed — Nobody answered before the ping wait ran out. The ping moves to the next responder. Recorded separately from turned down, though both send the callout onward.
Ping wait — How long a ping stays on a responder's phone before it counts as missed and moves on. Set in the release, the same for everyone.
Acceptance rate — Share of pings that are taken rather than turned down or missed. Dispatch's headline metric.
Time-to-accept — Median seconds from ping sent to ping taken. Watched alongside acceptance rate.
Coverage gap — An incident where no available responder carried the required capability tags. Counted separately from a low acceptance rate — a gap means nobody could have gone, not that nobody would.

## How Rook decides who gets pinged
Routing priority — The score Dispatch uses to rank available responders for a given callout, which decides who gets pinged first. Inputs are proximity (as a travel-time estimate), current availability, capability match, and recent acceptance history. Turning down or missing a ping lowers the recent-acceptance component, which lowers the responder's place in the order for later callouts.
Capability tag — A labeled competency on a responder record, matched against what an incident requires. Current tag set includes flight, structural-entry, hazmat-tolerant, cold-weather, aquatic, crowd-management and de-escalation.
Responder Availability Record — The shared record of when a responder is available for callout. Written by Dispatch. Read by Supply for maintenance scheduling.
Mutual aid — Responders in different parts of the city covering callouts for each other when the usual responder is unavailable. Not supported today; on the Q4 exploration list.

## Supply terms you will hear on shared calls
Requisition — A handler's request for equipment, routed to a quartermaster for approval.
Field failure report — A handler's account of gear failing in use. Feeds an item's history and can pull its maintenance forward.
Service interval — How often an item is due for maintenance. Generates the maintenance schedule.
