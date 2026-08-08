---
name: godot-internationalization
description: Godot Engine internationalization, localization, and translation.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Internationalization

## Overview
Localizing a game: `Translation`/`TranslationServer` for lookup, CSV→`.translation` import workflow, `tr()` for in-code text, and UI considerations (text overflow, RTL, fonts).

## Key Version Differences (3.x vs 4.x)
- `TranslationServer.set_locale()` and `tr()` remain the core API.
- `.translation` files generated from CSV/PO are added in `Project Settings > Localization`.
- Use `tr("KEY").format([args])` for placeholders; `TranslationServer.get_locale()` to read the current locale.

## File Map
| File | Purpose |
|------|---------|
| [classes/translation.md](classes/translation.md) | TranslationServer and tr() |
| [tips/best_practices.md](tips/best_practices.md) | UI overflow, fonts, RTL |
| [usage/workflow.md](usage/workflow.md) | CSV → translation workflow |
| [examples/translation.gd](examples/translation.gd) | Changing locale at runtime |

## Quick Start
```gdscript
# Every user-facing string goes through tr().
label.text = tr("KEY_START")
# With placeholders:
label.text = tr("KEY_GREETING").format(["Player1"])
```
