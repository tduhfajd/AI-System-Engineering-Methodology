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

- `../_asef-shared/references/output-language-policy.md`
- `../_asef-shared/references/run-manifest.md`

- `../_asef-shared/project/skills-technical-assignment.md`
- `../_asef-shared/automation/stage-automation-contracts.md`
- `../_asef-shared/automation/scoring-confidence-model.md`
- `../_asef-shared/methodology/README.md`
- `../_asef-shared/methodology/ba-layer-model.md`
- `../_asef-shared/methodology/artifact-applicability-matrix.md`
- `../_asef-shared/methodology/idea-viability-pre-gate.md`
- `../_asef-shared/references/stage-packet.md`
- `../_asef-shared/references/gate-decision.md`
- `../_asef-shared/references/human-review-contract.md`
- `../_asef-shared/examples/stage-packet-examples.md`
- `../_asef-shared/examples/negative-path-examples.md`
- `../_asef-shared/examples/demo-runtime-transcript.md`

## Выбор режима

Перед первым этапом выбери и зафиксируй в `RUN.md` один режим:

- `quick_discovery` — Stage 0–2 для нормализованного брифа, problem framing, требований, бизнес-правил, вариантов использования и критериев приёмки. Заверши явным списком того, чего не хватает до implementation handoff.
- `full_delivery` — полный маршрут Stage 0–7 с обязательными gate и human checkpoints.
- `existing_spec_review` — нормализуй готовое ТЗ, выполни targeted review через `traceability-checker`, `scoring-evaluator` и нужные supporting skills; не генерируй полный пакет без явного запроса.

Если пользователь не выбрал режим, предложи `full_delivery` для нового продукта и `existing_spec_review` для готового ТЗ.

## Процесс

1. Прочитай существующий `RUN.md` или создай его в папке результатов; зафиксируй выбранный режим, входы и стартовые открытые риски.
2. Для новой идеи с неподтверждённым спросом предложи optional pre-gate `$roast-startup-ru`; обработай его verdict по правилам `idea-viability-pre-gate.md`.
3. Определи текущий `stage_id`, доступные входы и открытые риски.
2. Проверь, разрешен ли следующий этап по gate rules.
3. Если текущий этап требует mandatory human review, не запускай downstream stage автоматически.
4. Передай downstream skill только явные входы, решения, assumptions, gaps и blocking issues.
5. Если статус `blocked`, верни причину, blocking conditions и допустимое следующее действие.
6. Сверяй expected handoff и stop conditions с example references, но не копируй их mechanically, если фактический кейс отличается.
7. Не пропускай BA-layer: stakeholder map, glossary, business rules, use cases, domain/data analysis и acceptance criteria должны передаваться downstream так же явно, как engineering artifacts.
8. После каждого перехода обнови `RUN.md`: текущий этап, созданные артефакты, решения, blockers и следующее допустимое действие.

## Обязательный выход

- `current_stage`
- `allowed_next_stage`
- `gate_status`
- `human_signoff_required`
- `next_stage_input`
- `blocking_conditions`
- `review_scope`
- `ba_handoff_state`
- `selected_mode`
- `run_manifest_status`

## Языковой контракт

Следуй `output-language-policy.md`: весь результат и все создаваемые артефакты оформляй на русском языке и выполни проверку языка перед выдачей.

## Границы

- Не выполняй работу stage skills сам, если можно передать ее специализированному skill.
- Не повышай статус `blocked` до `approved`.
- Не скрывай отсутствующие входы.
