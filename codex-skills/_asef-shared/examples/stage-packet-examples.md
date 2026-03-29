# Stage Packet Examples

Этот документ содержит stage-specific примеры `quality_checks`, `gate_decision` и `next_stage_input` для dry-run и runtime-style handoff между skills.

## 1. Stage 0 -> Stage 1

### Example `quality_checks`

```json
[
  {
    "check_id": "s0-qc-01",
    "check_name": "input decomposition completeness",
    "status": "passed",
    "evidence": "All major input topics were extracted: channels, current pain points, desired workflow, and unresolved extensions.",
    "blocking": false
  },
  {
    "check_id": "s0-qc-02",
    "check_name": "contradiction detection",
    "status": "passed",
    "evidence": "No explicit contradictions detected in the raw brief.",
    "blocking": false
  },
  {
    "check_id": "s0-qc-03",
    "check_name": "unknowns isolation",
    "status": "passed_with_gaps",
    "evidence": "Auto-reply, analytics, and CRM sync remain unresolved and were explicitly isolated as open questions.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved_with_gaps",
  "decision_reason": "The input is normalized enough for problem framing, but several downstream scope questions still require human confirmation.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-01",
  "human_signoff_required": true
}
```

### Example `next_stage_input`

```json
{
  "normalized_brief": {
    "product_goal": "Convert inbound customer messages from multiple channels into structured support tickets with preserved context.",
    "known_channels": ["telegram", "email", "website"],
    "current_pain_points": [
      "manual copy-paste",
      "lost message context",
      "duplicate requests",
      "slow handling"
    ]
  },
  "assumption_log": [
    "The primary target domain is small e-commerce support.",
    "The initial system scope focuses on intake and routing rather than full CRM replacement."
  ],
  "open_questions_register": [
    "Should the system send automatic replies?",
    "Is analytics part of the first release?",
    "Is CRM sync optional or mandatory?"
  ],
  "input_confidence_summary": {
    "confidence_level": "medium",
    "reason": "Core workflow is clear, but important scope boundaries are still open."
  }
}
```

## 2. Stage 1 -> Stage 2

### Example `quality_checks`

```json
[
  {
    "check_id": "s1-qc-01",
    "check_name": "problem-solution separation",
    "status": "passed",
    "evidence": "The problem is framed around operator inefficiency and context loss without locking in implementation details.",
    "blocking": false
  },
  {
    "check_id": "s1-qc-02",
    "check_name": "actor clarity",
    "status": "passed",
    "evidence": "Primary and secondary actors were identified and linked to the workflow.",
    "blocking": false
  },
  {
    "check_id": "s1-qc-03",
    "check_name": "metric specificity",
    "status": "passed_with_gaps",
    "evidence": "Success metrics are directionally defined, but numeric targets are still absent.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved_with_gaps",
  "decision_reason": "The problem is formally framed and can support requirements extraction, but target metrics still need human refinement.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-02",
  "human_signoff_required": true
}
```

### Example `next_stage_input`

```json
{
  "problem_statement": "Support teams in small e-commerce businesses lose time and quality when inbound requests from multiple channels are processed manually without a shared structured workflow.",
  "actor_map": {
    "primary_actor": "support operator",
    "secondary_actor": "customer",
    "economic_buyer": "business owner or support lead"
  },
  "goals_and_non_goals": {
    "goals": [
      "reduce manual handling effort",
      "preserve conversation context",
      "reduce duplicates"
    ],
    "non_goals": [
      "full CRM replacement",
      "full analytics platform"
    ]
  },
  "success_metrics": [
    "lower handling time",
    "lower duplicate rate",
    "lower context loss rate"
  ],
  "constraint_register": [
    "Must support multiple inbound channels.",
    "Open integration policy for CRM."
  ]
}
```

## 3. Stage 2 -> Stage 3

### Example `quality_checks`

```json
[
  {
    "check_id": "s2-qc-01",
    "check_name": "functional requirement coverage",
    "status": "passed",
    "evidence": "Core ingest, identification, classification, ticket creation, and context preservation requirements were captured.",
    "blocking": false
  },
  {
    "check_id": "s2-qc-02",
    "check_name": "traceability to source problem",
    "status": "passed",
    "evidence": "Each major requirement can be traced back to a specific pain point or goal from Stage 1.",
    "blocking": false
  },
  {
    "check_id": "s2-qc-03",
    "check_name": "integration requirement closure",
    "status": "passed_with_gaps",
    "evidence": "CRM integration requirements were captured as conditional because the business decision is still open.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved",
  "decision_reason": "The requirements baseline is strong enough to model system behavior and edge cases.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-03",
  "human_signoff_required": false
}
```

