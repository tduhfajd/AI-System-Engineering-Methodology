---
name: methodology-orchestrator
description: Use when executing the AI System Engineering Methodology end-to-end or when deciding which stage skill should run next, enforcing gate decisions, handoff rules, and mandatory human review checkpoints.
---

# Methodology Orchestrator

Оркестратор управляет прохождением workflow через этапы 0-7.

## Используй skill, когда нужно

- определить текущий этап методологии
- выбрать допустимый следующий этап
- передать stage packet между stage skills
- остановить workflow при `blocked`
- перевести workflow в human review

## Обязательные источники

- `../../skills-technical-assignment.md`
- `../../automation/stage-automation-contracts.md`
- `../../automation/scoring-confidence-model.md`
- `../../methodology/README.md`
- `../../methodology/ba-layer-model.md`
- `../_shared/references/stage-packet.md`
- `../_shared/references/gate-decision.md`
- `../_shared/references/human-review-contract.md`
- `../examples/stage-packet-examples.md`
- `../examples/negative-path-examples.md`
- `../examples/demo-runtime-transcript.md`

## Процесс

1. Определи текущий `stage_id`, доступные входы и открытые риски.
2. Проверь, разрешен ли следующий этап по gate rules.
3. Если текущий этап требует mandatory human review, не запускай downstream stage автоматически.
4. Передай downstream skill только явные входы, решения, assumptions, gaps и blocking issues.
5. Если статус `blocked`, верни причину, blocking conditions и допустимое следующее действие.
6. Сверяй expected handoff и stop conditions с example references, но не копируй их mechanically, если фактический кейс отличается.
7. Не пропускай BA-layer: stakeholder map, glossary, business rules, use cases, domain/data analysis и acceptance criteria должны передаваться downstream так же явно, как engineering artifacts.

## Обязательный выход

- `current_stage`
- `allowed_next_stage`
- `gate_status`
- `human_signoff_required`
- `next_stage_input`
- `blocking_conditions`
- `review_scope`
- `ba_handoff_state`

## Границы

- Не выполняй работу stage skills сам, если можно передать ее специализированному skill.
- Не повышай статус `blocked` до `approved`.
- Не скрывай отсутствующие входы.
