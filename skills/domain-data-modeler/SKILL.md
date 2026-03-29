---
name: domain-data-modeler
description: Use when the methodology needs a domain model, entity relationships, lifecycle logic, data dictionary, or stronger BA-grade data definition before architecture or implementation handoff.
---

# Domain Data Modeler

## Обязательные источники

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

## Границы

- Не скатывайся в physical schema prematurely.
- Не оставляй сущности без business meaning.
