#!/usr/bin/env bash

set -euo pipefail

mode="${1:-build}"
if [[ "$mode" != "build" && "$mode" != "--check" ]]; then
  printf 'Usage: %s [--check]\n' "$0" >&2
  exit 2
fi

workspace="$(pwd)"
temporary="$(mktemp -d)"
trap 'rm -rf "$temporary"' EXIT

build_bundle() {
  local flavor="$1" target="$2" source skill name
  mkdir -p "$target/_asef-shared"
  for source in "$workspace"/skills/*; do
    name="$(basename "$source")"
    [[ "$name" == "_shared" || "$name" == "examples" || ! -d "$source" ]] && continue
    skill="$target/$name"
    mkdir -p "$skill"
    if [[ "$flavor" == "codex" ]]; then
      rsync -a --delete "$source/" "$skill/"
    else
      rsync -a --delete --exclude agents "$source/" "$skill/"
    fi
    perl -0pi -e 's{\.\./\.\./methodology/}{../_asef-shared/methodology/}g; s{\.\./\.\./automation/}{../_asef-shared/automation/}g; s{\.\./\.\./templates/}{../_asef-shared/templates/}g; s{\.\./\.\./skills-technical-assignment\.md}{../_asef-shared/project/skills-technical-assignment.md}g; s{\.\./_shared/(?:references|templates)/}{../_asef-shared/references/}g; s{\.\./examples/}{../_asef-shared/examples/}g' "$skill/SKILL.md"
  done
  rsync -a --delete "$workspace/automation/" "$target/_asef-shared/automation/"
  rsync -a --delete "$workspace/methodology/" "$target/_asef-shared/methodology/"
  rsync -a --delete "$workspace/templates/" "$target/_asef-shared/templates/"
  rsync -a --delete "$workspace/skills/_shared/references/" "$target/_asef-shared/references/"
  rsync -a "$workspace/skills/_shared/templates/" "$target/_asef-shared/references/"
  rsync -a --delete "$workspace/skills/examples/" "$target/_asef-shared/examples/"
  mkdir -p "$target/_asef-shared/project"
  cp "$workspace/skills-technical-assignment.md" "$target/_asef-shared/project/skills-technical-assignment.md"
}

build_bundle codex "$temporary/codex-skills"
build_bundle cursor "$temporary/cursor-skills"

if [[ "$mode" == "--check" ]]; then
  diff -qr "$temporary/codex-skills" "$workspace/codex-skills" --exclude README.md
  diff -qr "$temporary/cursor-skills" "$workspace/cursor-skills" --exclude README.md
  printf 'Bundles are synchronized with source: OK\n'
else
  rsync -a --delete --exclude README.md "$temporary/codex-skills/" "$workspace/codex-skills/"
  rsync -a --delete --exclude README.md "$temporary/cursor-skills/" "$workspace/cursor-skills/"
  printf 'Bundles rebuilt from source: OK\n'
fi
