---
name: godot-import
description: Godot Engine import plugins, file formats, and resource management.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Import

## Overview
How external assets become Godot resources: the import pipeline (`.import` files, `.godot/imported/`), `load()` vs `preload()`, and custom import via `EditorImportPlugin`.

## Key Version Differences (3.x vs 4.x)
- Imported files produce `.import` sidecar files; binary data lands in `.godot/imported/`.
- `load()` resolves via the `.import` file; `preload()` loads at script compile time.
- Custom importers extend `EditorImportPlugin` (2.x `EditorImportPlugin` API changed).

## File Map
| File | Purpose |
|------|---------|
| [classes/loading.md](classes/loading.md) | ResourceLoader, load vs preload |
| [tips/version_control.md](tips/version_control.md) | .import files and .godot/ in Git |
| [usage/workflow.md](usage/workflow.md) | Import tab workflow |
| [examples/load_vs_preload.gd](examples/load_vs_preload.gd) | Asset loading patterns |

## Quick Start
```gdscript
# Essential asset: loaded at compile time.
const ICON := preload("res://icon.svg")
# Dynamic asset: loaded when the line runs.
var skin := load("res://skins/red.tres")
```
