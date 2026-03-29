# Подробное Техническое Задание

## Проект

Система skills для исполнения методологии `AI System Engineering Methodology`

## 1. Цель разработки

Создать набор AI skills, которые реализуют методологию из этого репозитория как исполнимый workflow.

Итоговая система должна позволять:

- принимать вход в виде идеи, сырого текста, частичного ТЗ или готовой спецификации
- последовательно проводить материал через этапы методологии
- формировать стандартизированные артефакты
- управлять handoff между этапами через формальные контракты
- использовать human-in-the-loop там, где это обязательно
- выдавать финальное решение о готовности пакета к реализации

## 2. Область применения

Система skills должна быть пригодна для:

- веб-приложений
- backend/API систем
- AI-систем
- интеграционных решений
- внутренних продуктовых систем

Система не должна:

- зависеть от одного технологического стека
- зависеть от одного типа команды
- зависеть от одного домена продукта

## 3. Основа для разработки

Система skills должна опираться на уже существующие артефакты репозитория:

- [methodology](../methodology)
- [templates](../templates)
- [automation](../automation)

Особенно обязательно использовать:

- stage definitions
- canonical templates
- stage automation contracts
- scoring and confidence model

## 4. Ключевой результат

Ключевой результат этой разработки:

не просто “набор skill-файлов”, а исполнимая skill-система, которая проводит пользователя от входного описания до готового пакета проектной документации по правилам методологии.

## 5. Функциональные требования

### 5.1 Общая структура системы skills

Система должна содержать:

1. `orchestrator skill`
2. `stage skills` для этапов 0-7
3. `artifact assembly skill` или equivalent layer для сборки итоговых документов
4. `validation skill`
5. `scoring skill` или scoring-enabled validation layer
6. вспомогательные skills для шаблонов, traceability и review

### 5.2 Обязательные skills

Минимальный обязательный набор:

- `methodology-orchestrator`
- `stage-00-normalization`
- `stage-01-problem-formalization`
- `stage-02-requirements-extraction`
- `stage-03-system-modeling`
- `stage-04-architecture-design`
- `stage-05-specification-assembly`
- `stage-06-planning`
- `stage-07-validation`
- `artifact-template-loader`
- `traceability-checker`
- `scoring-evaluator`

### 5.3 Orchestrator skill

Orchestrator обязан:

- определять текущую точку процесса
- определять допустимый следующий этап
- загружать правильный stage skill
- передавать stage packet
- не допускать пропуска gate-логики
- останавливать поток при `blocked`
- переводить поток в `human review required`, если это требует контракт

### 5.4 Stage skills

Каждый stage skill обязан:

- работать строго в рамках одного этапа
- принимать standardized stage input
- возвращать standardized stage output
- не менять смысл upstream артефактов без явного указания
- возвращать gate decision
- формировать handoff packet для следующего этапа

### 5.5 Работа с шаблонами

Skills, создающие финальные артефакты, обязаны:

- использовать шаблоны из `templates/`
- не удалять обязательные разделы без явной маркировки “неприменимо”
- сохранять согласованную структуру документов между разными запусками

### 5.6 Работа с automation contracts

Каждый skill обязан соблюдать:

- required input contract
- required output contract
- gate decision format
- правила handoff
- human review rules

### 5.7 Работа со scoring model

Validation layer обязан:

- применять scoring model из `automation/scoring-confidence-model.md`
- возвращать axis scores
- возвращать total score
- возвращать confidence
- применять blocking override rule

## 6. Логическая архитектура skill-системы

### 6.1 Основная схема

```text
Input
  -> Orchestrator
    -> Stage 0 skill
    -> Stage 1 skill
    -> Stage 2 skill
    -> Stage 3 skill
    -> Stage 4 skill
    -> Stage 5 skill
    -> Stage 6 skill
    -> Stage 7 skill
  -> Final readiness result
```

### 6.2 Логические слои

Система должна быть разделена на слои:

- orchestration layer
- stage execution layer
- artifact generation layer
- validation/scoring layer
- human review layer

### 6.3 State model

Система должна поддерживать как минимум следующие состояния workflow:

- `initialized`
- `stage_running`
- `awaiting_human_review`
- `approved_with_gaps`
- `blocked`
- `completed`

## 7. Требования к структуре skill-файлов

### 7.1 Для каждого skill должно быть определено

- название
- цель
- scope
- входы
- выходы
- ограничения
- quality checks
- human review conditions
- when-to-stop rules

### 7.2 Минимальная файловая структура

Рекомендуемая структура:

