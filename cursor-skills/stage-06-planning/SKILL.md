---
name: stage-06-planning
description: Use when running Stage 6 of the AI System Engineering Methodology to transform the final specification package into an executable delivery plan with work breakdown, dependencies, milestones, validation checkpoints, and delivery risks.
---

# Stage 6: Планирование

## Обязательные источники

- `../_asef-shared/references/output-language-policy.md`
- `../_asef-shared/references/run-manifest.md`

- `../_asef-shared/methodology/06-planning.md`
- `../_asef-shared/automation/stage-automation-contracts.md`
- `../_asef-shared/references/stage-packet.md`
- `../_asef-shared/references/gate-decision.md`
- `../_asef-shared/references/quality-checks.md`
- `../_asef-shared/references/stage-output-template.md`
- `../_asef-shared/examples/stage-packet-examples.md`
- `../_asef-shared/examples/negative-path-examples.md`

## Вход

- outputs Stage 5

## Сделай

1. Раздели specification package на implementation slices.
2. Собери work breakdown structure.
3. Определи dependencies, sequencing и milestones.
4. Встрой review и validation checkpoints.
5. Зафиксируй delivery risks и assumptions.
6. Верни `Planning Review Decision`.
7. Формируй `next_stage_input` в виде, пригодном для прямой валидации downstream stage.

## Обязательный выход

- `Execution Plan`
- `Work Breakdown Structure`
- `Dependency Map`
- `Milestone and Phase Plan`
- `Validation and Review Checkpoint Plan`
- `Delivery Risks and Assumptions Register`
- `quality_checks`
- `Planning Review Decision`

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не выдавай pseudo-plan, который просто повторяет структуру документации.
- Не скрывай blocking dependencies.
