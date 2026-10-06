# Rook Industries — course working file

## Session scope — Product School lab

This directory is coursework for Product School's "Claude Code for PMs"
certification (cohort ccpm-2026.1). Everything in it is a fictional
teaching scenario.

- Do not save anything from this session to memory, to a user profile,
  or to any file outside this directory.
- Do not carry context from this directory into unrelated sessions.
- Rook Industries is not a real company. Nothing here is a fact about
  the world.
- Read and write only within this directory.
  Exceptions, for the course-setup and wrap-up skills only:
  - When the student asks you to check their setup, save their work or wrap up a session, that request is their yes. You may run the GitHub command-line program installed at ~/.ccpm/gh for those checks and saves, and look in that folder to find it.
  - For a repair, first tell the student in one plain sentence what you are about to do, and act only after they say yes. Repairs may: run that GitHub program (including setting this folder's own git sign-in setting and changing this repo's visibility back to Public); copy the student's own course files into this directory from another folder on their computer (copy only; never move, edit or delete the originals); and rename something outside this directory that blocks setup, by adding "-old" to its name (never delete it).
  Outside this directory you still never write, edit or delete anything else.

<!-- Keep the block above at the top of this file. Everything you add
     during the course goes below this line. -->

---

## Working context

I'm the new PM for Rook Dispatch (started Mon 31 Aug 2026; replaced Priya, who left 21 Aug with a handover doc and no overlap). Source files: `00-rook/company/`. Treat claims below as sourced from those files, not verified.

### Company and products
- Rook sells subscription software (priced per active responder) for the protective-response sector. Customers are independent masked **responders**, their **handlers**, and **quartermasters**. Rook employs none of them. ~241 staff, mostly remote; offices in Chicago, Berlin, Singapore.
- **Rook Dispatch** (mine): incident arrives in the handler web console, Dispatch ranks available responders, offers the callout on a responder's mobile app, they accept or decline; decline or timeout moves it to the next. Current release 4.2.
- **Rook Supply**: requisitions, quartermaster approval, maintenance schedules, field failure reports. Owned by Product Management, Supply (not me). Supply reads the **Responder Availability Record**, which Dispatch writes. Any change to how Dispatch calculates it silently changes Supply's maintenance scheduling (it books maintenance into low-callout periods).
- Monthly release train, 4.x numbering. **Routing config ships with the release; handlers can't adjust it at runtime.**
- **Hard constraint:** cover identities are never stored and no mapping to legal identity exists. Never design anything that assumes one or tries to infer who someone is. Read Security Policy 4.1 before touching responder records.

