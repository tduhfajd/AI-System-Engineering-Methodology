---
name: traceability-checker
description: Use when checking whether artifacts, requirements, design decisions, and planning outputs remain traceable from input through methodology stages to final validation.
---

# Traceability Checker

## Обязательные источники

- `../../automation/stage-automation-contracts.md`
- `../../methodology/ba-layer-model.md`
- `../../methodology/02-requirements-extraction.md`
- `../../methodology/05-specification-assembly.md`
- `../../methodology/07-validation.md`
- `../_shared/references/stage-packet.md`

## Используй skill, когда нужно

- проверить traceability между stages
- выявить artifacts or decisions that appeared without basis
- подтвердить coverage high-impact requirements
- проверить BA-to-engineering traceability
- проверить, что use cases, business rules и domain model не теряются downstream

## Сделай

1. Проследи цепочку `input -> problem -> requirements -> model -> architecture -> specifications -> plan -> validation`.
2. Проследи BA-цепочку `stakeholders/glossary -> business rules/use cases -> domain/data model -> acceptance criteria -> delivery/validation`.
3. Найди missing links, broken links и unjustified additions.
4. Отметь, что блокирует дальнейший stage или handoff.

## Обязательный выход

- traceability findings
- BA traceability findings
- coverage gaps
- broken links
- blocking status

## Границы

- Не делай content generation вместо traceability analysis.
