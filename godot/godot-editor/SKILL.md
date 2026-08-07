---
name: godot-editor
description: Godot Engine editor features, plugins, and workflow optimizations.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Editor

## Key Insights
- **Integrated Ecosystem**: Built-in script editor, debugger, and profiler.
- **External Flexibility**: Supports external editors (VS Code, Vim) via configuration.
- **Live Iteration**: Supports live script reloading and live scene editing.

## Weird/Unusual Things
- **Editor Scripts**: Any script can be run in the editor using `@tool` (or similar mechanisms), allowing for custom inspector buttons and editor-time logic.
- **Remote Inspector**: Allows modifying a running game's properties in real-time, but these changes are NOT saved to the scene file.

## Recommendations
- **Performance Tuning**: Use the Visual Profiler and custom performance monitors to find bottlenecks early.
- **Tool Scripts**: Use `@tool` scripts to automate repetitive level design tasks.

## Prohibitions
- Do not rely on the Remote Inspector for permanent changes; always apply them in the local editor.

## ELI5: Tool Scripts (@tool)
Imagine you have a magic paintbrush. Normally, you only see the painting when you "Play" the game. A tool script is like a paintbrush that works while you are still setting up the room. If you want 100 trees to align perfectly in a circle, you don't move them one by one; you write a small script that does it for you right there in the editor.

### Example: Simple Tool Script
```gdscript
@tool
extends Node2D

@export var spacing: float = 100.0:
	set(value):
		spacing = value
		update_positions()

func _ready():
	update_positions()

func update_positions():
	# This runs in the editor!
	position = Vector2(spacing, spacing)
```

