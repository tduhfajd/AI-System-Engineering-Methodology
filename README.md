<p align="center">
  <strong>Методология AI System Engineering</strong><br/>
  <sub>Идея → нормализованный вход → спецификации → план → валидация готовности к разработке</sub>
</p>

<p align="center">
  <a href="#stages-list"><img src="https://img.shields.io/badge/этапы-0%E2%80%937-0969da?style=flat-square" alt="Этапы 0–7"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/tduhfajd/AI-System-Engineering-Methodology?style=flat-square" alt="License"/></a>
  <a href="methodology/README.md"><img src="https://img.shields.io/badge/docs-methodology-238636?style=flat-square" alt="Документация"/></a>
  <a href="codex-skills/README.md"><img src="https://img.shields.io/badge/bundle-Codex-6f42c1?style=flat-square" alt="Codex"/></a>
  <a href="cursor-skills/README.md"><img src="https://img.shields.io/badge/bundle-Cursor-1f6feb?style=flat-square" alt="Cursor"/></a>
</p>

<p align="center">
  <sub><strong>Автор:</strong> Вадим Евграфов · <a href="https://t.me/vadim_evgrafov">Telegram @vadim_evgrafov</a> · <a href="mailto:vadim@evgrafov.biz">vadim@evgrafov.biz</a></sub>
</p>

---

Методология превращает идею, сырой текст, частичное или полное ТЗ в **согласованный, проверяемый пакет документации**, достаточный для разработки без бесконечных уточнений.

**Два режима использования**

| Режим | Описание |
|--------|----------|
| **Как база знаний** | Читать этапы, шаблоны и контракты вручную |
| **Как skill-система** | Те же этапы через **Codex** (`codex-skills`, префикс `$…`) или **Cursor** (`cursor-skills` → `.cursor/skills/` или `~/.cursor/skills/`) |

