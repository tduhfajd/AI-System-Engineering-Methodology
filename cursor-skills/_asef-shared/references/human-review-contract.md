# Human Review Contract

Этот документ задает единые правила возврата состояния human review для всех stage skills.

## Обязательные поля

Если skill требует human review, он обязан вернуть:

- `human_signoff_required`
- `human_decisions_required`
- `review_scope`
- `review_blocking`

## Правила

- если `human_signoff_required = true`, orchestrator не должен auto-advance workflow
- `human_decisions_required` должен содержать конкретные вопросы, а не общий текст
- `review_scope` должен указывать, что именно проверяет человек:
  - facts
  - assumptions
  - scope
  - architecture
  - readiness
- `review_blocking = true` означает, что следующий stage запрещен до signoff

## Логическая форма

```json
{
  "human_signoff_required": true,
  "human_decisions_required": [
    "Confirm whether the identified primary actor is correct.",
    "Approve unresolved scope boundary around CRM integration."
  ],
  "review_scope": [
    "scope",
    "assumptions"
  ],
  "review_blocking": true
}
```
