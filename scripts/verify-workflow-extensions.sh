#!/usr/bin/env bash

set -euo pipefail

failures=0
fail() { printf 'FAIL: %s\n' "$1" >&2; failures=$((failures + 1)); }

[[ -x scripts/build-bundles.sh ]] || fail 'bundle builder is missing or not executable'
[[ -f skills/_shared/references/run-manifest.md ]] || fail 'run-manifest contract is missing'
[[ -f skills/independent-package-review/SKILL.md ]] || fail 'independent reviewer skill is missing'
[[ -f skills/roast-startup-ru/SKILL.md ]] || fail 'startup viability skill is missing'
[[ -f methodology/idea-viability-pre-gate.md ]] || fail 'idea-viability pre-gate is missing'
[[ -f methodology/artifact-applicability-matrix.md ]] || fail 'artifact applicability matrix is missing'

for mode in quick_discovery full_delivery existing_spec_review; do
  rg -Fq "\`$mode\`" skills/methodology-orchestrator/SKILL.md || fail "orchestrator has no $mode mode"
done

rg -Fq 'RUN.md' skills/methodology-orchestrator/SKILL.md || fail 'orchestrator does not manage RUN.md'
rg -Fq '$roast-startup-ru' skills/methodology-orchestrator/SKILL.md || fail 'orchestrator does not offer the viability pre-gate'
rg -Fq 'Независимый review' skills/independent-package-review/SKILL.md || fail 'reviewer does not define an independent review'
rg -Fq 'Гипотеза ценности' methodology/01-problem-formalization.md || fail 'Stage 1 has no value-hypothesis check'
for class in implementation_blocker stage_blocker carry_forward; do
  rg -Fq "\`$class\`" automation/stage-automation-contracts.md || fail "gate classification lacks $class"
done

if (( failures > 0 )); then exit 1; fi

bash scripts/build-bundles.sh --check
bash scripts/verify-language-contract.sh
printf 'Workflow extensions: OK\n'