**Навигация:** [Состав проекта](#whats-inside) · [Быстрый старт](#quick-start) · [Маршрут этапов](#stage-pipeline) · [Как работает](#how-it-works) · [Артефакты](#artifacts-output) · [Skills](#skills-reference) · [Примеры](#request-examples) · [Структура репозитория](#repo-tree) · [Автор](#author)

<a id="stage-pipeline"></a>

### Маршрут этапов

```mermaid
flowchart LR
  S0([0 Нормализация]) --> S1([1 Проблема])
  S1 --> S2([2 Требования])
  S2 --> S3([3 Модель системы])
  S3 --> S4([4 Архитектура])
  S4 --> S5([5 Спецификации])
  S5 --> S6([6 Планирование])
  S6 --> S7([7 Валидация])
```

<a id="whats-inside"></a>

## Что входит в проект

- [methodology](methodology) — полное описание методологии по этапам: от нормализации входа до финальной валидации.
- [methodology/ba-layer-model.md](methodology/ba-layer-model.md) — целевая модель BA-слоя внутри методологии.
- [methodology/ba-layer-migration-guide.md](methodology/ba-layer-migration-guide.md) — как усиливать существующие кейсы и коммерческий handoff.
- [templates](templates) — канонические русскоязычные шаблоны итоговых артефактов.
- [automation](automation) — stage-to-stage контракты, scoring model и правила handoff для AI и human-in-the-loop.
- [technical-assignment-1.md](technical-assignment-1.md) — исходное ТЗ, на основе которого собрана методология.
- [skills-technical-assignment.md](skills-technical-assignment.md) — ТЗ на skill-систему поверх методологии.
- [skills](skills) — исходные skill-спецификации: orchestrator, этапы 0–7, BA и вспомогательные проверки.
- [codex-skills](codex-skills) — portable bundle для `~/.codex/skills` (включая `agents/openai.yaml` для Codex CLI).
- [cursor-skills](cursor-skills) — тот же набор и `_asef-shared`, адаптированный под Cursor (`SKILL.md` без `agents/`). Подробнее: [cursor-skills/README.md](cursor-skills/README.md).

<a id="quick-start"></a>

## Быстрый старт

### 1. Клонировать репозиторий (по желанию)

```bash
git clone git@github.com:tduhfajd/AI-System-Engineering-Methodology.git
cd AI-System-Engineering-Methodology
```

### 2. Установить skills

**Codex** — скопировать bundle:

```bash
cp -R ./codex-skills/* ~/.codex/skills/
```

**Cursor** — в проект (обязательно вместе с `_asef-shared`):

```bash
mkdir -p /path/to/your/project/.cursor/skills
cp -R ./cursor-skills/* /path/to/your/project/.cursor/skills/
```

Либо в `~/.cursor/skills/`, если skills нужны во всех проектах.

После установки рядом должны быть: `methodology-orchestrator`, `stage-00-normalization` … `stage-07-validation`, BA-skills и `_asef-shared`.

### 3. Подготовить вход

Подойдут идея в паре предложений, сырой текст, частичное или готовое ТЗ — обычно файл вроде `~/project/tz.md` или `./specification.md`.

### 4. Запустить orchestrator

В **Codex** skill часто вызывают с префиксом `$`:

```text
$methodology-orchestrator проанализируй ~/project/tz.md и начни прогон методологии с Stage 0. Складывай артефакты в ~/project/asef-run
```

В **Cursor** сформулируй тот же запрос естественным языком (например, «используй skill methodology-orchestrator …»): агент подберёт skill по `description` в `SKILL.md`.

Дальше можно кратко: «продолжай» или «перейди к следующему этапу». Orchestrator определяет этап, вызывает нужный stage skill, останавливается на human checkpoint и не обходит заблокированные gate.

<a id="how-it-works"></a>

## Как работает система

### Базовый принцип

Skills с инструкциями в `SKILL.md`. В **Codex** — вызов через `$`. В **Cursor** — skills из `.cursor/skills/` или `~/.cursor/skills/`; агент применяет skill по описанию, без обязательного `$`.

Пример для Codex:

```text
$stage-00-normalization нормализуй ~/project/tz.md и сохрани результат в ~/project/asef-run
```

Агент загружает skill и выполняет workflow из `SKILL.md`.

### Когда использовать `$methodology-orchestrator`

Основной вход для большинства сценариев: полный прогон от файла до validation, подсказка следующего этапа, работа с human checkpoints без запоминания имён stage skills.

```text
$methodology-orchestrator возьми ~/project/tz.md, начни с Stage 0 и веди по всем этапам. Результаты в ~/project/asef-run
```

### Когда вызывать stage skills напрямую

Если нужно переиграть один этап, уже есть stage packet с предыдущего шага или точечное усиление анализа:

```text
$stage-01-problem-formalization возьми ~/project/asef-run/00-stage-packet.json и собери Stage 1 в ~/project/asef-run
```

```text
$stage-02-requirements-extraction возьми ~/project/asef-run/01-stage-packet.json и извлеки требования, business rules, use cases и acceptance criteria seed
```

```text
$stage-07-validation проверь пакет в ~/project/asef-run и дай readiness decision
```

## Основной маршрут для новичка

### Вариант 1. Полный end-to-end прогон

1. Файл с идеей или ТЗ.
2. Папка для результатов, например `~/project/asef-run`.
3. Запуск orchestrator.
4. Ответы на checkpoint-вопросы (scope, assumptions, ограничения).
5. После Stage 7 — validation report и implementation handoff.

```text
$methodology-orchestrator проанализируй ~/project/tz.md. Полный прогон методологии, артефакты в ~/project/asef-run
```

### Вариант 2. По этапам вручную

1. `stage-00-normalization` → подтверждение assumptions и contradictions.
2. По очереди `stage-01` … `stage-07`.
3. Между этапами — `*-stage-packet.json`.

```text
$stage-00-normalization обработай ~/project/tz.md
```

```text
$stage-01-problem-formalization возьми выход Stage 0 и собери problem framing
```

```text
$stage-02-requirements-extraction продолжи на основе выхода Stage 1
```

<a id="artifacts-output"></a>

## Какие артефакты появляются на выходе

Обычно в рабочей папке:

- `00-normalization.md`, `00-stage-packet.json`
- `01-problem-formalization.md`, `01-stage-packet.json`
- … по аналогии до `07-validation.md`, `07-stage-packet.json`

При включённом BA-слое дополнительно, например:

- `01-stakeholder-map.md`, `01-glossary.md`, `01-business-context-and-scope.md`
- `02-business-rules-catalog.md`, `02-use-case-model.md`, `02-acceptance-criteria-seed.md`
- `03-domain-model.md`, `03-data-dictionary.md`, `03-entity-lifecycle-model.md`

<a id="skills-reference"></a>

## Какие skills есть и когда их вызывать

### Основной

- **`$methodology-orchestrator`** — точка входа почти всегда.

### Stage skills

| Skill | Когда |
|--------|--------|
| `$stage-00-normalization` | Структурировать сырой вход |
| `$stage-01-problem-formalization` | Проблема, scope, stakeholders, glossary |
| `$stage-02-requirements-extraction` | Требования, business rules, use cases, acceptance criteria seed |
| `$stage-03-system-modeling` | Flows, состояния, domain model, lifecycle |
| `$stage-04-architecture-design` | Компоненты, интерфейсы, ownership |
| `$stage-05-specification-assembly` | Финальный пакет документов |
| `$stage-06-planning` | Delivery plan |
| `$stage-07-validation` | Готовность к handoff в разработку |

### BA-supporting (точечная доработка)

- `$stakeholder-glossary-builder` — stakeholder map и glossary
- `$business-rules-extractor` — явное выделение business rules
- `$use-case-modeler` — use case model
- `$domain-data-modeler` — domain model, data dictionary, lifecycle
- `$acceptance-criteria-builder` — UAT-ready acceptance criteria

### Вспомогательные

- `$artifact-template-loader` — канонический шаблон документа
- `$traceability-checker` — сквозная трассировка
- `$scoring-evaluator` — scoring и confidence отдельно

<a id="request-examples"></a>

## Примеры запросов

### Полный прогон по ТЗ

```text
$methodology-orchestrator возьми ~/project/tz.md, начни с Stage 0, веди по human checkpoints, артефакты в ~/project/asef-run
```

### Усилить BA-слой существующего прогона

```text
$stakeholder-glossary-builder возьми ~/project/asef-run/01-problem-formalization.md и собери stakeholder map и glossary
```

```text
$use-case-modeler возьми ~/project/asef-run/02-requirements-extraction.md и построй use case model
```

```text
$domain-data-modeler возьми ~/project/asef-run/03-system-modeling.md и оформи domain model, data dictionary и entity lifecycle model
```

### Готовность перед handoff разработчикам

```text
$stage-07-validation проверь пакет в ~/project/asef-run, посчитай scoring, оцени BA sufficiency и скажи, готов ли он к передаче в разработку
```

### Только business rules

```text
$business-rules-extractor выдели business rules из ~/project/tz.md и оформи каталог правил
```

### Acceptance criteria для UAT

```text
$acceptance-criteria-builder возьми use cases и requirements из ~/project/asef-run и собери acceptance criteria catalog
```

## Что делать во время human checkpoints

Остановки на подтверждение — нормальное поведение: scope, non-goals, assumptions, достаточность деталей, explicit constraints перед implementation handoff.

Примеры ответа:

```text
подтверждаю, продолжаем
```

```text
только физлица, одна площадка, без юрлиц и без self-service, продолжай
```

## Когда лучше не использовать узкий skill вручную

Не начинай с узкоспециализированного skill, если непонятен текущий этап, нет stage packet с предыдущего шага или нужен полный прогон. Тогда:

```text
$methodology-orchestrator
```

## Что считать финальным результатом

- артефакты по всем этапам;
- BA- и engineering-документы;
- validation report с readiness decision.

Минимально разумный handoff в разработку обычно включает: problem/scope, requirements, domain/data definition, architecture, execution plan, validation report.

## Для чего нужна методология

1. Снимает неоднозначность входа и делает материал пригодным для системной работы.
2. Пошагово собирает полный пакет продуктовой и инженерной документации.
3. Проверяет, что пакет действительно готов к реализации, а не только выглядит полным.

## Поддерживаемые типы входа

- идея в 1–2 предложениях;
- сырой неструктурированный текст;
- частичное ТЗ;
- готовое ТЗ для нормализации, проверки и усиления.

## Целевой результат

Итоговый набор артефактов включает, в частности: PDD, Functional Specification, SDD, NFR, API Specification, Data Model, UX/User Flows, Execution Plan, Test Strategy, Validation Criteria.

BA-слой: Stakeholder Map, Glossary, Business Rules Catalog, Use Case Model, Domain Model, Data Dictionary, Acceptance Criteria Catalog, User Stories при необходимости.

<a id="stages-list"></a>

## Этапы методологии

Полное описание — в [methodology/README.md](methodology/README.md). Отдельные документы:

1. [Этап 0: Нормализация](methodology/00-normalization.md)
2. [Этап 1: Формализация проблемы](methodology/01-problem-formalization.md)
3. [Этап 2: Извлечение требований](methodology/02-requirements-extraction.md)
4. [Этап 3: Моделирование системы](methodology/03-system-modeling.md)
5. [Этап 4: Архитектурное проектирование](methodology/04-architecture-design.md)
6. [Этап 5: Сборка спецификаций](methodology/05-specification-assembly.md)
7. [Этап 6: Планирование](methodology/06-planning.md)
8. [Этап 7: Валидация](methodology/07-validation.md)

## Если использовать методологию без skills

1. [methodology/README.md](methodology/README.md) — пройти этапы 0–7.
2. Шаблоны — [templates](templates).
3. Контракты handoff и scoring — [automation](automation).

<a id="repo-tree"></a>

## Структура репозитория

```text
AI-System-Engineering-Methodology/
├── methodology/          # этапы и BA-модель
├── templates/            # шаблоны артефактов
├── automation/           # контракты и scoring
├── skills/               # исходные спецификации skills
├── codex-skills/         # bundle для Codex
├── cursor-skills/        # bundle для Cursor
├── technical-assignment-1.md
├── skills-technical-assignment.md
└── README.md
```

## Принципы проекта

- не привязана к конкретному стеку;
- не зависит от конкретной команды;
- разделяет роли AI и человека;
- ориентирована на проверяемый, воспроизводимый результат;
- пригодна для автоматизации.

<a id="author"></a>

## Авторство и контакты

Методология и материалы репозитория: **Вадим Евграфов**.

- Telegram: [@vadim_evgrafov](https://t.me/vadim_evgrafov)
- Электронная почта: [vadim@evgrafov.biz](mailto:vadim@evgrafov.biz)

## Следующий уровень развития

Уже есть: полный процесс, шаблоны, automation contracts, scoring, BA-layer model, skills и bundles **codex-skills** / **cursor-skills**.

Возможное развитие: расширение исполнимых skills и agent specs; примеры применения на реальных кейсах. В репозитории также есть skill scaffold, mapping и demo input для end-to-end проверки.
