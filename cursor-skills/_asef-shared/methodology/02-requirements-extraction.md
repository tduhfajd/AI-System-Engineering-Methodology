# Этап 2: Извлечение требований

## Цель

Преобразовать формализованную проблему в структурированный, тестируемый и трассируемый набор требований, который определяет, что будущая система должна делать, каким ограничениям должна соответствовать и какие условия обязаны оставаться явными для дальнейшего моделирования и проектирования.

## Зачем нужен этот этап

Формализация проблемы объясняет, зачем нужен продукт, но еще не задает operational obligations будущей системы. Без дисциплинированного этапа извлечения требований команды часто прыгают от goals прямо к architecture, минуя contract требований, который должен ограничивать downstream design и implementation.

## Входы

- `Problem Statement`
- `Actor Map`
- `Goals and Non-Goals`
- `Success Metrics`
- `Constraint Register`
- `Risk Framing`
- `Problem Review Decision`

## Критерии входа

- результаты Этапа 1 существуют и имеют статус approved или approved with explicit gaps
- non-goals и scope boundaries явно заданы и могут ограничивать извлечение требований
- blocking contradictions из предыдущих этапов разрешены или явно приняты как bounded risk

## Критерии выхода

- функциональные требования сформулированы как testable statements
- нефункциональные требования явно заданы и классифицированы
- бизнес-правила явно перечислены
- требования к данным явно перечислены
- интеграционные требования явно перечислены там, где они релевантны
- существует requirement-to-source traceability
- конфликты требований, assumptions и unresolved gaps явно зафиксированы
- набор требований достаточно конкретен для перехода к логическому моделированию системы

## Основные выходы

1. `Functional Requirements Set`
2. `Business Rules Register`
3. `Non-Functional Requirements Baseline`
4. `Data Requirements`
5. `Integration Requirements`
6. `Requirement Traceability Matrix`
7. `Requirement Gaps and Conflicts Register`
8. `Requirements Review Decision`

## Каноническая модель выхода

### 1. Functional Requirements Set

Для каждого функционального требования должно быть определено:

- уникальный идентификатор
- формулировка требования
- актор или условие-триггер
- ожидаемое поведение системы
- наблюдаемый результат
- ссылка на источник или rationale

Хорошие функциональные требования:

- testable
- atomic
- unambiguous
- ограничивают solution только там, где это действительно необходимо

### 2. Business Rules Register

Нужно явно вынести доменную и policy-логику, которая должна соблюдаться независимо от интерфейса или implementation details, например:

- правила eligibility
- sequencing rules
- validation logic
- approval conditions
- расчетную логику
- exception handling rules

Business rules не должны быть спрятаны внутри feature descriptions.

### 3. Non-Functional Requirements Baseline

Нужно зафиксировать ожидания по:

- производительности
- безопасности
- масштабируемости
- надежности
- доступности
- наблюдаемости
- usability
- поддерживаемости
- compliance

Каждое NFR должно включать либо:

- measurable threshold
- directional expectation с пометкой unresolved measurement

### 4. Data Requirements

Нужно зафиксировать:

- обязательные сущности или записи
- ключевые атрибуты
- ожидания по жизненному циклу
- ограничения по хранению или удалению, если известны
- ownership или authority constraints, если известны
- правила качества данных

Этот этап задает obligations для данных, а не финальную физическую data model.

### 5. Integration Requirements

Нужно зафиксировать:

- внешние системы
- inbound и outbound dependencies
- ожидания к обмену данными
- timing или synchronization constraints
- ожидания по failure handling

Если интеграции пока только предполагаются, это должно быть явно помечено.

### 6. Requirement Traceability Matrix

Каждое требование должно трассироваться хотя бы к одному из элементов:

- source-backed normalized input
- formalized problem statement
- actor need
- goal
- metric
- explicit constraint
- accepted assumption

Ни одно high-impact requirement не должно существовать без traceability.

### 7. Requirement Gaps and Conflicts Register

Нужно фиксировать:

- conflicting requirements
- under-specified requirements
- untestable statements
- open assumptions
- deferred decisions

Для каждого пункта должно быть отмечено, блокирует ли он system modeling.

### 8. Requirements Review Decision

Этап должен завершаться одним из статусов:

