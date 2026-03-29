---
name: stage-05-specification-assembly
description: Use when running Stage 5 of the AI System Engineering Methodology to assemble the final document package including PDD, FS, SDD, NFR, API, Data Model, and UX/User Flows from validated prior-stage outputs.
---

# Stage 5: Сборка спецификаций

## Обязательные источники

- `../../methodology/05-specification-assembly.md`
- `../../methodology/ba-layer-model.md`
- `../../automation/stage-automation-contracts.md`
- `../../templates/README.md`
- `../_shared/references/stage-packet.md`
- `../_shared/references/gate-decision.md`
- `../_shared/references/quality-checks.md`
- `../_shared/references/human-review-contract.md`
- `../_shared/templates/stage-output-template.md`
- `../examples/stage-packet-examples.md`
- `../examples/negative-path-examples.md`

## Вход

- outputs Stage 0-4

## Сделай

1. Отобрази prior-stage outputs на target documents.
2. Используй canonical templates.
3. Собери PDD, FS, SDD, NFR, API, Data Model и UX/User Flows.
4. Собери Business Rules Catalog, Use Case Model, Domain Model, Data Dictionary, Acceptance Criteria Catalog и User Stories, если required.
5. Проверь cross-document consistency, включая BA-to-engineering consistency.
6. Зафиксируй carry-forward gaps и traceability.
7. Верни `Specification Assembly Review Decision`.
8. Сверяй assembled handoff с stage packet examples и не скрывай unresolved conflicts в document package.

## Обязательный выход

- `PDD`
- `FS`
- `SDD`
- `NFR`
- `API Specification`
- `Data Model`
- `UX / User Flows`
- `Business Rules Catalog`
- `Use Case Model`
- `Domain Model`
- `Data Dictionary`
- `Acceptance Criteria Catalog`
- `User Stories`, если required
- `Specification Consistency and Traceability Register`
- `ba_artifacts_produced`
- `quality_checks`
- `human_review_state`
- `Specification Assembly Review Decision`

## Границы

- Не удаляй unresolved issues ради более гладкого пакета.
- Не копируй content blindly без document curation.
- Не растворяй BA-layer внутри engineering docs без явной traceability.
