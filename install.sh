#!/usr/bin/env bash
# skills/（公開分）と local/（非配布分）を ~/.claude/skills にシンボリックリンクする。
# リンクなので、このリポジトリで編集すれば即すべてのプロジェクトに反映される。
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
DST="$HOME/.claude/skills"
mkdir -p "$DST"
for base in skills local; do
  [[ -d "$ROOT/$base" ]] || continue
  for d in "$ROOT/$base"/*/; do
    [[ -f "$d/SKILL.md" ]] || continue
    name="$(basename "$d")"
    target="$DST/$name"
    if [[ -L "$target" ]]; then rm "$target"
    elif [[ -e "$target" ]]; then
      echo "skip: $target exists and is not a symlink" >&2; continue
    fi
    ln -s "${d%/}" "$target"
    echo "linked: $name"
  done
done
echo "done. Available from the next Claude Code session."
