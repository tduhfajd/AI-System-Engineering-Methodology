#!/usr/bin/env bash

# Verifies that every distributed skill carries the Russian-output contract.
set -euo pipefail

roots=("skills" "codex-skills" "cursor-skills")
template_dirs=(
  "templates"
  "codex-skills/_asef-shared/templates"
  "cursor-skills/_asef-shared/templates"
)
failures=0

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  failures=$((failures + 1))
}

for root in "${roots[@]}"; do
  if [[ "$root" == "skills" ]]; then
    policy="$root/_shared/references/output-language-policy.md"
    reference='`../_shared/references/output-language-policy.md`'
  else
    policy="$root/_asef-shared/references/output-language-policy.md"
    reference='`../_asef-shared/references/output-language-policy.md`'
  fi

  [[ -f "$policy" ]] || fail "$policy is missing"

  while IFS= read -r skill; do
    rg -Fq "$reference" "$skill" || fail "$skill does not reference the language policy"
    rg -Fq '## Языковой контракт' "$skill" || fail "$skill has no language-contract section"
  done < <(find "$root" -name SKILL.md -type f | sort)
done

cmp -s skills/_shared/references/output-language-policy.md \
  codex-skills/_asef-shared/references/output-language-policy.md \
  || fail "Codex bundle has a different language policy"
cmp -s skills/_shared/references/output-language-policy.md \
  cursor-skills/_asef-shared/references/output-language-policy.md \
  || fail "Cursor bundle has a different language policy"

for template_dir in "${template_dirs[@]}"; do
  while IFS= read -r template; do
    rg -Fq '<!-- Язык документа: русский. -->' "$template" || fail "$template has no Russian-language marker"
    head -n 1 "$template" | rg -q '[А-Яа-яЁё]' || fail "$template has no Russian title"
  done < <(find "$template_dir" -name '*-template.md' -type f | sort)
done

if (( failures > 0 )); then
  exit 1
fi

printf 'Russian-output contract: OK\n'
