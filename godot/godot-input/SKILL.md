---
name: godot-input
description: Godot Engine input handling, input mapping, and input events.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Input

## Overview
Godot's input system has two halves: **polling** (`Input` singleton — check state every frame) and **events** (`_input`/`_unhandled_input` callbacks with `InputEvent`). `InputMap` maps abstract actions to concrete keys/buttons.

## Key Version Differences (3.x vs 4.x)
- `Input` and `InputMap` are **singletons** — never `Input.new()` or `extends InputMap`.
- `InputEvent` subclasses are created with `.new()` (e.g. `InputEventKey.new()`).
- `InputMap` actions are configured in `Project Settings > Input Map`; at runtime use `InputMap.action_add_event()` etc.
- Use `Input.get_axis("left","right")` / `get_vector()` for smooth axis input.

## File Map
| File | Purpose |
|------|---------|
| [classes/systems.md](classes/systems.md) | Polling vs events, InputEvent types |
| [tips/gotchas.md](tips/gotchas.md) | Input priority, deadzones, physical keys |
| [usage/input_map.md](usage/input_map.md) | Defining actions in the Input Map |
| [examples/polling.gd](examples/polling.gd) | Polling the Input singleton |
| [examples/input_events.gd](examples/input_events.gd) | Handling InputEvents |
| [examples/input_map_runtime.gd](examples/input_map_runtime.gd) | Rebinding actions at runtime |

## Quick Start
```gdscript
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		jump()
```
