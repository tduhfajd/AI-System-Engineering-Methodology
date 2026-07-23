---
name: stage-01-problem-formalization
description: Use when running Stage 1 of the AI System Engineering Methodology to convert normalized input into a formal problem model with actors, goals, non-goals, constraints, success metrics, and risk framing.
---

# Stage 1: Формализация проблемы

## Обязательные источники

- `../_asef-shared/references/output-language-policy.md`
- `../_asef-shared/references/run-manifest.md`

- `../_asef-shared/methodology/01-problem-formalization.md`
- `../_asef-shared/methodology/artifact-applicability-matrix.md`
- `../_asef-shared/methodology/ba-layer-model.md`
- `../_asef-shared/automation/stage-automation-contracts.md`
- `../_asef-shared/templates/stakeholder-map-template.md`
- `../_asef-shared/templates/glossary-template.md`
- `../_asef-shared/references/stage-packet.md`
- `../_asef-shared/references/gate-decision.md`
- `../_asef-shared/references/quality-checks.md`
- `../_asef-shared/references/human-review-contract.md`
- `../_asef-shared/references/stage-output-template.md`
- `../_asef-shared/examples/stage-packet-examples.md`
- `../_asef-shared/examples/negative-path-examples.md`

## Вход

- outputs Stage 0

## Сделай

1. Сформулируй problem statement.
2. Определи actors и their stakes.
3. Построй stakeholder map и business context view.
4. Выдели goals и non-goals.
5. Зафиксируй constraints, metrics и risks.
6. Собери glossary seed для критичных доменных терминов.
7. Выбери минимально достаточный пакет по матрице применимости и зафиксируй исключённые артефакты с причиной.
8. Для новой идеи сформулируй `Гипотезу ценности`; если она критична и не подтверждена evidence, передай её в `$fast-track-validation` и отрази статус эксперимента в `RUN.md`.
9. Верни `Problem Review Decision`.
10. Сверяй форму handoff с stage packet examples и не продвигай этап, если проблема неотделима от нерешенного scope conflict.

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
- `Artifact Applicability Decision`
- `Value Hypothesis`, если применимо
- `ba_artifacts_produced`
- `quality_checks`
- `human_review_state`
- `Problem Review Decision`

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не подменяй проблему списком features.
- Не принимай business priorities без human approval.
- Не оставляй критичные термины двусмысленными, если они влияют на downstream requirements и data model.
