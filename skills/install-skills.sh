#!/usr/bin/env bash
# Install every skill in ./ into the global OpenCode skills directory.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills"
mkdir -p "$DEST"

if [ -d "$SRC/skills" ]; then
  SRC="$SRC/skills"
fi

count=0
while IFS= read -r -d '' skill; do
  dir="$(dirname "$skill")"
  name="$(basename "$dir")"
  rm -rf "${DEST:?}/$name"
  cp -R "$dir" "$DEST/$name"
  printf 'installed %s -> %s\n' "$name" "$DEST/$name"
  count=$((count + 1))
done < <(find "$SRC" -name SKILL.md -not -path "*/node_modules/*" -print0 2>/dev/null \
         || find "$SRC" -maxdepth 2 -name '*.md' -not -name README.md -print0)

printf '\n%d skill(s) installed. Reload OpenCode with /reload.\n' "$count"
