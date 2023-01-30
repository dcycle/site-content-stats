#!/bin/bash
#
# Count files in a website
#
set -e

if [ -z "$1" ] || [ -z "$2" ]; then
  cat ./scripts/lib/count-files-instructions.md
  exit 1
fi

PATTERN="$1"
WITHPROTOCOL="$2"
NOPROTOCOL=$(./scripts/strip-protocol.sh "$WITHPROTOCOL")

./scripts/clone-website.sh "$WITHPROTOCOL" >/dev/null

find ./do-not-commit/websites/"$NOPROTOCOL" -name "*" | egrep -w "$PATTERN"

# https://linuxhint.com/count-the-number-of-lines-in-a-file-in-bash/
find ./do-not-commit/websites/"$NOPROTOCOL" -name "*" | egrep -w "$PATTERN" | wc -l
