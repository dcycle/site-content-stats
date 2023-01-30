#!/bin/bash
#
# Clone a website if it has not yet been cloned
#
set -e

if [ -z "$1" ]; then
  cat ./scripts/lib/clone-website-instructions.md
  exit 1
fi

WITHPROTOCOL="$1"
NOPROTOCOL=$(./scripts/strip-protocol.sh "$WITHPROTOCOL")

if [ -d ./do-not-commit/websites/"$NOPROTOCOL" ]; then
  echo "Site $WITHPROTOCOL already is cloned, not re-cloning."
  echo "To remove it from cache run:"
  echo ""
  echo "    rm -rf ./do-not-commit/websites/$NOPROTOCOL"
else
  echo "Site $WITHPROTOCOL has not been cloned, cloning."
  docker run --rm -v "$(pwd)/do-not-commit/websites":/websites dcycle/clone-site:1 \
    "$WITHPROTOCOL"
fi



