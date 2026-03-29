---
name: stage-00-normalization
description: Use when running Stage 0 of the AI System Engineering Methodology to normalize an idea, raw text, partial specification, or existing specification into a structured baseline with assumptions, contradictions, open questions, and input confidence.
---

# Stage 0: Нормализация

## Обязательные источники

- `../_asef-shared/methodology/00-normalization.md`
- `../_asef-shared/automation/stage-automation-contracts.md`
- `../_asef-shared/references/stage-packet.md`
- `../_asef-shared/references/gate-decision.md`
- `../_asef-shared/references/quality-checks.md`
- `../_asef-shared/references/human-review-contract.md`
- `../_asef-shared/references/stage-output-template.md`
- `../_asef-shared/examples/stage-packet-examples.md`
- `../_asef-shared/examples/negative-path-examples.md`

## Вход

- исходный продуктовый input
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

## Границы

- Не придумывай business intent.
- Не решай стратегические противоречия без human review.
