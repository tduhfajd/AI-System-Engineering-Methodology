---
name: acceptance-criteria-builder
description: Use when high-impact requirements or use cases need explicit acceptance criteria, negative cases, UAT-ready checks, or traceable acceptance conditions for downstream validation and delivery.
---

# Acceptance Criteria Builder

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../methodology/ba-layer-model.md`
- `../../templates/acceptance-criteria-template.md`

## Используй skill, когда нужно

- сформировать acceptance criteria seed
- собрать acceptance criteria catalog
- связать критерии с requirements и use cases
- зафиксировать negative cases и boundaries

## Сделай

1. Возьми high-impact requirements и use cases.
2. Сформулируй проверяемые критерии приемки.
3. Добавь negative cases и boundary conditions.
4. Раздели критерии по UAT, QA и deferred validation, если это важно.

## Обязательный выход

- `Acceptance Criteria Seed`
- `Acceptance Criteria Catalog`
- negative cases
- traceability to requirements and use cases

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не подменяй acceptance criteria общими пожеланиями к качеству.
- Не оставляй high-impact behavior без критериев приемки.
