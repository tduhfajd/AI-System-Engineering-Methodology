# Этап 3: Моделирование системы

## Цель

Преобразовать утвержденный набор требований в логическую модель поведения будущей системы: какие actors и events запускают поведение, как происходят переходы состояний, какие сущности участвуют и как должны работать нормальные и исключительные пути.

## Зачем нужен этот этап

Требования описывают obligations, но еще не показывают, как они складываются в coherent system. Если перескочить от требований прямо к architecture, команды начинают распределять компоненты и data stores до того, как поняты core logic, state transitions и exception handling.

## Входы

- `Functional Requirements Set`
- `Business Rules Register`
- `Non-Functional Requirements Baseline`
- `Data Requirements`
- `Integration Requirements`
- `Requirement Traceability Matrix`
- `Requirement Gaps and Conflicts Register`
- `Requirements Review Decision`

## Критерии входа

- результаты Этапа 2 существуют и имеют статус approved или approved with explicit gaps
- requirement conflicts, которые искажают core behavior, разрешены или явно приняты как bounded modeling risk
- набор требований достаточно testable, чтобы на его основе выводить logical system behavior

## Критерии выхода

- ключевые system flows смоделированы
- state transitions явно описаны там, где есть stateful behavior
- domain entities и их logical relationships явно определены
- decisions, rules и invariants, управляющие поведением, явно определены
- exception и failure paths представлены
- assumptions и unresolved model gaps явно зафиксированы
- логическая модель достаточно конкретна, чтобы перейти к architecture design без догадок о поведении

## Основные выходы

1. `System Flow Model`
2. `State Transition Model`
3. `Domain Entity Model`
4. `Decision and Rule Model`
5. `Exception and Edge Case Model`
6. `Model Assumptions and Gaps Register`
7. `System Modeling Review Decision`

## Каноническая модель выхода

### 1. System Flow Model

Модель потоков должна описывать:

- initiating actors или events
- последовательность logical actions
- decision points
- взаимодействия с внешними системами
- outcomes для successful и unsuccessful paths

Представление может быть текстовым, табличным или диаграммным, но оно должно оставаться implementation-agnostic.

### 2. State Transition Model

Там, где сущности или процессы меняются во времени, нужно определить:

- состояния
- условия входа
- условия выхода
- допустимые переходы
- недопустимые переходы
- state-dependent rules

Если meaningful statefulness отсутствует, это должно быть зафиксировано явно.

### 3. Domain Entity Model

Нужно зафиксировать logical entities, которые требуются для поведения системы:

- имена сущностей
- их смысл
- ключевые relationships
- ownership на domain level
- значение для жизненного цикла

Это еще не storage schema и не physical data design.

### 4. Decision and Rule Model

Нужно явно показать:

- branching decisions
- policy checks
- calculated outcomes
- invariants, которые должны выполняться всегда
- precedence rules при конкуренции условий

Rules должны быть видны как отдельные model elements, а не спрятаны внутри flow prose.

### 5. Exception and Edge Case Model

Нужно описать:

- invalid inputs
- failed dependencies
- concurrency или sequencing conflicts, если релевантны
- timeout, retry или recovery expectations на logical level
- actor-visible failure outcomes
- operator-visible failure outcomes

### 6. Model Assumptions and Gaps Register

Нужно зафиксировать:

- assumptions, необходимые для завершения logical model
- unresolved ambiguities
- modeled approximations
- deferred decisions, которые architecture не должна молча “додумать”

Для каждого пункта нужно отметить, блокирует ли он architecture design.

### 7. System Modeling Review Decision

Этап должен завершаться одним из статусов:

- `Approved`
- `Approved with explicit gaps`
- `Blocked`

## Поток моделирования

### Шаг 1. Сгруппировать требования в behavioral slices

Нужно сгруппировать утвержденные требования в coherent scenarios, например:

- основные actor journeys
- административные потоки
- фоновые процессы
- integration-triggered flows

