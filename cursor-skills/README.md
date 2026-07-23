# Cursor Skills Bundle

Portable bundle для `.cursor/skills/` проекта или `~/.cursor/skills/`. Скопируйте всё содержимое каталога и сохраните `_asef-shared` на одном уровне с папками skills:

```bash
mkdir -p /path/to/project/.cursor/skills
cp -R ./cursor-skills/* /path/to/project/.cursor/skills/
```

Основной вход — `methodology-orchestrator`: он выбирает `quick_discovery`, `full_delivery` или `existing_spec_review`, сохраняет состояние в `RUN.md` и соблюдает human checkpoints.

Для новой стартап-идеи в России доступен optional pre-gate `roast-startup-ru`. При verdict `VALIDATE` или критичной неподтверждённой гипотезе используйте `fast-track-validation`: он готовит минимальный измеримый эксперимент. До статуса `COMPLETED` решение остаётся `PENDING`; после завершения skill возвращает `PROCEED`, `ITERATE`, `PIVOT` или `STOP`.

Полная инструкция, примеры запросов, все skills и правила обновления bundle находятся в [корневом README](../README.md).
