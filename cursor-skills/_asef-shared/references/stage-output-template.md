# Stage Output Template

Каждый stage skill должен стараться возвращать результат в следующей логике:

## 1. Produced Artifacts

- какие артефакты созданы
- какие обновлены

## 2. Assumptions

- какие assumptions появились
- какие assumptions были закрыты

## 3. Gaps and Blocking Issues

- какие gaps остались
- какие blocking issues выявлены

## 4. Quality Checks

- список `quality_checks`

## 5. Human Review State

- требуется ли human signoff
- какие решения нужны от человека

## 6. Gate Decision

- status
- reason
- allowed next stage

## 7. Next Stage Input

- минимальный handoff packet для downstream stage
