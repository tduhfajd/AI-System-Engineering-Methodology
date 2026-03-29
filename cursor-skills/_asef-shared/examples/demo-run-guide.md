# Demo Run Guide

Этот документ задает минимальный сценарий end-to-end проверки skill-системы.

## Цель

Проверить, что набор skills может пройти по всей методологии от raw input до readiness decision без нарушения handoff contracts.

## Вход

- [demo-input.md](demo-input.md)
- [stage-packet-examples.md](stage-packet-examples.md)
- [negative-path-examples.md](negative-path-examples.md)
- [demo-runtime-transcript.md](demo-runtime-transcript.md)

## Ожидаемый маршрут

1. `methodology-orchestrator`
2. `stage-00-normalization`
3. human checkpoint
4. `stage-01-problem-formalization`
5. human checkpoint
6. `stage-02-requirements-extraction`
7. human checkpoint
8. `stage-03-system-modeling`
9. `stage-04-architecture-design`
10. human checkpoint
11. `stage-05-specification-assembly`
12. human checkpoint
13. `stage-06-planning`
14. `stage-07-validation`
15. human checkpoint

## Что должно быть подтверждено

- на каждом этапе создаются expected artifacts
- handoff packet содержит достаточно данных для следующего skill
- mandatory human review не обходится автоматически
- scoring model реально участвует в final validation
- final output включает readiness decision

## Критерий успешного demo-run

Demo-run считается успешным, если:

1. маршрут проходит через все обязательные этапы
2. нет silent handoff failures
3. финальный пакет артефактов собирается
4. validation возвращает structured readiness result

## Что дополнительно должно быть проверено

- хотя бы один `blocked` сценарий реально останавливает маршрут
- runtime transcript не нарушает handoff rules orchestrator
- `human_signoff_required = true` всегда останавливает auto-advance
