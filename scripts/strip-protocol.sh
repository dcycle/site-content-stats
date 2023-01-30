#!/bin/bash
#
# Count files in a website
#
set -e

if [ -z "$1" ]; then
  cat ./scripts/lib/strip-protocol-instructions.md
  exit 1
fi

WITHPROTOCOL="$1"
NOPROTOCOL="$WITHPROTOCOL"
NOPROTOCOL=$(echo $NOPROTOCOL | sed "s/^https:\/\///")
# http(s|) does not work for me in certain cases.
NOPROTOCOL=$(echo $NOPROTOCOL | sed "s/^http:\/\///")
echo "$NOPROTOCOL"