- `Approved`
- `Approved with explicit gaps`
- `Blocked`

## Поток извлечения требований

### Шаг 1. Собрать candidate requirements

Требования нужно извлекать из:

- actor needs
- goals
- constraints
- success metrics
- business rules, implied by the problem

### Шаг 2. Разделить типы требований

Каждый candidate requirement нужно классифицировать как один или несколько типов:

- functional
- non-functional
- data
- integration
- business rule

Это не позволяет quality expectations и policy logic раствориться внутри feature lists.

### Шаг 3. Переписать в testable statements

Неопределенные формулировки вроде:

- “fast”
- “convenient”
- “secure”
- “easy to use”

нужно преобразовать в testable или хотя бы reviewable statements с более четким operational meaning.

### Шаг 4. Удалить дубли и опасные overlaps

Дублирующиеся требования можно объединять, но нельзя склеивать разные actors, conditions или outcomes в одно широкое утверждение, если это ухудшает testability.

### Шаг 5. Проверить consistency с границами

Нужно убедиться, что требования не нарушают:

- non-goals
- known constraints
- approved scope boundaries
- решения предыдущих этапов

### Шаг 6. Найти отсутствующие зоны требований

Нужно проверить, покрывает ли набор требований:

- основные actor journeys
- error и exception behavior
- quality expectations
- obligations по обработке данных
- integrations
- operational concerns

### Шаг 7. Построить traceability

Для каждого требования нужно показать, является ли оно:

- source-driven
- goal-driven
- constraint-driven
- assumption-driven

### Шаг 8. Выпустить requirements review decision

Нужно решить, является ли набор требований:

- ready for system modeling
- ready with controlled gaps
- blocked pending clarification

## Роль AI

AI может:

- извлекать candidate requirements из problem artifacts
- классифицировать типы требований
- переписывать vague statements в более testable form
- находить overlaps, contradictions и missing areas
- собирать начальную traceability matrix

AI не должен:

- придумывать обязательные требования без traceable basis
- скрывать неопределенность через избыточную детализацию unresolved areas
- разрешать requirement conflicts с бизнес-влиянием без human approval
- утверждать stage exit от лица человека

## Роль человека

Human review обязателен для:

- утверждения, какие candidate requirements действительно входят в scope
- валидации business rules и non-functional expectations
- решения, допустимы ли unresolved gaps для перехода на следующий этап
- принятия или отклонения requirements review decision

## Gate Review Checklist

- [ ] Functional requirements атомарны и testable.
- [ ] Business rules явно выделены и не смешаны с feature descriptions.
- [ ] Non-functional requirements видимы, а не implied.
- [ ] Data requirements описаны на уровне obligations.
- [ ] Integration requirements определены или явно помечены как отсутствующие.
- [ ] Требования не противоречат non-goals и ограничениям предыдущих этапов.
- [ ] Для high-impact requirements существует traceability.
- [ ] Gaps и conflicts явно зафиксированы.
- [ ] Human reviewer утвердил решение о выходе с этапа.

## Failure Modes

### Failure Mode: feature dumping

Симптом: требования выглядят как длинный wishlist features без behavioral precision и traceability.

Митигирующее действие: требовать типизированные требования, atomic statements и traceability links.

### Failure Mode: hidden NFRs

Симптом: performance, security, reliability или usability expectations остаются implicit до architecture или testing.

Митигирующее действие: требовать отдельную NFR baseline уже на этапе extraction.

### Failure Mode: untestable language

Симптом: требования сформулированы красивым, но непроверяемым языком.

Митигирующее действие: переводить их в observable behavior или явно маркировать measurement gaps.

### Failure Mode: scope leakage

Симптом: extracted requirements включают привлекательные возможности, нарушающие stated non-goals или boundaries.

Митигирующее действие: проводить explicit boundary consistency check перед stage approval.

## Шаблон deliverable

```md
# Requirements Extraction

## Functional Requirements

## Business Rules

## Non-Functional Requirements

## Data Requirements

## Integration Requirements

## Traceability Matrix

## Gaps and Conflicts

## Review Decision
```

## Правило завершения

Этап 2 считается завершенным только тогда, когда downstream system modeler может по этим выходам вывести поведение системы, состояния, сущности и взаимодействия без того, чтобы заново догадываться, что на самом деле означали требования.
