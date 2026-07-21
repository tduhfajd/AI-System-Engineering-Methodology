# Skill Mapping

Этот документ связывает методологию, skills, выходные артефакты и gate-решения.

## 1. Оркестрация

| Методологический слой | Skill | Назначение | Основной результат |
|---|---|---|---|
| Workflow control | `methodology-orchestrator` | Управление переходами между этапами | допустимый следующий этап, handoff packet, gate status |
| Independent control | `independent-package-review` | Независимая проверка собранного пакета | findings, blockers, evidence и verdict готовности |

## 2. Stage mapping

| Этап | Skill | Основные артефакты | Gate решение |
|---|---|---|---|
| Stage 0 | `stage-00-normalization` | Normalized Brief, Assumption Log, Contradiction Log, Open Questions Register, Input Confidence Summary | переход к Stage 1 |
| Stage 1 | `stage-01-problem-formalization` | Problem Statement, Actor Map, Stakeholder Map, Goals and Non-Goals, Success Metrics, Constraint Register, Business Context, Glossary, Risk Framing | переход к Stage 2 |
| Stage 2 | `stage-02-requirements-extraction` | Functional Requirements, Business Rules, Use Cases, Acceptance Criteria Seed, NFR Baseline, Data Requirements, Integration Requirements, Traceability Matrix | переход к Stage 3 |
| Stage 3 | `stage-03-system-modeling` | Flow Model, State Model, Domain Entity Model, Entity Lifecycle Model, Use Case Realization, Domain Model, Decision Model, Exception Model | переход к Stage 4 |
| Stage 4 | `stage-04-architecture-design` | Architecture Overview, Component Map, Interface Model, Data Ownership Model, Integration Boundaries, ADR-like decisions | переход к Stage 5 |
| Stage 5 | `stage-05-specification-assembly` | PDD, FS, SDD, NFR, API Specification, Data Model, UX / User Flows, Business Rules Catalog, Use Case Model, Domain Model, Data Dictionary, Acceptance Criteria Catalog, User Stories if required, Consistency Register | переход к Stage 6 |
| Stage 6 | `stage-06-planning` | Execution Plan, WBS, Dependency Map, Milestones, Validation Checkpoints, Delivery Risks | переход к Stage 7 |
| Stage 7 | `stage-07-validation` | Validation Report, Readiness Decision, Defect and Gap Register, BA Sufficiency Assessment, Residual Risk Register, Handoff Recommendation, Scoring Report | implementation handoff |

## 3. Supporting skills

| Skill | Роль | Где используется |
|---|---|---|
| `artifact-template-loader` | Подгружает канонический шаблон документа | прежде всего Stage 5 и Stage 7 |
| `traceability-checker` | Проверяет сквозную трассировку | Stage 2, Stage 5, Stage 7 |
| `scoring-evaluator` | Считает scoring и confidence | Stage 7, а также stage-level review при необходимости |
| `stakeholder-glossary-builder` | Строит stakeholder map и glossary | прежде всего Stage 1 |
| `business-rules-extractor` | Выделяет business rules и policy logic | прежде всего Stage 2 |
| `use-case-modeler` | Строит use case inventory и detailed use cases | Stage 2 и Stage 3 |
| `domain-data-modeler` | Усиливает domain model и data dictionary | Stage 3 и Stage 5 |
| `acceptance-criteria-builder` | Формирует acceptance criteria seed и catalog | Stage 2, Stage 5, Stage 7 |
| `independent-package-review` | Независимо проверяет готовность и доказательства | после Stage 5 или Stage 7 |

## 4. Shared references

| Shared reference | Назначение |
|---|---|
| `_shared/references/stage-packet.md` | Единый handoff contract между этапами |
| `_shared/references/gate-decision.md` | Единый формат решения о переходе |
| `_shared/references/scoring-packet.md` | Единый формат scoring output |
| `_shared/references/run-manifest.md` | Журнал состояния прогона между этапами и сессиями |

## 5. Human checkpoints

| Точка | Основание |
|---|---|
| После Stage 0 | подтверждение фактов, assumptions и contradictions |
| После Stage 1 | подтверждение problem framing и scope |
| После Stage 2 | подтверждение требований, business rules, use cases и acceptance seed |
| После Stage 4 | подтверждение architecture trade-offs |
| После Stage 5 | подтверждение финального пакета спецификаций |
| После Stage 7 | подтверждение readiness decision и handoff |

## 6. Правило использования mapping

Если при разработке или исполнении skill появляется действие, которое невозможно привязать к:

- конкретному stage
- конкретному output artifact
- конкретному gate decision

то это действие либо находится вне scope skill, либо требует новой формализации в методологии.
