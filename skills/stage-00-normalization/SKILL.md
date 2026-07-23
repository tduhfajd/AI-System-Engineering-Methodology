---
name: stage-00-normalization
description: Use when running Stage 0 of the AI System Engineering Methodology to normalize an idea, raw text, partial specification, or existing specification into a structured baseline with assumptions, contradictions, open questions, and input confidence.
---

# Stage 0: Нормализация

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../methodology/00-normalization.md`
- `../../automation/stage-automation-contracts.md`
- `../_shared/references/stage-packet.md`
- `../_shared/references/gate-decision.md`
- `../_shared/references/quality-checks.md`
- `../_shared/references/human-review-contract.md`
- `../_shared/templates/stage-output-template.md`
- `../examples/stage-packet-examples.md`
- `../examples/negative-path-examples.md`

## Вход

- исходный продуктовый input
- verdict и evidence pre-gate, если он был проведён
- hypothesis register, experiment decision и evidence из `$fast-track-validation`, если проверка проводилась
- prior decisions, если они есть
- execution constraints, если они есть

## Сделай

1. Инвентаризируй source input.
2. Разложи вход на атомарные утверждения.
3. Отдели facts от inference.
4. Выяви contradictions, assumptions и unknowns.
5. Собери `Normalized Brief` и сопутствующие логи.
6. Верни gate decision для Stage 1.
7. Если source input содержит неразрешимое противоречие, верни `blocked` по negative-path rules.

## Обязательный выход

- `Normalized Brief`
- `Assumption Log`
- `Contradiction Log`
- `Open Questions Register`
- `Input Confidence Summary`
- `quality_checks`
- `human_review_state`
- `gate_decision`

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не придумывай business intent.
- Не решай стратегические противоречия без human review.
