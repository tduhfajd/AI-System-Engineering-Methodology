# Codex Skills Bundle

Portable bundle для `~/.codex/skills`. Установите весь каталог вместе с `_asef-shared`:

```bash
cp -R ./codex-skills/* ~/.codex/skills/
```

Точка входа — `$methodology-orchestrator`. Он выбирает `quick_discovery`, `full_delivery` или `existing_spec_review`, ведёт `RUN.md` и останавливается на обязательных human checkpoints.

Для новой стартап-идеи в России до Stage 0 доступен `$roast-startup-ru`; его verdict передаётся в методологию через optional pre-gate. Если verdict равен `VALIDATE` или остаётся критичная неподтверждённая гипотеза, `$fast-track-validation` превращает её в минимальный измеримый эксперимент. До статуса `COMPLETED` решение остаётся `PENDING`; после завершения skill возвращает `PROCEED`, `ITERATE`, `PIVOT` или `STOP`.

Полная инструкция, примеры запросов, все skills и правила обновления bundle находятся в [корневом README](../README.md).

Для проверки угрозы AI-платформ используйте `$platform-risk-review`: он оценивает четыре сценария на 12, 24 и 36 месяцев, остаточную ценность и защиту. Доступен отдельно и внутри прожарки/orchestrator; учитывает цели коммерческого, внутреннего или открытого проекта. Пример: `$platform-risk-review оцени ~/project/idea.md; результаты в ~/project/asef-run`.
