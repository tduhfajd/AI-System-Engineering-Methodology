---
name: use-case-modeler
description: Use when the methodology needs actor-driven scenario modeling, including use case inventory, detailed use cases, alternative and exception flows, or use case to requirement traceability.
---

# Use Case Modeler

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../methodology/ba-layer-model.md`
- `../../templates/use-case-model-template.md`
- `../../templates/acceptance-criteria-template.md`

## Используй skill, когда нужно

- собрать use case inventory
- детализировать key use cases
- описать main, alternative и exception flows
- связать use cases с требованиями и acceptance intent

## Сделай

1. Определи key actors и их goals.
2. Собери use case inventory.
3. Детализируй high-impact use cases.
4. Свяжи use cases с requirements и exception paths.
5. Передай acceptance criteria seed для downstream use.

## Обязательный выход

- `Use Case Inventory / Use Case Model`
- use case to requirement links
- exception flow notes
- acceptance criteria seed inputs

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не подменяй use cases user stories.
- Не пропускай alternative и exception flows для high-impact scenarios.
