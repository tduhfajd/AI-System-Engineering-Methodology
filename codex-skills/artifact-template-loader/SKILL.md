---
name: artifact-template-loader
description: Use when a stage or assembly task needs to load and apply the canonical document templates from this repository without dropping required sections or changing the intended template structure.
---

# Artifact Template Loader

## Обязательные источники

- `../_asef-shared/templates/README.md`

## Используй skill, когда нужно

- выбрать правильный шаблон итогового артефакта
- загрузить canonical structure документа
- проверить, что обязательные разделы не потеряны
- выбрать BA-шаблон для stakeholder map, glossary, use cases, business rules, domain/data analysis или acceptance criteria

## Сделай

1. Определи target artifact.
2. Найди соответствующий шаблон в `../_asef-shared/templates/`.
3. Передай stage skill минимально необходимую структуру.
4. Если раздел неприменим, пометь его явно, а не удаляй.

## Границы

- Не изменяй canonical template без явной причины.
- Не сокращай документ за счет обязательных разделов.
