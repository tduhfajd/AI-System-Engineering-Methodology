# Gate Decision Schema

Единый формат решения о переходе между этапами.

## Допустимые статусы

- `approved`
- `approved_with_gaps`
- `blocked`

## Обязательные поля

- `status`
- `decision_reason`
- `blocking_conditions`
- `allowed_next_stage`
- `human_signoff_required`

## Правила

- `blocked` не может автоматически превращаться в `approved`
- `approved_with_gaps` требует явного описания оставшихся gaps
- `human_signoff_required = true` запрещает auto-advance до следующего этапа

## Логическая форма

```json
{
  "status": "approved_with_gaps",
  "decision_reason": "",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-3",
  "human_signoff_required": true
}
```