### Example `next_stage_input`

```json
{
  "functional_requirements": [
    "The system must ingest messages from Telegram, email, and website forms.",
    "The system must preserve conversation context for each request.",
    "The system must create or update a structured support ticket.",
    "The system should classify the request type."
  ],
  "business_rules_register": [
    "A duplicate inbound message must not create an independent new ticket without review.",
    "Unknown customers may still generate a ticket with incomplete identity data."
  ],
  "non_functional_requirements": [
    "The channel ingestion layer must tolerate temporary source failures.",
    "The design should support adding new channels later."
  ],
  "data_and_integration_requirements": {
    "core_entities": ["message", "customer", "conversation", "ticket"],
    "conditional_integrations": ["crm_sync"]
  }
}
```

## 4. Stage 3 -> Stage 4

### Example `quality_checks`

```json
[
  {
    "check_id": "s3-qc-01",
    "check_name": "flow completeness",
    "status": "passed",
    "evidence": "The model covers intake, classification, ticket creation or update, and operator continuation.",
    "blocking": false
  },
  {
    "check_id": "s3-qc-02",
    "check_name": "entity-state alignment",
    "status": "passed",
    "evidence": "Messages, conversations, customers, and tickets are consistently aligned with the state model.",
    "blocking": false
  },
  {
    "check_id": "s3-qc-03",
    "check_name": "exception handling coverage",
    "status": "passed_with_gaps",
    "evidence": "Duplicate messages, unknown customers, unavailable channels, and low-confidence classification are covered, but escalation rules are not yet fully specified.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved",
  "decision_reason": "The logical system behavior is sufficiently modeled to derive components, boundaries, and interfaces.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-04",
  "human_signoff_required": false
}
```

### Example `next_stage_input`

```json
{
  "system_flow_model": [
    "receive inbound message",
    "normalize source payload",
    "identify or create customer reference",
    "classify request",
    "create or update ticket",
    "route work to operator"
  ],
  "state_transition_model": {
    "ticket_states": ["new", "triaged", "in_progress", "resolved"],
    "classification_states": ["pending", "high_confidence", "low_confidence", "manual_review"]
  },
  "domain_entity_model": ["message", "customer", "conversation", "ticket", "channel_source"],
  "exception_model": [
    "duplicate message",
    "unknown customer",
    "channel unavailable",
    "low-confidence classification"
  ]
}
```

## 5. Stage 4 -> Stage 5

### Example `quality_checks`

```json
[
  {
    "check_id": "s4-qc-01",
    "check_name": "component responsibility clarity",
    "status": "passed",
    "evidence": "Ingestion, normalization, classification, ticket core, and integration boundary were separated by responsibility.",
    "blocking": false
  },
  {
    "check_id": "s4-qc-02",
    "check_name": "interface definition sufficiency",
    "status": "passed_with_gaps",
    "evidence": "Internal interfaces are described at a logical level, but exact external CRM contract details remain open.",
    "blocking": false
  },
  {
    "check_id": "s4-qc-03",
    "check_name": "trust boundary coverage",
    "status": "passed",
    "evidence": "External channel and future CRM boundaries are separated from the core workflow.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved_with_gaps",
  "decision_reason": "The architecture is stable enough to assemble the specification package, but some integration details remain intentionally deferred.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-05",
  "human_signoff_required": true
}
```

### Example `next_stage_input`

```json
{
  "architecture_overview": {
    "components": [
      "channel_ingestion",
      "message_normalization",
      "classification_enrichment",
      "ticket_management_core",
      "operator_workspace_boundary",
      "integration_extension_boundary"
    ]
  },
  "component_responsibility_map": [
    "channel_ingestion receives external payloads",
    "message_normalization converts payloads into a canonical message model",
    "classification_enrichment enriches and categorizes requests",
    "ticket_management_core owns ticket lifecycle"
  ],
  "interface_model": [
    "external channel -> ingestion",
    "ingestion -> normalization",
    "normalization -> classification",
    "classification -> ticket core"
  ],
  "data_ownership_model": {
    "ticket_management_core": ["ticket", "conversation_reference"],
    "message_normalization": ["canonical_message"],
    "classification_enrichment": ["classification_result"]
  }
}
```

## 6. Stage 5 -> Stage 6

### Example `quality_checks`

