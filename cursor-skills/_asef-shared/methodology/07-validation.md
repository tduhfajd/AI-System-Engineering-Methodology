# Этап 7: Валидация

## Цель

Определить, действительно ли assembled documentation package готов к реализации, проверяя его по явным критериям completeness, consistency, traceability, executability и residual risk.

## Зачем нужен этот этап

Методология, которая только генерирует документы, остается незавершенной. Ее финальная обязанность — определить, достаточно ли этих документов для реальной delivery-работы. Без validation stage команды путают объем документации с готовностью и входят в реализацию со скрытой неоднозначностью, противоречиями или пропущенными решениями.

## Входы

- `Product Definition Document (PDD)`
- `Functional Specification (FS)`
- `System Design Document (SDD)`
- `Non-Functional Requirements (NFR)`
- `API Specification`
- `Data Model`
- `UX / User Flows`
- `Specification Consistency and Traceability Register`
- `Execution Plan`
- `Work Breakdown Structure`
- `Dependency Map`
- `Milestone and Phase Plan`
- `Validation and Review Checkpoint Plan`
- `Delivery Risks and Assumptions Register`
- все review decisions, assumptions и gap registers из previous stages

## Критерии входа

- результаты Этапов 0-6 существуют и имеют статус approved или approved with explicit gaps
- assembled полный пакет specification и planning artifacts
- unresolved gaps описаны достаточно явно, чтобы их можно было оценивать, а не находить заново в процессе validation

## Критерии выхода

- полнота относительно целевого artifact set оценена
- внутренняя consistency между документами оценена
- implementation readiness оценена
- residual risks и open gaps оценены
- существует formal readiness decision
- implementation handoff recommendation сформулирована явно

## Основные выходы

1. `Validation Report`
2. `Readiness Decision`
3. `Defect and Gap Register`
4. `Residual Risk Register`
5. `Implementation Handoff Recommendation`
6. `Validation Criteria Record`

## Каноническая модель выхода

### 1. Validation Report

Validation report должен суммировать:

- что именно проверялось
- какие критерии применялись
- что прошло проверку
- что не прошло
- что остается conditional

Его роль — давать auditable evidence готовности.

### 2. Readiness Decision

Readiness decision должен завершаться одним из статусов:

- `Ready for implementation`
- `Ready with explicit constraints`
- `Not ready`

Решение должно быть привязано к explicit criteria, а не к общей “уверенности”.

### 3. Defect and Gap Register

Нужно фиксировать:

- отсутствующую информацию
- contradictory information
- under-specified areas
- unusable или untestable statements
- broken traceability links

Для каждого пункта нужно определить:

- severity
- affected artifacts
- блокирует ли это implementation

### 4. Residual Risk Register

Нужно фиксировать риски, которые остаются даже при принятии пакета, например:

- risk ambiguity of scope
- delivery risk
- architecture risk
- integration risk
- risk недостаточного validation coverage

Residual risks нельзя путать с unresolved defects.

### 5. Implementation Handoff Recommendation

Рекомендация должна отвечать:

- можно ли начинать implementation
- какие constraints или cautions действуют
- какие issues нужно monitor'ить в первую очередь
- что должно быть resolved до старта specific workstreams

### 6. Validation Criteria Record

Нужно явно зафиксировать, по каким критериям оценивалась готовность, например:

- artifact completeness
- cross-document consistency
- requirement-to-design traceability
- adequacy planning package
- visibility non-functional concerns
- testability ключевых flows
- отсутствие blocking ambiguity

Это защищает validation от субъективности.

## Поток валидации

### Шаг 1. Проверить artifact completeness

Нужно убедиться, что все обязательные output artifacts существуют и содержат содержательный материал, а не placeholders.

### Шаг 2. Проверить cross-document consistency

Нужно проверить, что:

- терминология едина
- scope boundaries совпадают
- requirements согласованы с architecture и flows
- API и data definitions не противоречат design
- planning artifacts соответствуют final specification set

### Шаг 3. Проверить execution sufficiency

Нужно ответить на вопрос: может ли delivery team начать implementation по пакету без существенных циклов дополнительных уточнений.

### Шаг 4. Проверить traceability и coverage

Нужно убедиться, что high-impact source concerns, goals, requirements и decisions сохраняются до финальных документов и плана.

### Шаг 5. Проверить severity gaps и residual risks

Нужно различить:

- acceptable residual risk
- non-blocking gaps
- blocking defects

### Шаг 6. Принять readiness decision

Нужно сформулировать решение о готовности явно и связать его с validation criteria record.

### Шаг 7. Подготовить handoff recommendation

Нужно зафиксировать, можно ли начинать implementation и при каких условиях.

## Роль AI

AI может:

- выполнять consistency, coverage и traceability checks по full package
- обнаруживать likely contradictions, omissions и weak readiness areas
- собирать черновик validation report и gap register
- предлагать readiness classification на основе explicit criteria

AI не должен:

- утверждать readiness без human acceptance
- занижать severity blocking ambiguity ради позитивного решения
- придумывать evidence для criteria, которые фактически не удовлетворены
- заменять human judgment в вопросах risk acceptance и handoff authorization

## Роль человека

Human review обязателен для:

- подтверждения severity validation findings
- решения, какие residual risks допустимы
- принятия или отклонения readiness decision
- разрешения или запрета implementation handoff

## Gate Review Checklist

- [ ] Все обязательные артефакты присутствуют и содержательны.
- [ ] Cross-document consistency проверена.
- [ ] Blocking gaps и contradictions явно выделены.
- [ ] Residual risks явно отделены от defects.
- [ ] Ready/not ready оценивается по явным критериям.
- [ ] Handoff recommendation сформулирована явно.
- [ ] Human reviewer утвердил финальное readiness decision.

## Failure Modes

### Failure Mode: document-count validation

Симптом: пакет признается готовым только потому, что все файлы существуют, хотя между ними остаются contradictions или structural weakness.

Митигирующее действие: валидировать не по presence files, а по criteria consistency, sufficiency и traceability.

### Failure Mode: optimism bias

Симптом: validation findings artificially смягчаются, чтобы implementation можно было начать несмотря на blocking ambiguity.

Митигирующее действие: требовать explicit severity и blocking status для gaps и defects.

### Failure Mode: risk-defect confusion

Симптом: unresolved defects маскируются под acceptable residual risk.

Митигирующее действие: разделять defect register и residual risk register и forcing blocking assessment.

### Failure Mode: handoff without conditions

Симптом: пакет признается ready, но delivery team не получает явных указаний, что нужно monitor'ить и что должно быть resolved early.

Митигирующее действие: требовать implementation handoff recommendation с conditions и cautions.

## Шаблон deliverable

```md
# Validation

## Validation Report

## Validation Criteria Record

## Defects and Gaps

## Residual Risks

## Readiness Decision

## Handoff Recommendation
```

## Правило завершения

Этап 7 считается завершенным только тогда, когда human reviewer может защитить readiness decision, указывая на explicit criteria, concrete evidence, known gaps и accepted residual risks, а не на общее ощущение “документов достаточно”.
