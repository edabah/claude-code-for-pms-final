# Rook Supply

Product one-pager · Owner: Product Management, Supply · Current release 4.2

## The product in one line
Supply keeps a responder's equipment serviceable and accounted for, so a handler is never guessing whether the gear will hold.

## The core flow
- A handler raises a requisition against the equipment catalog.
- The requisition routes to a quartermaster for approval.
- Fulfillment is tracked to delivery and issue.
- Each issued item carries a maintenance schedule, generated from its service interval.
- Field failure reports feed back into the item's history and can trigger early maintenance.

## Users
- Handler — raises requisitions, files field failure reports, manages a responder's kit.
- Quartermaster — approves, fulfills, holds the equipment catalog and stock.

## Where Supply touches Dispatch
Maintenance scheduling reads the Responder Availability Record, the shared record of when a responder is available for callout. Supply uses it to avoid booking gear maintenance into a window where the responder is likely to be called out — in practice, we schedule maintenance into the periods where callout load is lowest.
The Responder Availability Record is written by Dispatch. Supply reads it and does not write to it. Changes to how Dispatch calculates or updates that record land in Supply's maintenance scheduling without any change on our side.
