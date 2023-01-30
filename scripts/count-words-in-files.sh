#!/bin/bash
#
# Count words in files.
#
set -e

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  cat ./scripts/lib/count-words-in-files-instructions.md
  exit 1
fi

PATTERN="$1"
FINDPATTERN="$3"
WITHPROTOCOL="$2"
NOPROTOCOL=$(./scripts/strip-protocol.sh "$WITHPROTOCOL")
TEMPDIR=./do-not-commit/wordcount/"$RANDOM"
rm -rf "$TEMPDIR"
mkdir -p "$TEMPDIR"

./scripts/clone-website.sh "$WITHPROTOCOL" >/dev/null

# https://www.cyberciti.biz/faq/grep-from-files-and-display-the-file-name/
for f in $(egrep -R -w -l "$FINDPATTERN" ./do-not-commit/websites/"$NOPROTOCOL" | egrep -w "$PATTERN"); do
  docker run -v "$(pwd):/data" --rm alpine/html2text:latest /data/"$f" >> $TEMPDIR/alltext.txt
done

wc $TEMPDIR/alltext.txt
rm -rf $TEMPDIR
