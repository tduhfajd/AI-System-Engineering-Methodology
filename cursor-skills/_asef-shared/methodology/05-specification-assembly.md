# Этап 5: Сборка спецификаций

## Цель

Собрать валидированные выходы предыдущих этапов в полный, внутренне согласованный и implementation-ready пакет документации, который можно передать delivery-команде без необходимости заново восстанавливать product intent, behavior, architecture или constraints.

## Зачем нужен этот этап

Даже если problem definition, requirements, system modeling и architecture individually sound, команды все равно проваливаются, если финальный пакет артефактов оказывается фрагментированным, противоречивым или неполным. Этот этап превращает staged outputs в реальный комплект документов, который требует техническое задание.

## Входы

- `Problem Statement`
- `Actor Map`
- `Stakeholder Map`
- `Goals and Non-Goals`
- `Success Metrics`
- `Business Context and Scope`
- `Glossary`
- `Functional Requirements Set`
- `Business Rules Register`
- `Use Case Inventory / Use Case Model`
- `Acceptance Criteria Seed`
- `Non-Functional Requirements Baseline`
- `Data Requirements`
- `Integration Requirements`
- `System Flow Model`
- `State Transition Model`
- `Domain Entity Model`
- `Decision and Rule Model`
- `Exception and Edge Case Model`
- `Architecture Overview`
- `Component Responsibility Map`
- `Interface and Interaction Model`
- `Data Ownership and Storage Model`
- `Integration Boundary Model`
- `Architectural Decision Register`
- assumptions, gaps и review decisions всех предыдущих этапов

## Критерии входа

- результаты Этапов 0-4 существуют и имеют статус approved или approved with explicit gaps
- unresolved gaps из предыдущих этапов достаточно ограничены, чтобы быть явно перенесенными в final documents
- architecture и набор требований достаточно стабильны, чтобы собрать пакет без ongoing structural redesign

## Критерии выхода

- полный целевой пакет документов существует
- у каждого документа есть четкий scope и он не противоречит другим документам
- traceability от документов к prior-stage outputs сохранена
- open gaps, assumptions и deferred decisions явно видимы в пакете
- BA-layer artifacts либо включены явно, либо встроены в конечные документы без потери смысла
- пакет достаточно конкретен для execution planning и final readiness validation

## Основные выходы

1. `Product Definition Document (PDD)`
2. `Functional Specification (FS)`
3. `System Design Document (SDD)`
4. `Non-Functional Requirements (NFR)`
5. `API Specification`
6. `Data Model`
7. `UX / User Flows`
8. `Business Rules Catalog`
9. `Use Case Model`
10. `Domain Model`
11. `Data Dictionary`
12. `Acceptance Criteria Catalog`
13. `User Stories`, если required
14. `Specification Consistency and Traceability Register`
15. `Specification Assembly Review Decision`

## Каноническая модель выхода

### 1. Product Definition Document (PDD)

PDD должен консолидировать:

- problem statement
- target actors и stakeholders
- goals и non-goals
- user value
- success metrics
- product scope boundaries

Роль PDD — сохранять стратегический и user-facing intent.

### 2. Functional Specification (FS)

FS должен консолидировать:

- функциональные требования
- business rules
- behavior по сценариям
- exception conditions, materially affecting function
- requirement traceability references

Роль FS — определять, что система должна делать.

### 3. System Design Document (SDD)

SDD должен консолидировать:

- summary logical system model
- architecture overview
- component responsibilities
- interactions и boundaries
- key design decisions

Роль SDD — описывать, как solution structurally organized.

### 4. Non-Functional Requirements (NFR)

Документ NFR должен консолидировать:

- performance expectations
- security expectations
- scalability expectations
- reliability и availability expectations
- observability expectations
- maintainability expectations
- compliance или operational quality expectations

Его роль — делать quality obligations явными и reviewable.

### 5. API Specification

API Specification должна описывать, где это применимо:

- exposed interfaces
- operation definitions
- payload или message contracts
- validation rules
- error behaviors
- versioning или compatibility expectations, если это релевантно

Если у системы нет meaningful API surface, это должно быть явно зафиксировано.

### 6. Data Model

Data Model должна консолидировать:

- сущности
- атрибуты
- relationships
- lifecycle notes
- ключевые constraints
- ownership или authority boundaries, важные для интерпретации данных

Ее роль — сделать information structure явной без потери traceability к предыдущим этапам.

### 7. UX / User Flows

Артефакт UX / User Flows должен консолидировать:

- основные actor journeys
- alternate paths
- failure-visible paths
- ожидания к interface logic на уровне flows
- handoff между user actions и system responses

Его роль — сделать user interaction logic понятной design и implementation teams.

### 8. Business Rules Catalog

Должен консолидировать:

- правила eligibility
- правила переходов состояний
- расчетные правила
- ограничения и запреты
- policy-level exception logic

### 9. Use Case Model

Должен консолидировать:

- ключевые actor-driven сценарии
- preconditions
- main flows
- alternative flows
- exception flows
- postconditions

### 10. Domain Model

Должен консолидировать:

- доменные сущности
- logical attributes
- relationships
- cardinality
- lifecycle notes

### 11. Data Dictionary

Должен консолидировать:

- перечень сущностей и полей
- обязательность полей
- бизнес-смысл полей
- допустимые значения и ограничения
- происхождение и downstream usage, если это критично

### 12. Acceptance Criteria Catalog

Должен консолидировать:

