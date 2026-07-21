---
name: business-rules-extractor
description: Use when business rules, constraints, calculation logic, state-transition rules, or policy-level exceptions must be extracted, normalized, or validated as explicit BA artifacts.
---

# Business Rules Extractor

## Обязательные источники

- `../_asef-shared/references/output-language-policy.md`
- `../_asef-shared/references/run-manifest.md`

- `../_asef-shared/methodology/ba-layer-model.md`
- `../_asef-shared/templates/business-rules-catalog-template.md`

## Используй skill, когда нужно

- выделить business rules из требований или исходного ТЗ
- отделить policy logic от feature descriptions
- собрать расчетные правила и state-transition rules
- найти rule conflicts и gaps

## Сделай

1. Извлеки явные и implied business rules.
2. Классифицируй rules по категориям.
3. Выдели расчетные, eligibility и transition rules.
4. Зафиксируй conflicts, overrides и gaps.

## Обязательный выход

- `Business Rules Catalog`
- calculation rules
- transition rules
- rule conflicts and gaps

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не скрывай правила внутри prose requirements.
- Не выдумывай policy decisions без source basis.
