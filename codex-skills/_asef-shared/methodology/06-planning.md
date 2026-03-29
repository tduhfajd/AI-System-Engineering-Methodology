# Этап 6: Планирование

## Цель

Преобразовать завершенный пакет спецификаций в исполнимый delivery plan, который определяет work packages, sequencing, dependencies, milestones, validation points и release-oriented execution logic.

## Зачем нужен этот этап

Даже полный specification package не гарантирует smooth execution. Delivery-команде нужен явный план, который превращает product и system intent в упорядоченный implementation path. Без этого этапа реализация стартует с хороших документов, но быстро деградирует в ad hoc prioritization, hidden dependencies и late discovery delivery risks.

## Входы

- `Product Definition Document (PDD)`
- `Functional Specification (FS)`
- `System Design Document (SDD)`
- `Non-Functional Requirements (NFR)`
- `API Specification`
- `Data Model`
- `UX / User Flows`
- `Specification Consistency and Traceability Register`
- `Specification Assembly Review Decision`

## Критерии входа

- результаты Этапа 5 существуют и имеют статус approved или approved with explicit gaps
- final specification package достаточно coherent, чтобы разложить его на task decomposition
- remaining document gaps достаточно ограничены, чтобы быть явно представлены как planning assumptions или risks

## Критерии выхода

- работа декомпозирована на executable packages
- sequencing и dependencies явно определены
- milestones или phases явно определены
- validation и review checkpoints явно встроены
- delivery risks, assumptions и blockers явно перечислены
- план достаточно конкретен, чтобы delivery team могла начать implementation без изобретения собственной execution structure

## Основные выходы

1. `Execution Plan`
2. `Work Breakdown Structure`
3. `Dependency Map`
4. `Milestone and Phase Plan`
5. `Validation and Review Checkpoint Plan`
6. `Delivery Risks and Assumptions Register`
7. `Planning Review Decision`

## Каноническая модель выхода

### 1. Execution Plan

Execution plan должен определять:

- implementation approach
- sequencing logic
- workstreams, если они релевантны
- major delivery phases
- release-oriented checkpoints

Его роль — быть authoritative implementation path.

### 2. Work Breakdown Structure

Work breakdown должен раскладывать specification на:

- coherent implementation units
- units, достаточно малые для оценки, назначения и проверки
- units, трассируемые к specification artifacts

Для каждой единицы нужно определить:

- идентификатор
- objective
- source documents или sections
- completion signal

### 3. Dependency Map

Нужно фиксировать:

- prerequisite relationships
- blocking dependencies
- внешние зависимости
- sequencing constraints
- возможности для parallel work, если они релевантны

Dependencies должны быть достаточно явными, чтобы выявлять schedule risk и critical path.

### 4. Milestone and Phase Plan

Нужно фиксировать:

- delivery phases
- milestone outcomes
- milestone entry и exit conditions
- scope, сгруппированный по milestones

План должен показывать, как implementation progresses от foundation до release readiness.

### 5. Validation and Review Checkpoint Plan

Нужно определить:

- когда требуется design review
- когда требуется technical review
- когда проходят testing checkpoints
- когда требуется stakeholder validation
- какие checkpoints blocking, а какие advisory

Это не позволяет validation сдвигаться на самый конец.

### 6. Delivery Risks and Assumptions Register

Нужно фиксировать:

- assumptions, влияющие на sequencing или scope
- delivery blockers
- risk hotspots
- likely rework areas
- rollout sensitivities, если это релевантно

Для каждого пункта нужно указать impact, likelihood, если известна, и mitigation или monitoring direction.

### 7. Planning Review Decision

Этап должен завершаться одним из статусов:

- `Approved`
- `Approved with explicit gaps`
- `Blocked`

## Поток планирования

### Шаг 1. Найти implementation slices

Нужно разделить final specification package на естественные implementation slices, например:

- foundation work
- core product flows
- supporting integrations
- administrative или operational capabilities
- quality и reliability work

### Шаг 2. Определить work packages

Нужно превратить slices в concrete work packages, которые достаточно малы для execution, но при этом не теряют смысловых outcome boundaries.

### Шаг 3. Выстроить sequence

Нужно определить:

- что должно происходить first
- что может идти параллельно
- что зависит от завершения architecture или interfaces
- что стоит отложить, чтобы снизить rework risk

### Шаг 4. Определить milestones

Нужно сгруппировать work packages в milestones или phases с четкими outcomes и checkpoint criteria.

### Шаг 5. Встроить review и validation gates

Нужно embed'ить review и validation checkpoints внутрь плана, а не располагать их только в самом конце.

### Шаг 6. Подсветить delivery risks

Нужно проверить:

- dependency bottlenecks
- under-specified work packages
- high-risk integrations
- NFR-heavy implementation items
- sequence-sensitive rollout concerns

### Шаг 7. Проверить execution readiness

Нужно убедиться, что delivery team реально сможет следовать плану без того, чтобы invent дополнительную execution structure locally.

### Шаг 8. Выпустить planning review decision

Нужно определить, является ли execution plan:

- ready for final validation
- ready with controlled gaps
- blocked pending clarification

## Роль AI

AI может:

- раскладывать specification package на candidate work packages
- предлагать sequencing и milestone grouping
- выявлять hidden dependencies и critical path risks
- собирать draft checkpoint и validation plans
- находить planning gaps и implementation hotspots

AI не должен:

- симулировать certainty по effort, staffing или timing без реального основания
- скрывать planning risk, artificially flattening dependencies
- превращать unresolved specification gaps в silently assumed implementation tasks
- утверждать stage exit от лица человека

## Роль человека

Human review обязателен для:

- утверждения decomposition boundaries и milestone logic
- проверки соответствия плана организационным constraints
- принятия или отклонения execution risks и assumptions
- принятия или отклонения planning review decision

## Gate Review Checklist

- [ ] Работа разложена на executable packages.
- [ ] Dependencies и sequencing явно описаны.
- [ ] У milestones есть clear outcomes.
- [ ] Validation и review checkpoints встроены в план.
- [ ] Delivery risks и assumptions видимы.
- [ ] План сохраняет traceability к final specification package.
- [ ] План пригоден для работы delivery team без изобретения недостающей execution structure.
- [ ] Human reviewer утвердил решение о выходе с этапа.

## Failure Modes

### Failure Mode: pseudo-plan

Симптом: план просто повторяет структуру документации, но не задает executable work packages и sequence.

Митигирующее действие: требовать decomposition в concrete implementation units с completion signals.

### Failure Mode: hidden dependencies

Симптом: команды стартуют параллельно, хотя на самом деле заблокированы shared architecture, data или interface decisions.

Митигирующее действие: требовать explicit dependency map и critical path thinking.

### Failure Mode: validation at the end

Симптом: testing и review появляются только как closing steps, когда implementation уже supposedly completed.

Митигирующее действие: требовать embedded validation и review checkpoints throughout the plan.

### Failure Mode: risk-free fiction

Симптом: план выглядит orderly только потому, что assumptions и delivery risks опущены.

Митигирующее действие: делать delivery risk и assumptions register first-class output.

## Шаблон deliverable

```md
# Planning

## Execution Plan

## Work Breakdown Structure

## Dependency Map

## Milestones and Phases

## Validation and Review Checkpoints

## Delivery Risks and Assumptions

## Review Decision
```

## Правило завершения

Этап 6 считается завершенным только тогда, когда implementation team может начать работу по этому плану, четко понимая, что делать первым, что от чего зависит, когда проводить validation и где лежат основные delivery risks.
