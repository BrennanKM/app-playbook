#!/bin/sh
# Copies the starter files into a new, empty app folder and fills in the simple
# placeholders. The assistant fills in the rest (pitch, guardrails, risk tier)
# in Step 2 of KICKOFF.md. It creates no git repository and touches nothing
# remote; Step 2 and Step 3 do that, with the owner's yes.
#
#   sh ~/Developer/app-playbook/scripts/new-app.sh <folder> "<App Name>"
set -eu
[ $# -eq 2 ] || { echo "usage: new-app.sh <folder> \"<App Name>\"" >&2; exit 2; }
DEST=$1; NAME=$2
HERE=$(cd "$(dirname "$0")/.." && pwd)
if [ -e "$DEST" ] && [ -n "$(ls -A "$DEST" 2>/dev/null)" ]; then
  echo "$DEST is not empty; stopping." >&2; exit 1
fi
mkdir -p "$DEST"
cp -R "$HERE/starter/." "$DEST/"
YEAR=$(date +%Y); TODAY=$(date +%Y-%m-%d)
find "$DEST" -type f \( -name '*.md' -o -name 'LICENSE' \) | while read -r f; do
  sed -i '' -e "s|{{APP_NAME}}|$NAME|g" -e "s|{{YEAR}}|$YEAR|g" -e "s|{{DATE}}|$TODAY|g" "$f"
done
echo "Copied the starter into $DEST."
echo "Placeholders left for the assistant:"
grep -rhoE '\{\{[A-Z_]+\}\}' "$DEST" | sort | uniq -c