- приемочные критерии по use cases и high-impact requirements
- expected outcomes
- negative cases
- boundaries of acceptable behavior

### 13. User Stories

Если story layer required, он должен:

- сохранять traceability к use cases и требованиям
- помогать planning, а не подменять BA-layer

### 14. Specification Consistency and Traceability Register

Этот реестр должен фиксировать:

- document-to-document dependencies
- cross-document assumptions
- unresolved conflicts
- traceability links назад к earlier stages
- coverage gaps

Он нужен, чтобы final package не превратился в набор disconnected files.

### 15. Specification Assembly Review Decision

Этап должен завершаться одним из статусов:

- `Approved`
- `Approved with explicit gaps`
- `Blocked`

## Поток сборки

### Шаг 1. Отобразить prior-stage outputs в target documents

Нужно определить, какие validated outputs feed'ят какие final artifacts. Нельзя просто blindly duplicate content: каждое утверждение должно попасть в правильный документ, а в остальных местах на него следует ссылаться.

### Шаг 2. Собрать стратегические и BA-документы

Нужно собрать:

- PDD
- FS
- Business Rules Catalog
- Use Case Model
- Acceptance Criteria Catalog
- User Stories, если они required

### Шаг 3. Собрать технические и data/BA design documents

Нужно собрать:

- SDD
- API Specification
- Data Model
- Domain Model
- Data Dictionary

### Шаг 4. Собрать quality и interaction documents

Нужно собрать NFR и UX / User Flows из quality, flow, exception и actor artifacts.

### Шаг 5. Проверить междокументную согласованность

Нужно убедиться, что:

- терминология согласована
- glossary не расходится с use cases, data model и architecture
- scope boundaries совпадают
- requirement statements не конфликтуют с design statements
- API и data structures не противоречат architecture или flow logic
- UX flows не требуют undefined system behavior

### Шаг 6. Явно перенести gaps дальше

Любые unresolved issues из earlier stages должны появиться в final package с impact и status, а не исчезнуть во время document assembly.

### Шаг 7. Собрать traceability и coverage view

Нужно собрать consistency and traceability register, показывающий, что все major concerns из earlier stages представлены в final package.

### Шаг 8. Выпустить specification assembly review decision

Нужно определить, является ли assembled package:

- ready for execution planning
- ready with controlled gaps
- blocked pending clarification

## Роль AI

AI может:

- map'ить outputs предыдущих этапов на target document set
- готовить первую consolidated version каждого документа
- искать cross-document inconsistencies, duplication и terminology drift
- собирать traceability и consistency register
- выявлять missing sections и weak coverage

AI не должен:

- молча выкидывать unresolved issues из earlier stages
- придумывать детали, чтобы документы выглядели более complete, чем это позволяет source basis
- override'ить ранее approved decisions ради более гладкого текста
- утверждать stage exit от лица человека

## Роль человека

Human review обязателен для:

- утверждения финального scope и содержания каждого assembled document
- подтверждения, что cross-document contradictions либо устранены, либо явно приняты
- валидации того, что пакет sufficient for downstream planning
- принятия или отклонения specification assembly review decision

## Gate Review Checklist

- [ ] Все обязательные target documents существуют.
- [ ] У каждого документа есть четкий scope и purpose.
- [ ] Cross-document terminology согласована.
- [ ] Functional, architectural, data, API и UX views не противоречат друг другу.
- [ ] BA-layer artifacts собраны или явно встроены без потери содержания.
- [ ] Business rules, use cases, domain model и acceptance criteria сохраняют traceability к upstream stages.
- [ ] Open assumptions и gaps видимы, а не скрыты.
- [ ] Для high-impact content сохранена traceability к previous stages.
- [ ] Пакет пригоден для planning без существенной переинтерпретации.
- [ ] Human reviewer утвердил решение о выходе с этапа.

## Failure Modes

### Failure Mode: document fragmentation

Симптом: все обязательные документы существуют, но сильно overlap'ятся, противоречат друг другу или оставляют gaps между собой.

Митигирующее действие: требовать explicit document ownership, consistency checks и traceability register.

### Failure Mode: assembly by copy-paste

Симптом: content предыдущих этапов просто копируется в final artifacts без отбора и структурирования, из-за чего документы раздуваются и расходятся.

Митигирующее действие: осмысленно map'ить outputs на document purposes и использовать references там, где повторение не приносит пользы.

### Failure Mode: hidden carry-over gaps

Симптом: unresolved assumptions или conflicts исчезают из final package, создавая ложную уверенность delivery team.

Митигирующее действие: требовать явный carry-forward of gaps и deferred decisions.

### Failure Mode: BA collapse during assembly

Симптом: бизнес-правила, use cases, domain analysis и acceptance criteria растворяются внутри инженерных документов и теряют проверяемость.

Митигирующее действие: требовать явные BA artifacts или их явно прослеживаемое встраивание в final package.

### Failure Mode: package without usability

Симптом: документы формально есть, но delivery teams все равно должны сами достраивать intent, structure или missing detail.

Митигирующее действие: review'ить пакет не только на completeness, но и на execution readiness.

## Шаблон deliverable

```md
# Specification Assembly

## PDD

## FS

## SDD

## NFR

## API Specification

## Data Model

## UX / User Flows

## Consistency and Traceability Register

## Review Decision
```

## Правило завершения

Этап 5 считается завершенным только тогда, когда planning или delivery team может использовать assembled package как authoritative source product, functional, structural, quality, interface и interaction intent, не занимаясь предварительным reconciliation contradictions.