```json
[
  {
    "check_id": "s5-qc-01",
    "check_name": "artifact package completeness",
    "status": "passed",
    "evidence": "PDD, FS, SDD, NFR, API Specification, Data Model, and UX/User Flows were assembled.",
    "blocking": false
  },
  {
    "check_id": "s5-qc-02",
    "check_name": "cross-document consistency",
    "status": "passed_with_gaps",
    "evidence": "Documents are structurally consistent, but API sections referencing CRM are still conditional.",
    "blocking": false
  },
  {
    "check_id": "s5-qc-03",
    "check_name": "traceability preservation",
    "status": "passed",
    "evidence": "Requirements and architectural decisions remain traceable to earlier stages.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved",
  "decision_reason": "The documentation package is coherent enough to support execution planning.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-06",
  "human_signoff_required": false
}
```

### Example `next_stage_input`

```json
{
  "assembled_specification_package": [
    "PDD",
    "FS",
    "SDD",
    "NFR",
    "API Specification",
    "Data Model",
    "UX/User Flows"
  ],
  "consistency_register": [
    "CRM-related API sections are conditional.",
    "Analytics scope remains excluded from the baseline release."
  ],
  "execution_constraints": [
    "Keep initial release limited to intake and routing workflow.",
    "Do not assume CRM integration in milestone one."
  ]
}
```

## 7. Stage 6 -> Stage 7

### Example `quality_checks`

```json
[
  {
    "check_id": "s6-qc-01",
    "check_name": "work breakdown coverage",
    "status": "passed",
    "evidence": "The plan covers ingestion, normalization, classification, ticket handling, and operator workflow implementation.",
    "blocking": false
  },
  {
    "check_id": "s6-qc-02",
    "check_name": "dependency sequencing",
    "status": "passed",
    "evidence": "Dependencies between ingestion, canonical model, and ticket lifecycle are ordered logically.",
    "blocking": false
  },
  {
    "check_id": "s6-qc-03",
    "check_name": "risk-aware planning",
    "status": "passed_with_gaps",
    "evidence": "Integration uncertainty is reflected as a planning risk, but mitigation depends on a future business decision.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved",
  "decision_reason": "The execution plan is explicit enough to validate package readiness and residual risk.",
  "blocking_conditions": [],
  "allowed_next_stage": "stage-07",
  "human_signoff_required": false
}
```

### Example `next_stage_input`

```json
{
  "execution_plan": {
    "workstreams": [
      "channel ingestion",
      "canonical message pipeline",
      "classification workflow",
      "ticket lifecycle",
      "operator interface"
    ],
    "milestones": [
      "canonical ingestion baseline",
      "ticket creation baseline",
      "operator workflow integration"
    ]
  },
  "dependency_map": [
    "classification depends on normalized canonical messages",
    "ticket lifecycle depends on classification and entity linkage"
  ],
  "planning_risks": [
    "future CRM dependency can affect later milestones",
    "classification confidence rules may require additional policy decisions"
  ]
}
```

## 8. Stage 7 -> Implementation Handoff

### Example `quality_checks`

```json
[
  {
    "check_id": "s7-qc-01",
    "check_name": "documentation readiness",
    "status": "passed",
    "evidence": "The baseline package is complete enough for implementation of the core workflow.",
    "blocking": false
  },
  {
    "check_id": "s7-qc-02",
    "check_name": "residual risk visibility",
    "status": "passed",
    "evidence": "Open CRM, auto-reply, and metric-target questions remain explicitly visible in the residual risk register.",
    "blocking": false
  },
  {
    "check_id": "s7-qc-03",
    "check_name": "blocking override rule",
    "status": "passed_with_gaps",
    "evidence": "No hard blockers remain for the baseline workflow, but extension-related uncertainty prevents an unconditional ready status.",
    "blocking": false
  }
]
```

### Example `gate_decision`

```json
{
  "status": "approved_with_gaps",
  "decision_reason": "The package is ready for implementation of the baseline intake and routing workflow, with explicit constraints around unresolved extensions.",
  "blocking_conditions": [],
  "allowed_next_stage": "implementation_handoff",
  "human_signoff_required": true
}
```

### Example `next_stage_input`

```json
{
  "readiness_decision": "ready_with_explicit_constraints",
  "implementation_scope": [
    "multi-channel intake",
    "message normalization",
    "context preservation",
    "ticket creation and update",
    "operator workflow support"
  ],
  "explicit_constraints": [
    "Do not treat CRM sync as mandatory in the first implementation wave.",
    "Do not implement analytics as part of the baseline release.",
    "Treat auto-reply behavior as a future decision."
  ],
  "residual_risks": [
    "Future CRM contract may reshape integration design.",
    "Success metrics still need numeric thresholds."
  ]
}
```
