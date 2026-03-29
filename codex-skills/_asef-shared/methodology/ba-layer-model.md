# BA Layer Model

## Назначение

Этот документ задает целевую модель business analysis слоя внутри `AI System Engineering Methodology`.

Его задача:

- устранить перекос методологии только в engineering-first сторону
- зафиксировать полноценный BA-слой как обязательную часть коммерчески пригодного процесса
- определить, какие BA-артефакты являются обязательными, условно обязательными и опциональными
- встроить BA-слой в stage pipeline, automation и skill-систему

## 1. Базовый принцип

Методология должна быть пригодна для разных типов систем:

- внутренних операционных систем
- B2B/B2C продуктов
- AI-систем
- интеграционных платформ
- workflow и case-management систем
- data-intensive систем

Поэтому методология не должна исходить из того, что:

- `user stories` всегда нужны
- `user stories` не нужны
- `use cases` всегда достаточно
- `архитектура данных` автоматически покрывается только engineering-документами

Правильная позиция:

- методология обязана уметь производить полноценный BA-слой
- обязательность отдельных BA-артефактов определяется типом системы, уровнем риска, ожиданиями заказчика и контрактными требованиями

## 2. Цели BA-слоя

BA-слой нужен, чтобы:

- формализовать предметную область
- зафиксировать бизнес-контекст, акторов и заинтересованные стороны
- определить сущности, атрибуты, связи и жизненный цикл данных
- зафиксировать бизнес-правила и ограничения
- описать пользовательские и операционные сценарии
- задать приемочные критерии до начала реализации
- дать заказчику и delivery-команде согласованный слой между бизнесом и engineering

## 3. Категории BA-артефактов

### 3.1 Обязательные BA-артефакты

Эти артефакты должны поддерживаться методологией как обязательная capability и, как правило, должны появляться в большинстве коммерческих проектов:

- `Stakeholder Map`
- `Glossary`
- `Business Context and Scope`
- `Business Rules Catalog`
- `Use Case Model`
- `Domain Model`
- `Data Dictionary`
- `Acceptance Criteria Catalog`

### 3.2 Conditionally Required артефакты

Эти артефакты методология должна уметь производить, а обязательность определяется контекстом проекта:

- `User Stories`
- `User Journey`
- `Service Blueprint`
- `BPMN / Process Model`
- `Decision Table`
- `Report and Analytics Requirements`
- `Permission Matrix`

### 3.3 Optional артефакты

Эти артефакты полезны в отдельных доменах, но не должны считаться базовым требованием каждой системы:

- `Event Storming Output`
- `Capability Map`
- `Business Case`
- `RACI / Responsibility Map`
- `Regulatory Matrix`
- `Master Data Definition`

## 4. Канонические значения ключевых BA-артефактов

### `Stakeholder Map`

Описывает:

- кто влияет на scope
- кто принимает решения
- кто является пользователем
- кто является внешним участником процесса
- кто является downstream consumer результата

### `Glossary`

Описывает:

- единый словарь терминов
- недопустимые двусмысленности
- различия между похожими сущностями и статусами

### `Business Rules Catalog`

Описывает:

- явные бизнес-правила
- ограничения
- правила расчетов
- правила eligibility
- правила переходов состояний
- исключения и запреты

### `Use Case Model`

Описывает:

- actor-driven сценарии
- trigger
- preconditions
- main success flow
- alternative flows
- exception flows
- postconditions

### `Domain Model`

Описывает:

- доменные сущности
- атрибуты сущностей
- связи между сущностями
- cardinality
- жизненный цикл сущностей
- ownership данных на логическом уровне

### `Data Dictionary`

Описывает:

- что хранится по каждой сущности
- обязательность полей
- бизнес-смысл полей
- ограничения и допустимые значения
- происхождение и потребителей данных

### `Acceptance Criteria Catalog`

Описывает:

- условия приемки по use cases, требованиям и feature slices
- проверяемые expected outcomes
- negative cases
- границы допустимого поведения

### `User Stories`

Используются как backlog-ready форма представления требований, когда:

- проект delivery-driven
- требуется story-based planning
- заказчик или команда ожидают story decomposition
- нужна bridge-форма между BA и delivery management

## 5. Распределение BA-слоя по этапам методологии

### Этап 0. Нормализация

BA-output:

