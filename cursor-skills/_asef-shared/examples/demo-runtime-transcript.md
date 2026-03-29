# Demo Runtime Transcript

Этот документ показывает sample transcript, в котором `methodology-orchestrator`, stage skills и human checkpoints образуют последовательный runtime-style exchange.

## 1. Session Start

### Input

- [demo-input.md](demo-input.md)

### Orchestrator Output

```text
current_stage: stage-00
allowed_next_stage: stage-00
gate_status: pending
human_signoff_required: false
review_scope: []
```

## 2. Stage 0 Execution

### Orchestrator -> `stage-00-normalization`

```text
Run normalization on the raw brief. Return normalized brief, assumptions, contradictions, open questions, confidence summary, quality checks, and gate decision.
```

### `stage-00-normalization` -> Orchestrator

```text
artifacts_produced:
- Normalized Brief
- Assumption Log
- Contradiction Log
- Open Questions Register
- Input Confidence Summary

gate_decision:
- status: approved_with_gaps
- allowed_next_stage: stage-01
- human_signoff_required: true

open_questions:
- auto-reply policy
- analytics scope
- CRM sync policy
```

### Orchestrator Decision

```text
auto-advance denied
reason: mandatory human review after stage-00
review_scope:
- confirm baseline scope
- confirm unresolved extensions remain outside baseline
```

## 3. Human Checkpoint After Stage 0

### Human Response

```text
Baseline scope is limited to message intake, classification, and ticket routing.
CRM sync is optional for the first release.
Analytics is outside baseline scope.
```

### Orchestrator State Update

```text
current_stage: stage-00 approved by human
allowed_next_stage: stage-01
gate_status: approved_with_gaps
```

## 4. Stage 1 Execution

### Orchestrator -> `stage-01-problem-formalization`

```text
Use the normalized brief and human decisions to formalize the problem. Return actors, goals, non-goals, metrics, constraints, risks, quality checks, and gate decision.
```

### `stage-01-problem-formalization` -> Orchestrator

```text
problem_statement:
- support teams lose speed and quality because inbound requests are processed manually across disconnected channels

actor_map:
- primary: support operator
- secondary: customer

gate_decision:
- status: approved_with_gaps
- allowed_next_stage: stage-02
- human_signoff_required: true
```

### Human Checkpoint

```text
Primary actor confirmed.
Numeric targets remain open but directional metrics are acceptable for now.
```

## 5. Stage 2 Execution

### Orchestrator -> `stage-02-requirements-extraction`

```text
Derive testable functional, non-functional, data, and integration requirements from the approved problem model.
```

### `stage-02-requirements-extraction` -> Orchestrator

```text
functional_requirements:
- ingest messages from Telegram, email, and website
- preserve context
- classify requests
- create or update a structured ticket

integration_requirements:
- CRM sync is conditional, not baseline-critical

gate_decision:
- status: approved
- allowed_next_stage: stage-03
- human_signoff_required: false
```

## 6. Stage 3 Execution

### Orchestrator -> `stage-03-system-modeling`

```text
Model flows, states, entities, decisions, and edge cases from the requirements baseline.
```

### `stage-03-system-modeling` -> Orchestrator

```text
system_flow_model:
- receive message
- normalize payload
- identify customer
- classify request
- create or update ticket
- route to operator

gate_decision:
- status: approved
- allowed_next_stage: stage-04
- human_signoff_required: false
```

## 7. Stage 4 Execution

### Orchestrator -> `stage-04-architecture-design`

```text
Translate the system model into components, interfaces, ownership boundaries, and integration boundaries.
```

### `stage-04-architecture-design` -> Orchestrator

```text
architecture_overview:
- channel ingestion
- normalization layer
- classification layer
- ticket management core
- operator workspace boundary
- future integration boundary

gate_decision:
- status: approved_with_gaps
- allowed_next_stage: stage-05
- human_signoff_required: true
```

### Human Checkpoint

```text
The baseline architecture is approved if CRM remains an extension point and not a core dependency.
```

## 8. Stage 5 Execution

### Orchestrator -> `stage-05-specification-assembly`

```text
Assemble the final document package from stages 0-4.
```

### `stage-05-specification-assembly` -> Orchestrator

```text
artifacts:
- PDD
- FS
- SDD
- NFR
- API Specification
- Data Model
- UX/User Flows

gate_decision:
- status: approved
- allowed_next_stage: stage-06
- human_signoff_required: false
```

## 9. Stage 6 Execution

### Orchestrator -> `stage-06-planning`

```text
Create execution plan, work breakdown, dependencies, milestones, and planning risks.
```

### `stage-06-planning` -> Orchestrator

```text
execution_plan:
- workstreams defined
- milestones defined
- planning risks captured

gate_decision:
- status: approved
- allowed_next_stage: stage-07
- human_signoff_required: false
```

## 10. Stage 7 Execution

### Orchestrator -> `stage-07-validation`

```text
Validate completeness, consistency, executability, residual risk, and readiness using the scoring model.
```

### `stage-07-validation` -> Orchestrator

```text
readiness_decision:
- ready_with_explicit_constraints

scoring_summary:
- completeness: 4
- consistency: 4
- traceability: 4
- testability: 3
- executability: 4
- risk_exposure: 3
- decision_clarity: 4

gate_decision:
- status: approved_with_gaps
- allowed_next_stage: implementation_handoff
- human_signoff_required: true
```

### Final Human Checkpoint

```text
Residual risks are accepted for baseline implementation.
Do not include CRM sync, analytics, or auto-reply in the first implementation wave.
```

## 11. Final Orchestrator Output

```text
workflow_status: completed_with_constraints
current_stage: stage-07
allowed_next_stage: implementation_handoff
gate_status: approved_with_gaps
human_signoff_required: false
implementation_scope:
- multi-channel intake
- normalization
- context preservation
- ticket creation and update
- operator workflow support
```

## 12. What This Transcript Proves

- orchestrator не обходит mandatory human checkpoints
- `approved_with_gaps` не ломает маршрут, если gaps явно зафиксированы
- stage handoff происходит через явные artifacts и gate decision
- final readiness decision ограничивает implementation scope, а не размывает его
