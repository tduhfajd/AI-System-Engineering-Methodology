---
name: stage-01-problem-formalization
description: Use when running Stage 1 of the AI System Engineering Methodology to convert normalized input into a formal problem model with actors, goals, non-goals, constraints, success metrics, and risk framing.
---

# Stage 1: Формализация проблемы

## Обязательные источники

- `../../methodology/01-problem-formalization.md`
- `../../methodology/ba-layer-model.md`
- `../../automation/stage-automation-contracts.md`
- `../../templates/stakeholder-map-template.md`
- `../../templates/glossary-template.md`
- `../_shared/references/stage-packet.md`
- `../_shared/references/gate-decision.md`
- `../_shared/references/quality-checks.md`
- `../_shared/references/human-review-contract.md`
- `../_shared/templates/stage-output-template.md`
- `../examples/stage-packet-examples.md`
- `../examples/negative-path-examples.md`

## Вход

- outputs Stage 0

## Сделай

1. Сформулируй problem statement.
2. Определи actors и their stakes.
3. Построй stakeholder map и business context view.
4. Выдели goals и non-goals.
5. Зафиксируй constraints, metrics и risks.
6. Собери glossary seed для критичных доменных терминов.
7. Верни `Problem Review Decision`.
8. Сверяй форму handoff с stage packet examples и не продвигай этап, если проблема неотделима от нерешенного scope conflict.

## Обязательный выход

- `Problem Statement`
- `Actor Map`
- `Stakeholder Map`
- `Goals and Non-Goals`
- `Success Metrics`
- `Constraint Register`
- `Business Context and Scope`
- `Glossary`
- `Risk Framing`
- `ba_artifacts_produced`
- `quality_checks`
- `human_review_state`
- `Problem Review Decision`

## Границы

- Не подменяй проблему списком features.
- Не принимай business priorities без human approval.
- Не оставляй критичные термины двусмысленными, если они влияют на downstream requirements и data model.
