# Negative Path Examples

Этот документ фиксирует негативные сценарии handoff для skill-системы. Его задача показать, когда orchestrator обязан остановить workflow, вернуть `blocked` и не продолжать auto-advance.

## 1. Stage 0 Blocked: Неразрешимое противоречие во входе

### Problem Snapshot

- в одной части входа сказано, что система должна только маршрутизировать заявки
- в другой части входа сказано, что первая версия обязана заменить CRM целиком
- human decision по scope отсутствует

### Example `quality_checks`

```json
[
  {
    "check_id": "s0-neg-qc-01",
    "check_name": "contradiction resolution",
    "status": "failed",
    "evidence": "The input simultaneously limits the first release to routing only and requires a full CRM replacement.",
    "blocking": true
  },
  {
    "check_id": "s0-neg-qc-02",
    "check_name": "scope boundary clarity",
    "status": "failed",
    "evidence": "The release boundary cannot be normalized without a human decision.",
    "blocking": true
  }
]
```

### Example `gate_decision`

```json
{
  "status": "blocked",
  "decision_reason": "The source input contains a direct scope contradiction that prevents reliable normalization.",
  "blocking_conditions": [
    "Human must decide whether the first release is intake-routing only or full CRM replacement."
  ],
  "allowed_next_stage": "human_review",
  "human_signoff_required": true
}
```

### Expected Orchestrator Action

- остановить маршрут на `stage-00`
- передать человеку contradiction summary
- не запускать `stage-01`

## 2. Stage 2 Blocked: Отсутствует решение по обязательной интеграции

### Problem Snapshot

- Stage 1 определил, что ключевая бизнес-цель невозможна без CRM sync
- source stakeholders одновременно требуют offline-first baseline без внешних зависимостей
- без решения по интеграционной политике нельзя сформировать тестируемые требования

### Example `quality_checks`

```json
[
  {
    "check_id": "s2-neg-qc-01",
    "check_name": "requirement testability",
    "status": "failed",
    "evidence": "Core functional requirements depend on an unresolved decision about mandatory CRM synchronization.",
    "blocking": true
  },
  {
    "check_id": "s2-neg-qc-02",
    "check_name": "integration requirement closure",
    "status": "failed",
    "evidence": "The same capability is described as both mandatory and prohibited in the initial release.",
    "blocking": true
  }
]
```

### Example `gate_decision`

```json
{
  "status": "blocked",
  "decision_reason": "The requirements baseline cannot be made coherent until the CRM dependency policy is explicitly resolved.",
  "blocking_conditions": [
    "Human must decide whether CRM sync is baseline-critical, optional, or deferred."
  ],
  "allowed_next_stage": "human_review",
  "human_signoff_required": true
}
```

### Expected Orchestrator Action

- перевести workflow в human review
- вернуть unresolved requirement conflict
- не запускать `stage-03`

## 3. Stage 4 Blocked: Архитектурное решение нарушает обязательный constraint

### Problem Snapshot

- NFR требует изоляции внешних каналов от core workflow
- предложенная архитектура делает ticket core напрямую зависимым от внешнего CRM
- failure isolation и ownership нарушены

### Example `quality_checks`

```json
[
  {
    "check_id": "s4-neg-qc-01",
    "check_name": "trust boundary compliance",
    "status": "failed",
    "evidence": "The proposed architecture allows an external CRM dependency inside the core ticket lifecycle boundary.",
    "blocking": true
  },
  {
    "check_id": "s4-neg-qc-02",
    "check_name": "failure isolation",
    "status": "failed",
    "evidence": "External integration failures can directly break the baseline ticket workflow.",
    "blocking": true
  }
]
```

### Example `gate_decision`

```json
{
  "status": "blocked",
  "decision_reason": "The architecture violates a mandatory boundary and cannot advance to specification assembly.",
  "blocking_conditions": [
    "Rework the architecture so the baseline ticket workflow remains independent from CRM availability."
  ],
  "allowed_next_stage": "stage-04",
  "human_signoff_required": true
}
```

### Expected Orchestrator Action

- оставить workflow на `stage-04`
- запросить architecture revision
- не запускать `stage-05`

## 4. Minimal Negative-Path Rule

Если `quality_checks` содержит хотя бы одну запись с:

- `status = failed`
- `blocking = true`

то stage не может вернуть `approved` или `approved_with_gaps`, а orchestrator не может выполнить downstream handoff без явного human resolution.
