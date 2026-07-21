# Шаблоны Артефактов

Все шаблоны предназначены для русскоязычных выходных артефактов. Английские сокращения сохраняются только там, где они обозначают общепринятый тип документа или технический идентификатор; подробные правила описаны в [output-language-policy.md](../skills/_shared/references/output-language-policy.md).

В этой директории находятся канонические шаблоны конечных артефактов методологии.

## Назначение

Шаблоны нужны для того, чтобы:

- разные исполнители собирали документы в сопоставимом формате
- обязательные разделы не терялись между проектами
- AI-агенты и люди могли работать по одному и тому же контракту
- проверка полноты и согласованности документов была проще

## Состав

- `pdd-template.md`
- `functional-specification-template.md`
- `system-design-document-template.md`
- `nfr-template.md`
- `api-specification-template.md`
- `data-model-template.md`
- `ux-user-flows-template.md`
- `execution-plan-template.md`
- `test-strategy-template.md`
- `validation-criteria-template.md`
- `validation-report-template.md`
- `stakeholder-map-template.md`
- `glossary-template.md`
- `business-rules-catalog-template.md`
- `use-case-model-template.md`
- `domain-model-template.md`
- `data-dictionary-template.md`
- `acceptance-criteria-template.md`
- `user-stories-template.md`

## BA-слой

Помимо engineering-документов, в директории теперь есть канонические шаблоны BA-артефактов.

Обязательные capability templates:

- `stakeholder-map-template.md`
- `glossary-template.md`
- `business-rules-catalog-template.md`
- `use-case-model-template.md`
- `domain-model-template.md`
- `data-dictionary-template.md`
- `acceptance-criteria-template.md`

Conditionally required:

- `user-stories-template.md`

## Правило Использования

1. Шаблон задает минимально обязательную структуру, а не ограничивает содержательное наполнение.
2. Если раздел неприменим, это нужно зафиксировать явно, а не удалять его молча.
3. Все незакрытые допущения, пробелы и блокеры должны быть видимы в соответствующих разделах.
