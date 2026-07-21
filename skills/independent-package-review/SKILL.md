---
name: independent-package-review
description: Use when an assembled or validated methodology package needs an independent Russian-language review for contradictions, missing evidence, unresolved assumptions, traceability gaps, and readiness risks.
---

# Independent Package Review

## Обязательные источники

- `../../automation/scoring-confidence-model.md`
- `../../methodology/07-validation.md`
- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`
- `../_shared/references/stage-packet.md`

## Используй skill, когда нужно

- провести независимый review после Stage 5 или Stage 7;
- проверить пакет перед implementation handoff;
- переоценить готовность после существенного изменения scope.

## Сделай

1. Работай только по предоставленным артефактам и evidence; не генерируй недостающие документы вместо выявления пробела.
2. Проверь внутренние противоречия, трассировку, допущения, пробелы, blockers, полноту ключевых сценариев и язык артефактов.
3. Отдели blocking defects от advisory improvements.
4. Сверь вывод с `RUN.md` и отметь расхождения между журналом и пакетом.
5. Обнови `RUN.md` ссылкой на review и допустимым следующим действием.

## Обязательный выход

- `Независимый review report`;
- список findings с severity, evidence и затронутыми артефактами;
- список blocking defects и advisory improvements;
- verdict: `готово`, `готово с ограничениями` или `не готово`;
- рекомендация следующего действия.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не подтверждай готовность только потому, что пакет выглядит полным.
- Не заменяй validation: это независимая проверка его вывода и доказательств.
