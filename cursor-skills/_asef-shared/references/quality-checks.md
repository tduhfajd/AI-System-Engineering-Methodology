# Quality Checks Contract

Этот документ задает единый формат `quality_checks`, который должен возвращать каждый stage skill.

## Назначение

`quality_checks` нужны для того, чтобы:

- stage output был не только создан, но и сразу self-validated
- downstream stages и orchestrator могли понимать качество handoff
- validation могла использовать промежуточные quality signals

## Минимальная структура

Каждый stage skill должен возвращать список проверок в следующей логике:

- `check_id`
- `check_name`
- `status`
- `evidence`
- `blocking`

## Допустимые статусы

- `passed`
- `passed_with_gaps`
- `failed`
- `not_applicable`

## Правила

- если `blocking = true` и `status = failed`, stage не может возвращать `approved`
- evidence не должно быть пустым для `passed`, `passed_with_gaps` и `failed`
- `not_applicable` допускается только с объяснением

## Рекомендуемые типы проверок

- completeness check
- consistency check
- traceability check
- template usage check
- gate readiness check

## Логическая форма

```json
[
  {
    "check_id": "qc-01",
    "check_name": "completeness",
    "status": "passed_with_gaps",
    "evidence": "All required artifacts exist, but 2 non-blocking gaps remain.",
    "blocking": false
  }
]
```
