---
name: godot-file-formats
description: Godot Engine file formats, scene serialization, and resource management.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# File Formats

## Overview
How Godot stores data: `.tscn`/`.tres` text formats vs `.scn`/`.res` binary, the `res://` and `user://` path schemes, and when to use `ResourceLoader`/`load()` vs `FileAccess`.

## Key Version Differences (3.x vs 4.x)
- Text scene format changed (UIDs in Godot 4.x, `[node name="X" type="Y"]` structure).
- `File` class → `FileAccess` singleton (`FileAccess.open(path, mode)`).
- Use `ResourceLoader`/`load()` for imported assets; never `FileAccess` on `res://` in exported builds (packed into `.pck`).

## File Map
| File | Purpose |
|------|---------|
| [classes/io.md](classes/io.md) | Native formats, ResourceLoader vs FileAccess |
| [tips/tips.md](tips/tips.md) | Export trap, Git guidelines, paths |
| [usage/workflow.md](usage/workflow.md) | Storage paths and import flow |
| [examples/save_game.gd](examples/save_game.gd) | Saving/loading with FileAccess |
| [examples/config_file.gd](examples/config_file.gd) | ConfigFile usage |

## Quick Start
```gdscript
var file := FileAccess.open("user://save.dat", FileAccess.WRITE)
file.store_var(player_data)
```
