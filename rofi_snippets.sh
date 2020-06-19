#!/usr/bin/env bash

set -euo pipefail

SNIPDIR=${SNIPDIR:-~/snips}

# fail early if deps are not to be found
which xsel 2>&1 >/dev/null
which xdotool 2>&1 >/dev/null
test -d "$SNIPDIR"

if [ -z "$@" ]; then
  ls -1 ~/snips
else
  file=$(ls -1 "$SNIPDIR/$1" 2>/dev/null)

  # echo -n removes trailing newline, tr makes xsel understand newlines
  echo -n "$(cat "$file")" | tr '\n' '\r' | xsel -bi

  # not sure what coproc does, stolen from
  # https://github.com/raphaelfournier/rofi-modi-snippets


  # another approach:
  # xdotool type --clearmodifiers --file -
  # wasn't really that optimized, even pretty short snippets (3 lines, 18 chars)
  # took a long time to execute
  coproc (xsel -bo | xdotool key ctrl+v)
fi