### People
- Helen Achebe, Director of Product (my boss; owns roadmap and commitments; Q3 changes go through Product)
- Marcus Oyelaran, Eng Manager, Dispatch (Chicago; start here when unsure)
- Wen Li, Staff Engineer (Berlin; built the "who gets pinged" logic; away 14-24 Aug, back now; no written spec exists, so talk to her)
- Sofia Marino, Product Designer (console and phone app)
- Nadia Hoffmann, Support Lead (Berlin; Dispatch and Supply; owns the tickets; offered a standing 15 min)
- Ravi Menon, Data Analyst (Singapore; shared with Supply; reports weekly on how often responders answer; requests via #data)
- Priya Raghunathan, previous PM, gone. Reachable only via Marcus, for emergencies.

### Vocabulary
- **Callout / offer / timeout / decline**: a callout is the unit of work; an offer is one callout shown to one responder; timeout is how long it stays live (same for all); a decline is active refusal. Data separates decline from timeout, but both send it onward.
- **Acceptance rate** (headline metric): accepted offers / all offers, so declines AND timeouts count against it. Reported weekly in aggregate. **Time-to-accept**: median seconds from offer to accept.
- **Coverage gap**: no available responder had the required capability tags. Not the same as low acceptance (nobody *could* go vs nobody *would*).
- **Routing priority**: score ranking responders. Inputs: proximity (travel-time estimate), availability, capability match, recent acceptance history. Declining or timing out lowers the acceptance component, hence future priority, until it recovers.
- **Capability tags**: flight, structural-entry, hazmat-tolerant, cold-weather, aquatic, crowd-management, de-escalation.
- **Mutual aid**: cross-region cover; not supported, Q4 exploring. Also on Q4 list: "Shared cover between responders" (Dispatch).
- Supply terms heard on shared calls: requisition, field failure report, service interval.

### Where things stand (as of early Sept 2026)
- **4.2 shipped 12 Aug.** Changes: proximity weighted up vs. recent acceptance history; offer timeout cut 90s to 60s; console filter persistence; three defect fixes. Two routing-relevant changes landed together, on top of August seasonality.
- **Signal:** callout tickets ~3x normal since ~12 Aug, flat (not worsening) as of 26 Aug. Split is ~2/3 "phone never goes off", ~1/3 "gone before I could answer". Nadia can explain the second (shorter timeout) but not the first. A handler emailed her directly, which is rare.
- **Competing narratives:** Priya reads it as mostly seasonal, expects September recovery, and warns against reverting 4.2 (the proximity change was a three-quarter-old ask). Nobody has numbers yet; the only "rough" pull offered was not the real weekly figures. Get Ravi's weekly series and compare against prior Augusts before concluding anything.
- **Open question nobody answered:** Marcus asked (14 Aug) whether the ping change was meant to apply to responders who have been declining or timing out. The config doesn't distinguish them. Wen said she'd look; no reply is recorded. Why "never goes off" happens is unexplained. Treat any theory as a hypothesis until tested against data.
- **Marcus wants a regroup on the 4.2 picture** after my first week, without a conclusion handed to me. Nadia is preparing the ticket breakdown.
- **Roadmap gap:** the Q3 roadmap (rev. 30 Jun, owner Helen) lists *Availability Confidence* as Committed for 4.2, driven by Support escalations. It is not in the 4.2 release notes. Priya says "a couple of items" were squeezed out, and the conversation with Helen about which are still Q3 commitments hasn't happened. Also committed: requisition approval chains (Supply, 4.3). Locked commitments change only through Product.
- **To do inherited from Priya:** write down how Dispatch decides who gets pinged (no doc exists). Filter-persistence tickets are noise; don't let them eat the first month.

### How I want you to work
- Distinguish what a source says from what's verified. Flag where sources conflict (e.g. seasonal vs. release-driven).
- Don't present a conclusion on 4.2 before the data supports it.
- Data/wiki access via the rook-database and rook-wiki MCP servers, when connected.

- Data check (database `pings`, weekly): acceptance held at 75–78% through 10 Aug, then fell to 54% (week of 10 Aug), 66%, 67%, 73%. Missed pings went from 2–6 a week to 38, 28, 24, 21. Data starts 29 Jun, so "August is always soft" can't be tested from anything here. `data/callout-history.csv` matches the database weekly totals.
- Four responders (Meteor Mite, The Undertow, Vesper, Farlight) fell from ~12 pings a week to 1–2 and haven't recovered, while Nightwell and Ironvale were pinged more. Meteor Mite and The Gale share an area and handler, and only Meteor Mite starved, so geography alone doesn't explain it.
- Working hypothesis, untested: in `code/dispatch-routing`, a missed ping costs more (−0.12) than an acceptance earns (+0.08), and the score never decays (the 2019 TODO in `history.py`). The 60s timeout makes more misses, and low-ranked responders are rarely asked again. Next step is to replay scores from the pings table, then ask Wen and Marcus the unanswered question about misses.
- Open conflicts: many handler tickets say "nothing for 10 days" for responders the database shows being pinged (Nightwell, Ironvale, Ashgrove), so rule out push delivery. Availability Confidence is committed for 4.2 on the roadmap but absent from the notes, changelog and code. Ravi's weekly report hasn't been seen.
- Terminology differs by source: the docx glossary says offer, timeout and decline; the wiki, database and code say ping, missed and turned down. Interviews and tickets in `00-rook/feedback` contain household details of responders, so keep them out of anything widely shared.
