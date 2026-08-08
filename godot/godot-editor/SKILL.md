---
name: godot-editor
description: Godot Engine editor, plugins, and editor tools.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Editor

## Overview
Extending and using the Godot editor: `@tool` scripts that run in the editor, `EditorPlugin` for custom tools/docks, `EditorInterface` for editor APIs, and workspace workflows (2D/3D/script views).

## Key Version Differences (3.x vs 4.x)
- `EditorPlugin` API is similar but moved to Godot 4 conventions (e.g. `add_tool_menu_item`, `add_control_to_dock`).
- `@tool` scripts run in the editor; guard editor-only logic with `Engine.is_editor_hint()`.
- Plugins live in `res://addons/<plugin_name>/` with a `plugin.cfg`.

## File Map
| File | Purpose |
|------|---------|
| [classes/plugins.md](classes/plugins.md) | EditorPlugin basics |
| [tips/pro_tips.md](tips/pro_tips.md) | Live scene editing, IDEs, workspaces |
| [usage/workspaces.md](usage/workspaces.md) | 2D/3D/script editor workflows |
| [examples/editor_plugin.gd](examples/editor_plugin.gd) | Custom tool menu plugin |
| [examples/tool_script.gd](examples/tool_script.gd) | @tool script pattern |

## Quick Start
```gdscript
@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_tool_menu_item("My Tool", _on_tool_clicked)

func _exit_tree() -> void:
	remove_tool_menu_item("My Tool")
```
