# Rook Dispatch

Product one-pager · Owner: Product Management, Dispatch · Current release 4.2

## The product in one line
Dispatch gets the right responder to the right incident, faster than a human coordinator working from a whiteboard and a phone list.

## The core flow
- An incident arrives in the console, entered by a handler or pushed from an intake system.
- Dispatch ranks every available responder against that incident and produces a routing priority order.
- A ping goes to the highest-ranked responder's phone.
- The responder takes it or turns it down. If they turn it down, or the ping is missed because nobody answered in time, it moves to the next responder in the order.
- A ping taken closes the loop: the responder is marked engaged and the incident is assigned.

## Users
| User | Where | What they do here |
| --- | --- | --- |
| Handler | Web console | Enters incidents, watches coverage, overrides routing when needed, and manages a responder's availability windows and capability tags. |
| Responder | Phone | Receives pings, takes them or turns them down, sets availability. |

## How we measure it
- Callout acceptance rate — the headline metric. Share of pings taken rather than turned down or missed. Reported weekly, in aggregate.
- Time-to-accept — median seconds from ping sent to ping taken.
- Coverage gap — incidents where no available responder matched the required capability tags.

## Cadence and platforms
- Web console for handlers; native phone app for responders.
- Monthly releases. Routing configuration ships as part of the release, not as a runtime setting a handler can adjust.
