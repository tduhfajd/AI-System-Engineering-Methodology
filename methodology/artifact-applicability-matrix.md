# Матрица применимости артефактов

Матрица определяет минимально достаточный пакет. Она не отменяет трассировку, явные assumptions и gate-решения.

| Тип проекта | Обязательный минимум | Добавлять при наличии условия |
|---|---|---|
| Небольшой веб-сервис | PDD, FS, NFR baseline, UX/User Flows, Acceptance Criteria, Execution Plan | API и Data Model — если есть backend; SDD — если больше одного компонента или интеграции |
| Backend/API или интеграция | PDD, FS, NFR, API Specification, Data Model, Business Rules, Acceptance Criteria, Execution Plan | Use Case Model — при нескольких ролях; SDD — при нескольких системах или асинхронных процессах |
| AI-система | PDD, FS, NFR, Data Model, UX/User Flows, Acceptance Criteria, Test Strategy | Модель данных, evaluation criteria, human oversight и risk register — если AI влияет на решения пользователя |
| Сложный B2B или регулируемый продукт | Полный BA+engineering пакет | Glossary signoff, change log, Data Dictionary и formal UAT — если есть внешний заказчик, аудит или регуляторные обязательства |

## Правило выбора

1. На Stage 1 зафиксируй тип проекта и выбранный минимальный пакет в `RUN.md`.
2. Каждый артефакт сверх минимума должен иметь причину: сложность ролей, интеграция, данные, риск, контракт или регулирование.
3. Отсутствие условно применимого артефакта — допустимое решение, если оно явно отражено в scope и validation.
