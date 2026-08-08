---
name: godot-miscellaneous
description: Godot Engine miscellaneous features, video playback, and low-level access.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Miscellaneous

## Overview
Cross-cutting engine concepts that don't fit a single system: the scene tree and signals architecture, node referencing patterns, `@tool` behavior, and performance-conscious approaches (MultiMesh, RenderingServer).

## Key Version Differences (3.x vs 4.x)
- **Signals**: `emit()` instead of `emit_signal()`; connect with `signal.connect(callable)` or the `signal_name.connect()` syntax.
- **Instancing**: `PackedScene.instantiate()` instead of `instance()`.
- **Memory**: `queue_free()` for safe deletion; `RefCounted` for resources.

## File Map
| File | Purpose |
|------|---------|
| [classes/architecture.md](classes/architecture.md) | Scene tree, signals, instancing |
| [tips/optimization.md](tips/optimization.md) | Node overhead, MultiMesh |
| [usage/references.md](usage/references.md) | @onready, unique names |
| [examples/signals.gd](examples/signals.gd) | Emitting and connecting signals |
| [examples/multimesh.gd](examples/multimesh.gd) | Rendering thousands of objects |

## Quick Start
```gdscript
# Signals decouple nodes:
signal died(score: int)
died.emit(100)
# Connect via: $Enemy.died.connect(_on_died)
```
