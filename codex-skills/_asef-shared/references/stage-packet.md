# Stage Packet Schema

Единый логический пакет передачи состояния между stage skills.

## Обязательные поля

- `project_id`
- `run_id`
- `stage_id`
- `stage_name`
- `stage_version`
- `timestamp`
- `author_type`
- `inputs_snapshot`
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

## Правила

- stage packet не должен содержать неявные входы
- unresolved gaps нельзя silently удалять
- blocking issues должны переноситься downstream или явно закрываться
- `next_stage_input` должен быть пригоден к прямой передаче следующему stage skill

## Логическая форма

```json
{
  "project_id": "",
  "run_id": "",
  "stage_id": "stage-2",
  "stage_name": "Requirements Extraction",
  "stage_version": "1.0",
  "timestamp": "",
  "author_type": "ai",
  "inputs_snapshot": {},
  "artifacts_produced": [],
  "artifacts_updated": [],
  "assumptions_created": [],
  "gaps_identified": [],
  "blocking_issues": [],
  "traceability_links": [],
  "quality_checks": [],
  "human_decisions_required": [],
  "gate_decision": {},
  "next_stage_input": {}
}
```