```text
skills/
  methodology-orchestrator/
    SKILL.md
  stage-00-normalization/
    SKILL.md
  stage-01-problem-formalization/
    SKILL.md
  stage-02-requirements-extraction/
    SKILL.md
  stage-03-system-modeling/
    SKILL.md
  stage-04-architecture-design/
    SKILL.md
  stage-05-specification-assembly/
    SKILL.md
  stage-06-planning/
    SKILL.md
  stage-07-validation/
    SKILL.md
  artifact-template-loader/
    SKILL.md
  traceability-checker/
    SKILL.md
  scoring-evaluator/
    SKILL.md
```

### 7.3 Допустимые расширения

Дополнительно может появиться:

- `references/`
- `assets/`
- `schemas/`
- `examples/`
- `scripts/`, если это действительно необходимо

## 8. Контракт входов и выходов

### 8.1 Вход в skill

Каждый stage skill должен принимать как минимум:

- текущий `stage_id`
- входные артефакты этапа
- prior decisions
- open assumptions
- open gaps
- blocking issues
- execution constraints

### 8.2 Выход из skill

Каждый stage skill должен возвращать:

- список созданных артефактов
- список обновленных артефактов
- assumptions created
- gaps identified
- blocking issues
- quality checks result
- gate decision
- next stage input

### 8.3 Формат handoff

Handoff между skills должен использовать единый `Stage Packet`, совместимый с:

- `automation/stage-automation-contracts.md`

## 9. Human-in-the-loop требования

### 9.1 Где human review обязателен

Минимально обязательные human checkpoints:

- после нормализации
- после формализации проблемы
- после извлечения требований
- после архитектурного проектирования
- после сборки спецификаций
- после финальной валидации

### 9.2 Поведение skills при human review

Если human review обязателен, skill обязан:

- не переходить автоматически к следующему этапу
- явно вернуть `human_signoff_required`
- показать, какие решения ждут подтверждения

## 10. Нефункциональные требования

### 10.1 Повторяемость

Один и тот же вход должен приводить к сопоставимому выходу по структуре и ключевым решениям.

### 10.2 Проверяемость

Каждый skill должен возвращать не только результат, но и объяснимые quality checks.

### 10.3 Изоляция этапов

Stage skill не должен silently делать работу следующего этапа.

### 10.4 Расширяемость

Система должна позволять:

- добавлять доменные варианты skills
- добавлять specialized review skills
- добавлять отраслевые profiles

### 10.5 Стек-независимость

Skill-система не должна быть завязана на конкретный язык программирования, фреймворк или вендора.

## 11. Требования к качеству результата

Результат работы skill-системы должен:

- быть трассируемым
- быть воспроизводимым
- быть пригодным для передачи в реализацию
- не скрывать gaps
- не подменять human decisions

## 12. Acceptance criteria

Система считается принятой, если:

1. Все обязательные skills существуют.
2. Каждый stage skill работает в пределах своего этапа.
3. Orchestrator корректно проводит workflow через этапы 0-7.
4. Templates реально используются при генерации артефактов.
5. Automation contracts соблюдаются.
6. Validation использует scoring model.
7. Human review в mandatory points не обходится автоматически.
8. На одном демонстрационном входе система выдает полный пакет артефактов и readiness decision.

## 13. Ожидаемые артефакты разработки

В результате реализации должны появиться:

- директория skills
- `SKILL.md` для каждого обязательного skill
- при необходимости схемы stage packet / scoring packet
- пример запуска на одном test input
- документ с mapping: `методология -> skill -> артефакты -> gate`

## 14. Этапы реализации

### Этап A. Skill architecture

- определить skill inventory
- определить структуру директорий
- определить роль orchestrator

### Этап B. Core stage skills

- реализовать stage-00 ... stage-07
- реализовать artifact-template-loader

### Этап C. Validation and scoring

- реализовать scoring-evaluator
- встроить scoring в validation flow

### Этап D. Workflow hardening

- реализовать traceability-checker
- проверить handoff contracts
- проверить blocking/human review rules

### Этап E. Demonstration

- прогнать один демонстрационный сценарий end-to-end
- зафиксировать gaps и refinement points

## 15. Риски реализации

- слишком широкие skills, которые смешивают несколько этапов
- отсутствие жесткого handoff contract
- скрытый auto-advance через mandatory human review
- несогласованность output structure между skills
- формальное использование scoring без реального влияния на gate decision

## 16. Не входит в текущее ТЗ

- реализация конкретного UI
- интеграция с конкретным SaaS
- привязка к одному LLM provider
- разработка полноценной runtime platform для orchestration

## 17. Итоговое решение, которое должно дать это ТЗ

После выполнения этого ТЗ команда должна получить не абстрактную “идею skill-системы”, а конкретную, формализованную и проверяемую основу для разработки skills, которые исполняют методологию как рабочий процесс.
