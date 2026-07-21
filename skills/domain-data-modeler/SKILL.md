---
name: domain-data-modeler
description: Use when the methodology needs a domain model, entity relationships, lifecycle logic, data dictionary, or stronger BA-grade data definition before architecture or implementation handoff.
---

# Domain Data Modeler

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../methodology/ba-layer-model.md`
- `../../templates/domain-model-template.md`
- `../../templates/data-dictionary-template.md`

## Используй skill, когда нужно

- определить доменные сущности и связи
- описать logical attributes и lifecycle
- подготовить data dictionary
- усилить data/domain layer перед architecture and implementation

## Сделай

1. Выдели core domain entities.
2. Определи relationships, cardinality и lifecycle notes.
3. Опиши key attributes и obligations по данным.
4. Подготовь data dictionary.
5. Отметь data-quality risks и gaps.

## Обязательный выход

- `Domain Model`
- `Data Dictionary`
- entity lifecycle notes
- data risks and gaps

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не скатывайся в physical schema prematurely.
- Не оставляй сущности без business meaning.