- `Stakeholder Hints`
- `Term Ambiguity Log`
- `Glossary Seed`
- `Business Context Seed`

### Этап 1. Формализация проблемы

BA-output:

- `Stakeholder Map`
- `Business Context and Scope`
- `Glossary`
- `Problem Framing`
- `Success Criteria Seed`

### Этап 2. Извлечение требований

BA-output:

- `Business Rules Catalog`
- `Use Case Inventory`
- `Acceptance Criteria Seed`
- `Initial Data Requirements`
- `Permission / Role Rules`, если релевантно
- `User Stories`, если проект требует story-oriented handoff

### Этап 3. Моделирование системы

BA-output:

- `Use Case Realization`
- `Domain Model`
- `Entity Lifecycle Model`
- `Decision Model`
- `Data Flow and State Logic`

### Этап 4. Архитектурное проектирование

BA-output, которые должны быть явно сохранены:

- `Logical Data Architecture`
- `Data Ownership Model`
- `Boundary Contracts`
- `Role-to-Capability Mapping`

### Этап 5. Сборка спецификаций

В финальный пакет должны войти или быть явно встроены:

- `Business Rules Catalog`
- `Use Case Model`
- `Domain Model`
- `Data Dictionary`
- `Acceptance Criteria Catalog`
- `User Stories`, если они required

### Этап 6. Планирование

BA-to-delivery bridge:

- story/task decomposition rules
- traceability от use cases и acceptance criteria к work packages

### Этап 7. Валидация

Проверяется:

- BA completeness
- BA-to-engineering consistency
- BA-to-delivery traceability
- достаточность data/domain analysis для реализации

## 6. Правила обязательности

### `Use Case Model`

Считается обязательным, если:

- система имеет больше одной роли
- есть сложные бизнес-сценарии или исключения
- есть cross-role handoff
- проект коммерческий или контрактный

### `Domain Model` и `Data Dictionary`

Считаются обязательными, если:

- система хранит бизнес-сущности
- есть lifecycle у данных
- система интегрируется с другими системами
- структура данных materially affects architecture

### `Acceptance Criteria Catalog`

Считается обязательным, если:

- предполагается реализация несколькими разработчиками
- нужен contractual handoff
- требуется QA / UAT / formal acceptance

### `User Stories`

Считаются conditionally required, если:

- backlog ведется в story form
- команда planning-driven
- заказчик ожидает привычный agile-format
- story format реально помогает delivery slicing

`User Stories` не должны подменять:

- use cases
- business rules
- domain model
- acceptance criteria

## 7. BA-слой и архитектура данных

Методология должна явно признавать, что business analysis влияет не только на функциональные требования, но и на архитектуру данных.

Обязательные вопросы BA-слоя по данным:

- какие сущности существуют в предметной области
- какие свойства важны для каждой сущности
- какие связи существуют между сущностями
- какие ограничения действуют на связи и поля
- какие состояния проходит каждая сущность
- какие события меняют состояние сущности
- кто создает, изменяет, читает и архивирует данные
- какие данные являются критичными для аудита и контроля

Результат этого анализа должен становиться входом для:

- `Data Model`
- `API Specification`
- `Architecture Design`
- `Execution Plan`

## 8. Обязательные проверки в validation

Validation должна явно проверять:

- нет ли критичных терминологических конфликтов
- все ли значимые бизнес-правила зафиксированы
- покрывают ли use cases ключевые сценарии и исключения
- достаточно ли domain model для downstream architecture and data design
- есть ли приемочные критерии для high-impact требований
- нет ли business concepts, появившихся в архитектуре без upstream basis

## 9. Изменения, которые должны последовать из этой модели

Эта модель требует следующих доработок репозитория:

- обновить `methodology/README.md`
- расширить стадии `01`, `02`, `03`, `05`, `07`
- добавить BA-шаблоны
- расширить automation contracts
- расширить scoring model
- обновить skill-систему и portable bundle

## 10. Definition of Done для BA-слоя

BA-слой считается встроенным в методологию, если:

1. Методология явно поддерживает обязательные и conditionally required BA-артефакты.
2. Stage pipeline показывает, где и как они появляются.
3. Шаблоны для BA-артефактов существуют и согласованы.
4. Automation contracts и validation умеют их проверять.
5. Skill-система умеет их производить и передавать downstream.
6. Методология пригодна и для внутренних систем, и для коммерческого/контрактного использования.
