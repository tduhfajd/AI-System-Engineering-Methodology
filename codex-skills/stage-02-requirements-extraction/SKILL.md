---
name: stage-02-requirements-extraction
description: Use when running Stage 2 of the AI System Engineering Methodology to derive testable functional, non-functional, data, integration requirements and business rules from a formalized problem.
---

# Stage 2: Извлечение требований

## Обязательные источники

- `../_asef-shared/methodology/02-requirements-extraction.md`
- `../_asef-shared/methodology/ba-layer-model.md`
- `../_asef-shared/automation/stage-automation-contracts.md`
- `../_asef-shared/templates/business-rules-catalog-template.md`
- `../_asef-shared/templates/use-case-model-template.md`
- `../_asef-shared/templates/acceptance-criteria-template.md`
- `../_asef-shared/templates/user-stories-template.md`
- `../_asef-shared/references/stage-packet.md`
- `../_asef-shared/references/gate-decision.md`
- `../_asef-shared/references/quality-checks.md`
- `../_asef-shared/references/human-review-contract.md`
- `../_asef-shared/references/stage-output-template.md`
- `../_asef-shared/examples/stage-packet-examples.md`
- `../_asef-shared/examples/negative-path-examples.md`

## Вход

- outputs Stage 1

## Сделай

1. Извлеки candidate requirements из actors, goals, metrics и constraints.
2. Раздели требования по типам.
3. Перепиши vague statements в testable form.
4. Собери business rules, use case inventory / use case model и acceptance criteria seed.
5. Собери NFR, data и integration requirements.
6. Определи, required ли user stories для этого типа проекта.
7. Построй traceability matrix.
8. Верни `Requirements Review Decision`.
9. Если требования не могут стать testable из-за нерешенного integration conflict, верни `blocked`.

## Обязательный выход

- `Functional Requirements Set`
- `Business Rules Register`
- `Use Case Inventory / Use Case Model`
- `Acceptance Criteria Seed`
- `Non-Functional Requirements Baseline`
- `Data Requirements`
- `Integration Requirements`
- `User Stories`, если required
- `Requirement Traceability Matrix`
- `Requirement Gaps and Conflicts Register`
- `ba_artifacts_produced`
- `quality_checks`
- `human_review_state`
- `Requirements Review Decision`

## Границы

- Не изобретай mandatory requirements без traceable basis.
- Не скрывай conflicts и untestable language.
- Не подменяй use cases user stories, если системе нужен полноценный BA-layer.
