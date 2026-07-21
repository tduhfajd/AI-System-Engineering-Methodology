---
name: scoring-evaluator
description: Use when evaluating a stage or a full methodology package against the scoring and confidence model, calculating axis scores, total score, confidence level, and readiness recommendation.
---

# Scoring Evaluator

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../automation/scoring-confidence-model.md`
- `../../methodology/ba-layer-model.md`
- `../../templates/scoring-report-template.md`
- `../_shared/references/scoring-packet.md`

## Используй skill, когда нужно

- рассчитать stage-level score
- рассчитать full-package score
- определить confidence level
- проверить readiness thresholds
- оценить BA-quality по `business_clarity` и `data_definition_quality`

## Сделай

1. Оцени package по всем обязательным axes.
2. Рассчитай total score по weight model.
3. Определи confidence level.
4. Примени blocking override rule.
5. Верни scoring report и recommendation.

## Обязательный выход

- axis scores
- total score `0..5`
- total score `0..100`
- confidence
- blocking issues
- readiness recommendation

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не подменяй scoring субъективной общей оценкой.
- Не выдавай `Ready for implementation`, если blocking override rule не удовлетворен.