### Шаг 2. Отобразить triggers, actions и outcomes

Для каждого slice нужно определить:

- что запускает поведение
- что именно система должна решить
- какой logical outcome должен наступить
- какие альтернативные outcomes возможны

### Шаг 3. Найти сущности и отношения

Нужно вывести сущности, без которых поведение системы невозможно, и описать их logical relationships.

### Шаг 4. Определить states и transitions

Там, где поведение зависит от жизненного цикла или progression over time, state model должен быть явно описан, а не размазан по разным flow descriptions.

### Шаг 5. Вытащить decisions и invariants

Нужно вынести branching rules, calculations и always-true conditions в отдельные model elements.

### Шаг 6. Смоделировать failure и edge behavior

Нужно проверить, как система должна вести себя, когда:

- actor действует в неправильном порядке
- данные отсутствуют или невалидны
- зависимость падает
- происходят duplicate или conflicting actions
- ломаются timing assumptions

### Шаг 7. Проверить coverage против требований

Нужно убедиться, что каждый high-impact requirement представлен хотя бы одним из элементов:

- flow
- state rule
- relationship между domain entities
- decision или invariant
- exception path

### Шаг 8. Выпустить system modeling review decision

Нужно определить, является ли logical model:

- ready for architecture design
- ready with controlled gaps
- blocked pending clarification

## Роль AI

AI может:

- группировать требования в scenarios и flows
- черново моделировать normal и exception behavior
- выводить candidate states и transitions из языка требований
- выявлять invariants, missing branches и modeling gaps
- строить начальную traceability от требований к logical model elements

AI не должен:

- подменять логику архитектурными компонентами
- придумывать hidden system behavior без опоры на требования
- схлопывать unresolved decisions в один modeled path без явной пометки
- утверждать stage exit от лица человека

## Роль человека

Human review обязателен для:

- утверждения интерпретации high-impact flows
- валидации domain entities и state boundaries
- подтверждения exception behavior там, где есть существенное business impact
- решения, допустимы ли remaining modeling gaps для architecture work
- принятия или отклонения system modeling review decision

## Gate Review Checklist

- [ ] Primary flows явно описаны и трассируются к требованиям.
- [ ] State transitions смоделированы там, где lifecycle behavior критичен.
- [ ] Domain entities понятны на logical level.
- [ ] Decisions, invariants и business rules явно видимы.
- [ ] Exception и edge cases смоделированы, а не подразумеваются.
- [ ] Модель не навязывает architecture или technology раньше времени.
- [ ] Assumptions и modeling gaps явно зафиксированы.
- [ ] Human reviewer утвердил решение о выходе с этапа.

## Failure Modes

### Failure Mode: architecture leakage

Симптом: модель начинает называть services, databases, queues или APIs вместо описания logical behavior.

Митигирующее действие: до architecture work требовать implementation-agnostic flows, states, entities и decisions.

### Failure Mode: happy-path bias

Симптом: моделируется только основной success flow, а failures и conflicts откладываются на потом.

Митигирующее действие: требовать explicit exception и edge case modeling до stage approval.

### Failure Mode: fragmented state logic

Симптом: lifecycle behavior распределено по разным требованиям и flows без coherent state model.

Митигирующее действие: централизовать state transitions там, где поведение зависит от progression over time.

### Failure Mode: requirement-model drift

Симптом: модель выглядит красиво, но больше не покрывает то, что реально требовали approved requirements.

Митигирующее действие: требовать traceability от high-impact requirements к flows, rules, entities или states.

## Шаблон deliverable

```md
# System Modeling

## Flows

## State Transitions

## Domain Entities

## Decisions and Invariants

## Exceptions and Edge Cases

## Assumptions and Gaps

## Review Decision
```

## Правило завершения

Этап 3 считается завершенным только тогда, когда архитектор может назначить components, interfaces и ownership boundaries на основе его результатов, не пытаясь заново восстановить, как система должна логически работать.
