# Stage Automation Contracts

## 1. Цель

Этот документ определяет формальные контракты между этапами методологии, чтобы их можно было исполнять как:

- AI skills
- агентные пайплайны
- полуавтоматические workflow с human-in-the-loop

## 2. Общая модель исполнения этапа

Каждый этап рассматривается как функция:

`StageInput -> StageProcess -> StageOutput + GateDecision`

## 3. Единый контракт этапа

### 3.1 Обязательные поля входа

Каждый этап должен принимать объект со следующими логическими полями:

- `stage_id`
- `stage_name`
- `source_context`
- `required_inputs`
- `optional_inputs`
- `prior_decisions`
- `open_assumptions`
- `open_gaps`
- `blocking_issues`
- `execution_constraints`
- `human_review_requirements`

### 3.2 Обязательные поля выхода

Каждый этап должен возвращать:

- `stage_id`
- `stage_name`
- `artifacts_produced`
- `artifacts_updated`
- `assumptions_created`
- `gaps_identified`
- `blocking_issues`
- `traceability_links`
- `quality_checks`
- `human_decisions_required`
- `gate_decision`
- `next_stage_input`

### 3.3 Формат gate-решения

`gate_decision` обязан иметь одно из значений:

- `approved`
- `approved_with_gaps`
- `blocked`

И должен сопровождаться:

- `decision_reason`
- `blocking_conditions`
- `allowed_next_stage`
- `human_signoff_required`

## 4. Единый формат артефактного пакета

Чтобы handoff между этапами был унифицирован, каждый этап должен формировать `Stage Packet` со следующей структурой:

### 4.1 Metadata

- `project_id`
- `run_id`
- `stage_id`
- `stage_version`
- `timestamp`
- `author_type` (`ai`, `human`, `hybrid`)

### 4.2 Inputs Snapshot

- какие входные артефакты использовались
- версии или идентификаторы входных артефактов
- какие входы были обязательными
- каких входов не хватало

### 4.3 Output Artifacts

- список созданных артефактов
- список обновленных артефактов
- краткое описание смысла каждого артефакта

### 4.4 Review State

- что уже одобрено человеком
- что требует человеческого решения
- что допустимо продолжать без human approval

### 4.5 Risk State

- открытые допущения
- открытые gaps
- blocking issues
- residual risks

### 4.6 Traceability State

- ссылки на upstream артефакты
- ссылки на downstream обязательства
- coverage gaps

## 5. Общие правила handoff

### Правило 1. Никаких неявных входов

Следующий этап может использовать только:

- явно переданные артефакты
- явно переданные решения
- явно переданные допущения и gaps

### Правило 2. Никакого молчаливого закрытия gaps

Если проблема была открыта на одном этапе, следующий этап обязан:

- либо перенести ее дальше
- либо явно закрыть с указанием причины
- либо перевести в blocking issue

### Правило 3. Никакого скрытого повышения статуса

AI не может:

- превращать assumption в факт
- превращать gap в resolved без обоснования
- переводить `blocked` в `approved` без человеческого решения

### Правило 4. Каждый этап обязан вернуть next-stage contract

Даже если этап завершен с `blocked`, он должен явно вернуть:

- какой следующий шаг допустим
- что именно блокирует продолжение
- какие входы должны быть исправлены

## 6. Контракты по этапам

### Stage 0 -> Stage 1

#### Required Input

- исходный продуктовый input любого из 4 допустимых типов

#### Required Output

- normalized brief
- assumption log
- contradiction log
- open questions register
- input confidence summary

#### Gate Rule

Stage 1 разрешен только если:

- вход структурирован
- факты отделены от inference
- contradictions не скрыты

### Stage 1 -> Stage 2

#### Required Input

- normalized brief
- assumption log
- contradiction log
- open questions register

#### Required Output

- problem statement
- actor map
- goals and non-goals
- success metrics
- constraint register
- risk framing

#### Gate Rule

Stage 2 разрешен только если:

