#!/usr/bin/env bash
# Restore the Rook course files that the v2 template removed.
#
# What it does: downloads 41 files (company documents, callout history,
# interviews, tickets T-001 to T-025 and the module 6 briefs) from the last
# commit of the public course template before they were deleted.
#
# How to use: open a terminal in your course folder (claude-code-for-pms-final)
# and run:   bash setup/restore-rook-files.sh
#
# Safe to re-run. It never overwrites a file you already have, and it only
# writes inside 00-rook/ and 06-sidekicks/ in the current folder.

set -u

REPO="Product-School-Platform/claude-code-for-pms-template"
# The commit just before v2 (912e890) removed these files.
COMMIT="86a992cd0fbcc965aab42031e3a54e0545a63edb"
BASE="https://raw.githubusercontent.com/$REPO/$COMMIT"

if [ ! -d 00-rook ] || [ ! -d 06-sidekicks ]; then
  echo "Run this from your course folder (the one that contains 00-rook)."
  exit 1
fi

FILES="
00-rook/company/about-rook.pdf
00-rook/company/dispatch-one-pager.pdf
00-rook/company/supply-one-pager.pdf
00-rook/company/glossary.docx
00-rook/company/release-history.pdf
00-rook/company/roadmap-q3.pdf
00-rook/company/who-does-what.xlsx
00-rook/company/notes/dispatch-slack-thread.txt
00-rook/data/callout-history.csv
00-rook/feedback/interviews/ambrose.txt
00-rook/feedback/interviews/aunt-dot.txt
00-rook/feedback/interviews/halloran.txt
00-rook/feedback/interviews/kip.txt
06-sidekicks/briefs/bulk-callout.txt
06-sidekicks/briefs/handler-phone-app.txt
06-sidekicks/briefs/requisition-approval-chains.txt
06-sidekicks/briefs/routing-override-audit-log.txt
"
for n in $(seq -w 1 25); do
  FILES="$FILES
00-rook/feedback/tickets/t-0$n.txt"
done

got=0; skipped=0; failed=0
for f in $FILES; do
  if [ -e "$f" ]; then
    echo "have     $f"
    skipped=$((skipped + 1))
    continue
  fi
  mkdir -p "$(dirname "$f")"
  if curl -fsSL "$BASE/$f" -o "$f.part"; then
    mv "$f.part" "$f"
    echo "got      $f"
    got=$((got + 1))
  else
    rm -f "$f.part"
    echo "FAILED   $f"
    failed=$((failed + 1))
  fi
done

echo
echo "Done: $got downloaded, $skipped already there, $failed failed."
[ "$failed" -eq 0 ] || exit 1
