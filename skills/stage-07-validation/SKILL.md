---
name: stage-07-validation
description: Use when running Stage 7 of the AI System Engineering Methodology to assess completeness, consistency, executability, residual risk, and implementation readiness of the final documentation package using explicit criteria and scoring.
---

# Stage 7: Валидация

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../methodology/07-validation.md`
- `../../methodology/ba-layer-model.md`
- `../../automation/stage-automation-contracts.md`
- `../../automation/scoring-confidence-model.md`
- `../../templates/validation-report-template.md`
- `../../templates/scoring-report-template.md`
- `../_shared/references/stage-packet.md`
- `../_shared/references/gate-decision.md`
- `../_shared/references/scoring-packet.md`
- `../_shared/references/quality-checks.md`
- `../_shared/references/human-review-contract.md`
- `../_shared/templates/stage-output-template.md`
- `../examples/stage-packet-examples.md`
- `../examples/negative-path-examples.md`
- `../examples/demo-runtime-transcript.md`

## Вход

- outputs Stage 5
- outputs Stage 6
- prior review decisions and gaps

## Сделай

1. Проверь completeness, consistency, traceability, BA sufficiency и executability.
2. Выяви defects, gaps, BA gaps и residual risks.
3. Примени scoring model, включая `business_clarity` и `data_definition_quality`.
4. Проверь blocking override rule.
5. Сформируй readiness decision и handoff recommendation.
6. Сверяй финальный handoff с runtime transcript и negative-path rules.

## Обязательный выход

- `Validation Report`
- `Readiness Decision`
- `Defect and Gap Register`
- `BA Sufficiency Assessment`
- `Residual Risk Register`
- `Implementation Handoff Recommendation`
- `Validation Criteria Record`
- `Scoring Report`
- `ba_artifacts_produced`
- `quality_checks`
- `human_review_state`

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не повышай readiness без human acceptance.
- Не подменяй defects residual risks.
- Не признавай пакет implementation-ready, если BA-layer недостаточен для типа проекта.
