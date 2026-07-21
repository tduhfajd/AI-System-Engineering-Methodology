# Codex Skills Bundle

Portable bundle для `~/.codex/skills`. Установите весь каталог вместе с `_asef-shared`:

```bash
cp -R ./codex-skills/* ~/.codex/skills/
```

Точка входа — `$methodology-orchestrator`. Он выбирает `quick_discovery`, `full_delivery` или `existing_spec_review`, ведёт `RUN.md` и останавливается на обязательных human checkpoints.

Для новой стартап-идеи в России до Stage 0 доступен `$roast-startup-ru`; его verdict передаётся в методологию через optional pre-gate.

Полная инструкция, примеры запросов, все skills и правила обновления bundle находятся в [корневом README](../README.md).
