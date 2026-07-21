---
name: stage-04-architecture-design
description: Use when running Stage 4 of the AI System Engineering Methodology to convert the logical model into components, interfaces, data ownership, integration boundaries, and architectural decisions.
---

# Stage 4: Архитектурное проектирование

## Обязательные источники

- `../_shared/references/output-language-policy.md`
- `../_shared/references/run-manifest.md`

- `../../methodology/04-architecture-design.md`
- `../../automation/stage-automation-contracts.md`
- `../_shared/references/stage-packet.md`
- `../_shared/references/gate-decision.md`
- `../_shared/references/quality-checks.md`
- `../_shared/references/human-review-contract.md`
- `../_shared/templates/stage-output-template.md`
- `../examples/stage-packet-examples.md`
- `../examples/negative-path-examples.md`

## Вход

- outputs Stage 3

## Сделай

1. Разнеси logic по architectural responsibilities.
2. Определи component boundaries и interactions.
3. Зафиксируй data ownership и integration boundaries.
4. Проверь structural alignment with NFR.
5. Зафиксируй architectural decisions, risks и gaps.
6. Верни `Architecture Review Decision`.
7. Если architecture нарушает mandatory boundary или failure isolation, верни `blocked`.

## Обязательный выход

- `Architecture Overview`
- `Component Responsibility Map`
- `Interface and Interaction Model`
- `Data Ownership and Storage Model`
- `Integration Boundary Model`
- `Architectural Decision Register`
- `Architecture Risks and Gaps Register`
- `quality_checks`
- `human_review_state`
- `Architecture Review Decision`

## Журнал прогона

Если известна папка результатов, прочитай и обнови `RUN.md`: зафиксируй созданные артефакты, открытые вопросы, решения, blockers и следующее действие.

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не hardcode vendor, framework или stack как обязательный.
- Не скрывай ownership conflicts.
