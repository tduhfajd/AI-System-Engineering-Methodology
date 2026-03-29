# Scoring and Confidence Model

## 1. Назначение

Этот документ определяет количественную модель оценки качества методологического результата.

Модель нужна для того, чтобы:

- измерять полноту и готовность пакета документов
- отделять субъективное ощущение “вроде готово” от формальной оценки
- поддерживать Stage 7 `Validation`
- использовать scoring в agent workflows и human review

## 2. Что именно оценивается

Система оценки применяется к:

- отдельному этапу
- полному пакету артефактов
- финальному readiness decision

Оценка всегда должна сопровождаться:

- числовым score
- confidence level
- объяснением
- списком блокеров

## 3. Базовые оси оценки

Каждый пакет оценивается минимум по 7 осям:

1. `Completeness`
2. `Consistency`
3. `Traceability`
4. `Testability`
5. `Executability`
6. `Risk Exposure`
7. `Decision Clarity`

## 4. Шкала по каждой оси

Каждая ось оценивается по шкале от `0` до `5`:

- `0` — отсутствует или критически непригодно
- `1` — очень слабое покрытие, блокирует переход
- `2` — частичное покрытие, много критичных gaps
- `3` — рабочий минимум, есть контролируемые gaps
- `4` — сильное покрытие, незначительные пробелы
- `5` — полное и согласованное покрытие без существенных gaps

## 5. Определения осей

### 5.1 Completeness

Проверяет:

- существуют ли все обязательные артефакты
- заполнены ли обязательные разделы
- покрыты ли ключевые аспекты ТЗ и методологии

### 5.2 Consistency

Проверяет:

- нет ли противоречий между документами
- едина ли терминология
- совпадают ли scope, constraints, flows, API, data и architecture

### 5.3 Traceability

Проверяет:

- можно ли проследить путь от исходного input до финального документа
- есть ли связь между проблемой, требованиями, моделью, дизайном и планом
- не появились ли важные элементы “из ниоткуда”

### 5.4 Testability

Проверяет:

- сформулированы ли требования и критерии так, чтобы их можно было проверить
- можно ли верифицировать ключевые сценарии и quality expectations

### 5.5 Executability

Проверяет:

- может ли delivery team реально начать работу
- достаточно ли определены work packages, dependencies и checkpoints
- не требует ли пакет постоянных уточнений перед стартом

### 5.6 Risk Exposure

Проверяет:

- насколько велики незакрытые риски
- насколько хорошо они документированы
- есть ли blocking defects, masquerading as residual risks

Важно: для этой оси высокий score означает низкий неконтролируемый риск.

### 5.7 Decision Clarity

Проверяет:

- понятны ли границы решений
- видны ли human approvals
- отделены ли факты от допущений
- нет ли скрытых решений, принятых AI без signoff

## 6. Рекомендуемые веса

Для финальной оценки полного пакета рекомендуется следующая weight model:

| Axis | Weight |
|---|---|
| Completeness | 0.20 |
| Consistency | 0.20 |
| Traceability | 0.15 |
| Testability | 0.15 |
| Executability | 0.15 |
| Risk Exposure | 0.10 |
| Decision Clarity | 0.05 |

Сумма весов должна быть равна `1.0`.

## 7. Расчет общего score

### Формула

`Total Score = Sum(axis_score * axis_weight)`

Где каждый `axis_score` находится в диапазоне `0..5`.

Финальный результат также выражается:

- в шкале `0..5`
- в процентах `0..100`

### Пример

Если:

- Completeness = 4
- Consistency = 3
- Traceability = 4
- Testability = 3
- Executability = 4
- Risk Exposure = 3
- Decision Clarity = 4

То:

`Total Score = 3.55 / 5`

или:

`71 / 100`

## 8. Confidence model

Score и confidence не одно и то же.

### Score

Показывает качество результата.

### Confidence

Показывает, насколько можно доверять самой оценке.

Confidence оценивается отдельно по шкале:

- `Low`
- `Medium`
- `High`

### Confidence зависит от:

- полноты входных данных
- количества human signoff
- числа незакрытых assumptions
- наличия traceability evidence
- доли sections, оцененных не по факту, а по inference

## 9. Правила confidence assignment

### High

Допустим только если:

- большинство обязательных артефактов реально присутствуют
- есть human signoff на ключевых этапах
- traceability доказуема
- blocking issues отсутствуют

### Medium

Если:

- пакет в целом покрыт
- есть контролируемые gaps
- часть оценки опирается на inference или incomplete evidence

### Low

Если:

- существенные части пакета отсутствуют
- много незакрытых assumptions
- human review ограничен
- невозможно уверенно доказать consistency или executability

## 10. Threshold model для readiness decision

### Ready for implementation

Только если одновременно:

- `Total Score >= 4.0 / 5`
- `Completeness >= 4`
- `Consistency >= 4`
- `Executability >= 4`
- `Testability >= 3`
- blocking defects отсутствуют

### Ready with explicit constraints

Если одновременно:

- `Total Score >= 3.0 / 5`
- нет критических противоречий
- есть управляемые gaps
- ограничения на старт явно перечислены

### Not ready

Если выполнено хотя бы одно:

- `Total Score < 3.0 / 5`
- `Completeness < 3`
- `Consistency < 3`
- `Executability < 3`
- есть blocking defects, мешающие старту

## 11. Stage-level scoring

Scoring можно применять и к отдельным этапам.

### Recommended stage-level use

- Stages 0-2: акцент на Completeness, Decision Clarity, Traceability
- Stages 3-4: акцент на Consistency, Traceability, Risk Exposure
- Stage 5: акцент на Completeness и Consistency
- Stage 6: акцент на Executability
- Stage 7: акцент на full weighted model

## 12. Blocking override rule

Если есть `blocking issue`, числовой score не может сам по себе перевести результат в `Ready for implementation`.

То есть:

- score может быть высоким
- но final status обязан остаться `Not ready` или `Ready with explicit constraints`

если blocking issue не снят человеком.

## 13. Минимальный scoring packet

Каждая scoring-оценка должна возвращать:

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

## 14. Как использовать модель в Validation

Stage 7 обязан:

1. Рассчитать scores по всем обязательным осям.
2. Зафиксировать confidence.
3. Проверить blocking override rule.
4. Сопоставить результат с readiness thresholds.
5. Вернуть numeric score вместе с human-readable explanation.

## 15. Как использовать модель в automation contracts

Automation layer может использовать scoring:

- как quality check внутри stage packet
- как вход в gate decision
- как триггер human escalation

### Recommended escalation rules

- Если `Consistency <= 2`, обязательный human review
- Если `Executability <= 2`, нельзя переходить к implementation handoff
- Если `Confidence = Low`, нельзя auto-approve даже при высоком score

## 16. Критерий завершения scoring layer

Scoring model считается достаточной, если:

1. Есть единые оси оценки.
2. Есть шкала, веса и thresholds.
3. Score и confidence разделены.
4. Есть blocking override rule.
5. Модель применима и к human review, и к agent workflows.