- проблема сформулирована как проблема, а не как feature wishlist
- акторы и границы определены
- success logic хотя бы частично определена

### Stage 2 -> Stage 3

#### Required Input

- problem formalization package

#### Required Output

- functional requirements
- business rules
- NFR baseline
- data requirements
- integration requirements
- traceability matrix

#### Gate Rule

Stage 3 разрешен только если:

- high-impact requirements testable
- non-functional expectations видимы
- gaps явно классифицированы

### Stage 3 -> Stage 4

#### Required Input

- approved requirements package

#### Required Output

- system flow model
- state transition model
- domain entity model
- decision and rule model
- exception and edge case model

#### Gate Rule

Stage 4 разрешен только если:

- логика системы описана без архитектурных догадок
- есть flows, states, entities, edge cases

### Stage 4 -> Stage 5

#### Required Input

- approved logical system model

#### Required Output

- architecture overview
- component responsibility map
- interface and interaction model
- data ownership and storage model
- integration boundary model
- architectural decision register

#### Gate Rule

Stage 5 разрешен только если:

- ownership и boundaries прозрачны
- архитектурные решения покрывают ключевые NFR

### Stage 5 -> Stage 6

#### Required Input

- approved architecture and prior-stage artifacts

#### Required Output

- PDD
- FS
- SDD
- NFR
- API Specification
- Data Model
- UX / User Flows
- consistency and traceability register

#### Gate Rule

Stage 6 разрешен только если:

- целевой пакет документов собран
- документы не противоречат друг другу

### Stage 6 -> Stage 7

#### Required Input

- final specification package

#### Required Output

- execution plan
- work breakdown structure
- dependency map
- milestone and phase plan
- validation and review checkpoint plan
- delivery risks and assumptions register

#### Gate Rule

Stage 7 разрешен только если:

- план исполним
- зависимости и checkpoints явны

### Stage 7 -> Implementation Handoff

#### Required Input

- specification package
- planning package
- prior stage review decisions

#### Required Output

- validation report
- readiness decision
- defect and gap register
- residual risk register
- implementation handoff recommendation

#### Gate Rule

Implementation handoff разрешен только если:

- readiness decision не `not ready`
- blocking defects либо закрыты, либо явно запрещают start конкретных workstreams

## 7. Human-in-the-loop contract

Для каждого этапа должен существовать блок `Human Review Required`, где явно перечислено:

- какие решения AI не может принять сам
- какие вопросы требуют signoff
- какие вопросы допускают продолжение с пометкой `approved_with_gaps`

Минимально обязательные human checkpoints:

- после Stage 0
- после Stage 1
- после Stage 2
- после Stage 4
- после Stage 5
- после Stage 7

## 8. Contract for agent implementation

Если этап реализуется как skill или агент, он должен соблюдать следующие operational rules:

- не изменять upstream artifacts без явного указания
- не пропускать gate-решение
- не возвращать “готово” без списка produced artifacts
- не скрывать отсутствующие входы
- не продолжать downstream stage автоматически при `blocked`

## 9. Минимальный JSON-подобный логический формат

Ниже логическая схема, не жесткая сериализация:

```json
{
  "stage_id": "stage-2",
  "stage_name": "Requirements Extraction",
  "required_inputs": [],
  "artifacts_produced": [],
  "assumptions_created": [],
  "gaps_identified": [],
  "blocking_issues": [],
  "traceability_links": [],
  "quality_checks": [],
  "human_decisions_required": [],
  "gate_decision": {
    "status": "approved_with_gaps",
    "decision_reason": "",
    "blocking_conditions": [],
    "allowed_next_stage": "stage-3",
    "human_signoff_required": true
  },
  "next_stage_input": {}
}
```

## 10. Критерий завершения automation layer

Automation contracts считаются достаточными, если:

1. Для каждого этапа определены required input и required output.
2. Формат gate-решения одинаков для всех этапов.
3. Есть единый stage packet contract.
4. Есть явные правила handoff и human review.
5. На основе этих контрактов можно реализовать skill или agent workflow без неявной интерпретации.
