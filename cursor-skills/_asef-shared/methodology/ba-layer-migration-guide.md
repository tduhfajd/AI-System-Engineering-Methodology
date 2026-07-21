# BA Layer Migration Guide

## Назначение

Этот документ объясняет, как использовать расширенную версию методологии с полноценным BA-слоем в коммерческой и контрактной работе.

## 1. Что изменилось

Ранее методология была сильнее в engineering-first части:

- problem framing
- requirements
- system modeling
- architecture
- planning
- validation

Теперь в нее встроен полноценный BA-layer:

- stakeholder map
- glossary
- business rules catalog
- use case model
- domain model
- data dictionary
- acceptance criteria catalog
- user stories, когда они действительно нужны

Это изменение нужно рассматривать не как cosmetic add-on, а как перевод методологии из engineering-first baseline в production-grade BA+engineering framework.

## 2. Когда BA-layer обязателен

BA-layer следует считать обязательным, если:

- проект коммерческий
- проект контрактный
- результат передается внешнему заказчику
- в системе несколько ролей и сложные handoff
- данные и бизнес-правила materially affect architecture
- требуется formal acceptance / UAT / downstream delivery handoff

## 3. Минимальный коммерческий пакет

Для коммерческого handoff рекомендуется считать минимальным пакетом:

- PDD
- FS
- SDD
- NFR
- API Specification, если релевантно
- Data Model
- UX / User Flows
- Stakeholder Map
- Glossary
- Business Rules Catalog
- Use Case Model
- Domain Model
- Data Dictionary
- Acceptance Criteria Catalog
- Execution Plan
- Validation Report

Если проект идет по договору с внешним заказчиком, к минимальному пакету также желательно добавить:

- glossary signoff, если в предметной области много терминологической неоднозначности
- assumptions and exclusions list в явном виде
- change log требований, если пакет согласуется итеративно

## 4. Как выбирать между use cases и user stories

### Use Cases

Должны использоваться по умолчанию, если:

- система process-heavy
- есть несколько ролей
- есть exception flows
- важны handoff между участниками процесса

### User Stories

Нужны дополнительно, если:

- команда режет backlog в story form
- заказчик требует agile-style artifact
- delivery planning строится вокруг stories

Правило:

- use cases не заменяются user stories
- user stories могут появляться поверх use cases, но не вместо них

## 5. Как BA-layer влияет на архитектуру

BA-layer должен явно давать входы для архитектуры:

- stakeholder constraints влияют на scope и acceptance boundaries
- business rules влияют на state model и validation logic
- use cases влияют на key flows и interface behavior
- domain model и data dictionary влияют на data model, API и ownership
- acceptance criteria влияют на validation и implementation slicing

## 6. Как использовать BA-layer в delivery

### Для BA / Product

- problem framing
- scope confirmation
- business rules
- use cases
- acceptance criteria

### Для Architect / Lead Engineer

- domain model
- data dictionary
- business rules
- use case realization
- integration boundaries

### Для Delivery / PM

- user stories, если required
- execution plan
- traceability от use cases и acceptance criteria к tasks

### Для QA / UAT

- acceptance criteria catalog
- business rules catalog
- exception flows

### Для contract / presale / procurement review

- stakeholder map
- glossary
- business rules catalog
- use case model
- scope boundaries and exclusions

Именно эти артефакты чаще всего нужны, когда заказчик проверяет, действительно ли исполнитель понял предметную область, а не просто нарисовал архитектуру.

## 7. Migration strategy для существующих кейсов

Если проект уже прошел старую версию методологии, не нужно переписывать все с нуля.

Рекомендуемый retrofit:

1. Добавить `Stakeholder Map` и `Glossary` после существующего Stage 1.
2. Добавить `Business Rules Catalog`, `Use Case Model`, `Acceptance Criteria Seed` после существующего Stage 2.
3. Добавить `Domain Model` и `Data Dictionary` после существующего Stage 3.
4. На Stage 5 встроить BA-артефакты в финальный пакет.
5. На Stage 7 пересчитать readiness с учетом `BA sufficiency`.

Практическое правило migration:

- не пытаться сначала “идеально переписать” старые stage documents
- сначала добавить недостающие BA-артефакты отдельными документами
- затем обновить validation и handoff recommendation
- только после этого, если нужно, refactor существующие stage outputs

## 8. Что считать сигналом незрелости пакета

Пакет не стоит считать production-grade, если:

- есть требования, но нет use cases для ключевых сценариев
- есть архитектура, но нет domain model и data dictionary
- есть backlog, но нет business rules
- есть validation report, но нет acceptance criteria
- есть data model, но терминология в нем не согласована с glossary

Дополнительные сигналы незрелости для коммерческого использования:

- в документе есть actor list, но нет stakeholder responsibilities и decision owners
- use cases есть, но исключения и alternative flows не описаны
- domain model есть, но неясно, какие атрибуты реально нужно хранить
- data dictionary есть, но он не связан с business rules и acceptance criteria

## 9. Practical rule

Если заказчик может сказать:

- “покажите бизнес-правила”
- “покажите use cases”
- “покажите сущности и что вы по ним храните”
- “покажите критерии приемки”

и пакет не может на это ответить отдельными или явно встроенными артефактами, то BA-layer еще недостаточен.

## 10. Commercial Readiness Rule

Для коммерческого и контрактного применения пакет стоит считать достаточно зрелым, если одновременно выполняются четыре условия:

1. Scope, exclusions и stakeholder expectations зафиксированы отдельно от engineering design.
2. Business rules, use cases и acceptance criteria позволяют обсуждать поведение системы без обращения к коду или архитектурным диаграммам.
3. Domain model и data dictionary позволяют обсуждать структуру данных без обращения к схеме БД.
4. Validation прямо отвечает, где пакет готов, а где остаются принятые ограничения.

Если хотя бы одно из этих условий не выполнено, пакет еще рано считать полноценным внешним handoff deliverable.
