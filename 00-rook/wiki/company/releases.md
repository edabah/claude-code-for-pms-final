# Releases

Rook Dispatch release notes, 4.x series, as published to handlers on the morning of each release. Items deferred from a release are not listed here; see the Q3 roadmap for planned work.

## 4.0 — shipped 2026-04-07
- New console navigation.
- Responder profile redesign.
- Audit log for routing overrides.

## 4.1 — shipped 2026-06-16
- Proximity now uses a travel-time estimate rather than straight-line distance.
- Bulk callout for incidents requiring more than one responder.
- Phone push delivery reliability improvements.

## 4.2 — shipped 2026-08-12
- Change to who gets pinged. Proximity is weighted more heavily relative to recent acceptance history when ranking responders for a callout. Long requested by responders who cover wide areas.
- Ping wait reduced from 90 seconds to 60 seconds. Pings that go unanswered move to the next responder sooner.
- Console filter selections now persist between sessions.
- Three defect fixes: duplicate push notification when a ping is sent again; capability tag ordering in the responder detail panel; incorrect time zone on the coverage report export.

### Comments on the 4.2 page (conversation, oldest first)
- 13 Aug · Engineering manager: 4.2 is out. Went clean, no rollback, no overnight pages. Nice work everyone.
- 13 Aug · Product designer: filter persistence is live! small thing, been asked for forever
- 14 Aug · Engineering manager: quick q on the change to who gets pinged — was that meant to apply to responders who've been turning jobs down too, or only everyone else? the config doesn't distinguish between them as far as i can tell
- 14 Aug · Engineering manager: not saying it's wrong, just want to know if it was a decision or if it just fell out that way
- 14 Aug · Staff engineer: 🙏 away until the 24th, I'll look when I'm back
- 18 Aug · Support lead: Heads up — callout tickets are running about 3x normal since Wednesday. Two themes. One is responders saying their phone never even goes off anymore. The other is their phone buzzes, they grab it, and by the time they've got a thumb on the screen it's already gone to somebody else.
- 18 Aug · Support lead: The second one I can explain, we cut the ping wait from 90 seconds to 60. The first one I can't.
- 18 Aug · Support lead: Can someone pull the trend on how often responders are actually answering lately? Trying to get a read on whether this is really as bad as the tickets make it look.
- 18 Aug · Engineering manager: I can get you something rough but it won't be the real weekly numbers
- 18 Aug · Support lead: rough is fine, just want to know the direction
- 19 Aug · Priya: Catching up on this. Some of this is going to be seasonal — August is always soft and we see this every year. Let's not spiral before we have numbers in front of us. I'd rather we look at this properly in September than react to two weeks of tickets.
- 19 Aug · Support lead: Fair. I'll keep tracking the split between the two themes so we have it.
- 21 Aug · Priya: Last day. Handover doc is in the Dispatch folder. It's been a good fourteen months — thank you all, genuinely. Our engineering manager has my number if anything catches fire.
- 21 Aug · Product designer: 👋💛
- 21 Aug · Engineering manager: Thanks Priya. Go rest.
- 26 Aug · Support lead: Ticket volume still elevated. Not getting worse, not getting better. Split is roughly two thirds "phone never goes off" to one third "gone before I could answer."
- 26 Aug · Engineering manager: That'll be the August dip Priya mentioned. Should settle once September starts.
- 26 Aug · Support lead: One of the handlers emailed me directly today, which never happens.
- 28 Aug · Engineering manager: New PM started Monday. Let's give them a week to get up to speed and then regroup properly on the 4.2 picture — I don't want to hand them a conclusion before they've had a chance to look at it themselves.
- 28 Aug · Support lead: Works for me. I'll have the ticket breakdown ready.
- 28 Aug · Staff engineer: Back and catching up on 700 messages. Message me directly if something needs me.
