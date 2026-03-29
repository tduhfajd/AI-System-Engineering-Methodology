# Codex Skills Bundle

Этот каталог содержит portable bundle skills для установки в `~/.codex/skills`.

## Что внутри

- stage skills `stage-00` - `stage-07`
- `methodology-orchestrator`
- supporting skills:
  - `artifact-template-loader`
  - `traceability-checker`
  - `scoring-evaluator`
  - `stakeholder-glossary-builder`
  - `use-case-modeler`
  - `business-rules-extractor`
  - `domain-data-modeler`
  - `acceptance-criteria-builder`
- общий reference layer в `_asef-shared`

## Как установить

1. Скопируй содержимое этого каталога в `~/.codex/skills`.
2. Убедись, что вместе со skills скопирована папка `_asef-shared`.
3. После копирования skills можно вызывать как обычные local Codex skills.

## Ограничение

Этот bundle автономен на уровне skill references, но не содержит runtime automation или внешних интеграций. Он предназначен для использования как knowledge/workflow layer.
