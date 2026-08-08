---
name: godot-gui
description: Godot Engine GUI system, Control nodes, Containers, and Theming.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# GUI System

## Overview
The `Control`-based UI system: base controls (`Button`, `Label`, `LineEdit`, `RichTextLabel`), automatic layout via `Container`s, anchors for fixed positioning, and theming with `Theme`/`StyleBox`.

## Key Version Differences (3.x vs 4.x)
- **Theme API**: `Theme` resources and `add_theme_*_override()` methods; per-item overrides.
- `Control` layout properties (`anchor_*`, `offset_*`) work the same, but `Container` children must not be manually positioned.
- `RichTextLabel` uses BBCode via `append_text()` / `parse_bbcode()`.

## File Map
| File | Purpose |
|------|---------|
| [classes/controls.md](classes/controls.md) | Control nodes and containers |
| [tips/tips.md](tips/tips.md) | Container gotchas and performance |
| [usage/responsive_ui.md](usage/responsive_ui.md) | Anchors vs containers |
| [examples/centered_ui.gd](examples/centered_ui.gd) | Building UI from code |
| [examples/theming.gd](examples/theming.gd) | Theme overrides |

## Quick Start
```gdscript
# Containers lay out children automatically; don't set child positions manually.
var vbox := VBoxContainer.new()
vbox.add_theme_constant_override("separation", 8)
add_child(vbox)
```
