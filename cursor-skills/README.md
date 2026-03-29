# Cursor Skills Bundle

Этот каталог — portable bundle **Agent Skills для Cursor**: те же workflow и ссылки, что в `codex-skills`, но без Codex-специфичных файлов (`agents/openai.yaml`). Каждый skill — каталог с `SKILL.md` и YAML frontmatter (`name`, `description`), как ожидает Cursor.

## Что внутри

- stage skills `stage-00-normalization` — `stage-07-validation`
- `methodology-orchestrator`
- supporting skills: `artifact-template-loader`, `traceability-checker`, `scoring-evaluator`, `stakeholder-glossary-builder`, `use-case-modeler`, `business-rules-extractor`, `domain-data-modeler`, `acceptance-criteria-builder`
- общий reference layer в `_asef-shared` (пути в SKILL.md вида `../_asef-shared/...` рассчитаны на то, что `_asef-shared` лежит рядом с папками skills в одном родительском каталоге)

## Как установить в Cursor

**Проект (рекомендуется для этой методологии):** скопируй содержимое `cursor-skills/` в `.cursor/skills/` в корне репозитория (или положи туда симлинк на этот каталог). Обязательно сохрани `_asef-shared` на одном уровне с каталогами skills.

**Персонально:** скопируй то же содержимое в `~/.cursor/skills/`, чтобы skills были доступны во всех проектах.

Cursor подхватывает skills из этих путей автоматически; отдельная регистрация не нужна.

## Отличия от `codex-skills`

- нет каталогов `agents/` и YAML для Codex CLI
- инструкции по установке ориентированы на `~/.cursor/skills` и `.cursor/skills`

## Ограничение

Bundle автономен на уровне skill references, без runtime automation и внешних интеграций: knowledge/workflow layer для агента Cursor.
