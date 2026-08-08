---
name: godot-windowing
description: Godot Engine windowing, OS integration, and window management.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Windowing

## Overview
Managing the game window and OS integration: `DisplayServer` for window mode/size/vsync, the `OS` singleton for platform info, and `Window` nodes for multi-window setups.

## Key Version Differences (3.x vs 4.x)
- Window control moved from `OS` to `DisplayServer`.
  - Old (3.x): `OS.set_window_fullscreen(true)`
  - New (4.x): `DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)`
- Resolution handling via project settings (`Display > Window`) + stretch modes.

## File Map
| File | Purpose |
|------|---------|
| [classes/display_server.md](classes/display_server.md) | DisplayServer functions |
| [classes/os_singleton.md](classes/os_singleton.md) | OS singleton |
| [tips/tips.md](tips/tips.md) | 3.x→4.x migration, vsync |
| [usage/workflow.md](usage/workflow.md) | Resolution and fullscreen |
| [examples/window_control.gd](examples/window_control.gd) | Fullscreen + vsync toggles |

## Quick Start
```gdscript
DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
```
