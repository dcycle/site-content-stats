#!/bin/bash
#
# Count files in a website
#
set -e

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  cat ./scripts/lib/count-files-which-contain-instructions.md
  exit 1
fi

PATTERN="$1"
FINDPATTERN="$3"
WITHPROTOCOL="$2"
NOPROTOCOL=$(./scripts/strip-protocol.sh "$WITHPROTOCOL")

./scripts/clone-website.sh "$WITHPROTOCOL" >/dev/null

# https://www.cyberciti.biz/faq/grep-from-files-and-display-the-file-name/
egrep -R -w -l "$FINDPATTERN" ./do-not-commit/websites/"$NOPROTOCOL" | egrep -w "$PATTERN" | wc -l
