# Scoring Packet Schema

Единый логический пакет для scoring и confidence evaluation.

## Обязательные поля

- `scope`
- `axis_scores`
- `total_score_5`
- `total_score_100`
- `confidence`
- `blocking_issues`
- `readiness_recommendation`
- `reasoning_summary`

## Axis scores

Обязательные оси:

- `completeness`
- `consistency`
- `traceability`
- `testability`
- `executability`
- `risk_exposure`
- `decision_clarity`

## Правила

- axis scores оцениваются по шкале `0..5`
- confidence возвращается отдельно от total score
- blocking issues имеют приоритет над total score при final readiness

## Логическая форма

```json
{
  "scope": "full-package",
  "axis_scores": {
    "completeness": 0,
    "consistency": 0,
    "traceability": 0,
    "testability": 0,
    "executability": 0,
    "risk_exposure": 0,
    "decision_clarity": 0
  },
  "total_score_5": 0,
  "total_score_100": 0,
  "confidence": "medium",
  "blocking_issues": [],
  "readiness_recommendation": "ready_with_constraints",
  "reasoning_summary": ""
}
```
