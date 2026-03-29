# Этап 4: Архитектурное проектирование

## Цель

Преобразовать утвержденную логическую модель системы в явную архитектурную структуру, которая определяет компоненты, интерфейсы, зоны ответственности, владение данными, интеграционные границы и архитектурные решения, необходимые для implementation-ready documentation.

## Зачем нужен этот этап

System modeling объясняет, что система должна делать логически, но еще не определяет, как responsibility распределяется по компонентам и boundaries. Без этого этапа финальные спецификации часто содержат behavior descriptions без defendable technical structure, что приводит к inconsistent implementations и hidden coupling.

## Входы

- `System Flow Model`
- `State Transition Model`
- `Domain Entity Model`
- `Decision and Rule Model`
- `Exception and Edge Case Model`
- `Model Assumptions and Gaps Register`
- `System Modeling Review Decision`
- релевантные non-functional и integration constraints из предыдущих этапов

## Критерии входа

- результаты Этапа 3 существуют и имеют статус approved или approved with explicit gaps
- logical model достаточно согласована, чтобы assign responsibilities и boundaries
- blocking modeling gaps, искажающие component partitioning, разрешены или явно приняты как bounded architecture risk

## Критерии выхода

- core components и их responsibilities явно определены
- component interactions и interfaces явно определены
- data ownership и storage responsibilities явно определены
- integration boundaries явно определены
- архитектурные решения, поддерживающие ключевые NFR, явно определены
- архитектурные risks, trade-offs и unresolved gaps явно зафиксированы
- архитектура достаточно конкретна, чтобы собрать полную спецификацию без структурных догадок

## Основные выходы

1. `Architecture Overview`
2. `Component Responsibility Map`
3. `Interface and Interaction Model`
4. `Data Ownership and Storage Model`
5. `Integration Boundary Model`
6. `Architectural Decision Register`
7. `Architecture Risks and Gaps Register`
8. `Architecture Review Decision`

## Каноническая модель выхода

### 1. Architecture Overview

Архитектурный обзор должен описывать:

- главный архитектурный стиль или набор стилей
- ключевые system boundaries
- principal runtime или logical subsystems
- почему выбранная структура соответствует problem profile и набору требований

Обзор должен оставаться достаточно technology-agnostic, чтобы методология не потеряла portability, даже если обсуждаются concrete implementation directions.

### 2. Component Responsibility Map

Для каждого major component нужно определить:

- responsibility
- owned behavior
- owned decisions
- upstream и downstream dependencies
- что компонент explicitly does not own

Это предотвращает blurred ownership и duplicated logic.

### 3. Interface and Interaction Model

Нужно описать:

- component-to-component interactions
- interface contracts на conceptual level
- synchronous vs asynchronous interaction choices, если это релевантно
- command, query, event или batch interaction style, если это релевантно
- failure expectations между компонентами

Это boundary model, а не детальная API specification.

### 4. Data Ownership and Storage Model

Нужно зафиксировать:

- какой компонент владеет какими domain data
- кто отвечает за persistence
- read/write authority boundaries
- consistency expectations
- replication, caching или derived-view needs, если они релевантны

Это еще не physical schema, но ambiguity around ownership должна быть снята.

### 5. Integration Boundary Model

Нужно описать:

- внешние системы и точки их подключения
- trust boundaries
- inbound и outbound responsibilities
- criticality зависимости
- expectations по containment failures

### 6. Architectural Decision Register

Нужно фиксировать значимые structural decisions, например:

- partitioning strategy
- placement of boundaries
- communication style
- state ownership model
- resiliency strategy
- observability strategy

Для каждого решения должно быть указано:

- формулировка решения
- причина
- альтернативы, если они рассматривались
- impact

### 7. Architecture Risks and Gaps Register

Нужно фиксировать:

- unresolved structural questions
- risks к scalability, reliability, security или operability
- assumptions, от которых зависит архитектура
- deferred decisions, которые specification assembly обязана сохранить явно

Для каждого пункта должно быть отмечено, блокирует ли он final specification assembly.

### 8. Architecture Review Decision

Этап должен завершаться одним из статусов:

- `Approved`
- `Approved with explicit gaps`
- `Blocked`

## Поток архитектурного проектирования

### Шаг 1. Отобразить logical behavior на responsibility boundaries

Нужно распределить flows, decisions и entity ownership из Этапа 3 по distinct architectural responsibilities.

### Шаг 2. Определить component boundaries

Нужно определить major components или subsystems, которые поддерживают logical model без excessive coupling и ambiguous ownership.

### Шаг 3. Определить interaction patterns

Для каждого важного взаимодействия через границу нужно определить:

- кто инициирует
- что передается
- ожидаемый response pattern
- ожидания к failure behavior

### Шаг 4. Определить data ownership

Нужно определить, какой компонент является authoritative source для каких данных и где нужны shared views или synchronization mechanisms.

### Шаг 5. Проверить alignment с нефункциональными требованиями

Нужно проверить, как структура отвечает на:

- performance
- scalability
- security
- reliability
- observability
- maintainability

Если NFR не отражен структурно, gap должен быть явно зафиксирован.

### Шаг 6. Проверить integration и trust boundaries

Нужно явно показать внешние зависимости, boundary crossings и sensitive data flows.

### Шаг 7. Зафиксировать trade-offs и unresolved risks

Нужно объяснить, почему выбранная структура приемлема и какие risks остаются открытыми.

### Шаг 8. Выпустить architecture review decision

Нужно определить, является ли architecture:

- ready for specification assembly
- ready with controlled gaps
- blocked pending clarification

## Роль AI

AI может:

- предлагать candidate component decomposition
- выявлять coupling, ownership и interface risks
- подсказывать architectural patterns, подходящие logical model и NFR profile
- собирать interaction и ownership maps
- находить architectural gaps, особенно вокруг non-functional concerns

AI не должен:

- навязывать одного vendor, framework или technology stack как скрытое требование
- придумывать architectural constraints без traceable basis
- разрешать существенные trade-offs, связанные с risk, cost или organizational constraints, без human approval
- утверждать stage exit от лица человека

## Роль человека

Human review обязателен для:

- утверждения component boundaries и ownership choices
- валидации major architectural trade-offs
- подтверждения, что ключевые NFR представлены достаточно явно
- принятия или отклонения deferred architectural decisions
- принятия или отклонения architecture review decision

## Gate Review Checklist

- [ ] Components имеют явные responsibilities и non-responsibilities.
- [ ] Cross-component interactions видимы.
- [ ] Data ownership явно определен.
- [ ] Integration и trust boundaries явно определены.
- [ ] Structural decisions покрывают ключевые non-functional requirements.
- [ ] Risks, trade-offs и unresolved gaps явно зафиксированы.
- [ ] Архитектура не привязана к одному обязательному stack или vendor.
- [ ] Human reviewer утвердил решение о выходе с этапа.

## Failure Modes

### Failure Mode: component-by-guessing

Симптом: компоненты названы и разделены без ясной связи с logical behavior и ownership.

Митигирующее действие: требовать traceability от logical flows, states и entities к component responsibilities.

### Failure Mode: hidden ownership

Симптом: несколько компонентов выглядят так, будто владеют одними и теми же данными или business decisions.

Митигирующее действие: требовать явное mapping data и decision ownership.

### Failure Mode: NFR afterthought

Симптом: архитектура выглядит clean с функциональной точки зрения, но не показывает, как она address'ит performance, security, reliability или observability.

Митигирующее действие: требовать explicit structural alignment с non-functional requirements.

### Failure Mode: premature technology lock-in

Симптом: методология фактически hardcode'ит один framework, cloud или infrastructure style как обязательный.

Митигирующее действие: фиксировать architectural intent и constraints без stack dependence.

## Шаблон deliverable

```md
# Architecture Design

## Overview

## Components and Responsibilities

## Interfaces and Interactions

## Data Ownership and Storage

## Integration Boundaries

## Architectural Decisions

## Risks and Gaps

## Review Decision
```

## Правило завершения

Этап 4 считается завершенным только тогда, когда автор спецификации может на его основе собрать coherent system design document и supporting technical artifacts, не придумывая недостающие структуры, ownership или boundary decisions.
