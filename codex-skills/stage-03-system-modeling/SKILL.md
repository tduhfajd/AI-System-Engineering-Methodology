---
name: stage-03-system-modeling
description: Use when running Stage 3 of the AI System Engineering Methodology to transform approved requirements into a logical model of system flows, states, entities, decisions, and exception behavior without collapsing into architecture.
---

# Stage 3: Моделирование системы

## Обязательные источники

- `../_asef-shared/methodology/03-system-modeling.md`
- `../_asef-shared/methodology/ba-layer-model.md`
- `../_asef-shared/automation/stage-automation-contracts.md`
- `../_asef-shared/templates/domain-model-template.md`
- `../_asef-shared/templates/data-dictionary-template.md`
- `../_asef-shared/templates/use-case-model-template.md`
- `../_asef-shared/references/stage-packet.md`
- `../_asef-shared/references/gate-decision.md`
- `../_asef-shared/references/quality-checks.md`
- `../_asef-shared/references/stage-output-template.md`
- `../_asef-shared/examples/stage-packet-examples.md`
- `../_asef-shared/examples/negative-path-examples.md`

## Вход

- outputs Stage 2

## Сделай

1. Сгруппируй требования в behavioral slices.
2. Реализуй ключевые use cases на логическом уровне.
3. Определи flows, triggers, outcomes и decisions.
4. Выведи states, transitions, domain entities и entity lifecycles.
5. Подготовь domain model и data-definition level outputs, достаточные для downstream architecture.
6. Смоделируй exception и edge cases.
7. Проверь coverage against requirements and use cases.
8. Верни `System Modeling Review Decision`.
9. Сверяй структуру `next_stage_input` с stage packet examples.

## Обязательный выход

- `System Flow Model`
- `State Transition Model`
- `Domain Entity Model`
- `Entity Lifecycle Model`
- `Use Case Realization`
- `Domain Model`
- `Data Definition Notes`
- `Decision and Rule Model`
- `Exception and Edge Case Model`
- `Model Assumptions and Gaps Register`
- `ba_artifacts_produced`
- `quality_checks`
- `System Modeling Review Decision`

## Границы

- Не подменяй logical model архитектурными компонентами.
- Не пропускай failure behavior.
- Не оставляй domain/data layer слишком слабым для downstream architecture и data design.
