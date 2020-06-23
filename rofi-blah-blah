#!/usr/bin/env bash

set -euo pipefail

SNIPDIR=${SNIPDIR:-~/snips}

# fail early if deps are not found
which xsel 2>&1 >/dev/null
which xdotool 2>&1 >/dev/null
test -d "$SNIPDIR"

if [ -z "$@" ]; then
  ls -1 ~/snips
else
  file=$(ls -1 "$SNIPDIR/$1" 2>/dev/null)

  # echo -n removes trailing newline,
  #   tr makes xsel understand newlines
  #     xsel -b uses the clipboard
  echo -n "$(cat "$file")" | tr '\n' '\r' | xsel -bi

  coproc (xdotool key ctrl+v)
fi
