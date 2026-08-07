---
name: godot-miscellaneous
description: Godot Engine miscellaneous features, CLI, and advanced optimizations.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Miscellaneous

## Key Insights
- **Low-Level Servers**: You can bypass the Scene Tree (Nodes) and talk directly to the `RenderingServer` or `PhysicsServer` for extreme performance.
- **CLI**: Full command line support for automation and CI/CD.
- **Custom Modules**: You can write C++ modules and compile them directly into the engine binary.

## Major Version Differences (3.x vs 4.x)
- **Print Rich**: Added `print_rich()`, allowing you to print colored and formatted text to the console.

## Weird/Unusual Things
- **Compilation Profiles**: The editor can detect which engine features you AREN'T using and create a custom, smaller build of the engine for your final export.

## Recommendations
- **Extreme Optimization**: If you have 10,000 moving objects, don't use 10,000 `Sprite2D` nodes; use the `RenderingServer` to draw them all in one go.
- **Automation**: Use the CLI for repetitive tasks like exporting to 5 different platforms.

## Prohibitions
- Do not use Low-Level Servers unless you have a proven performance bottleneck; they are much harder to debug and maintain than Nodes.

## ELI5: Low-Level Servers
Imagine Godot is a big company. 
- **Nodes** are like "Managers". If you want to move a box, you tell the Manager, and the Manager tells the worker to move the box. This is easy but slow.
- **Servers** are the "Workers". If you talk directly to the Worker, you skip the Manager. It's much faster, but you have to give very specific, technical instructions, or the worker will get confused.

### Example: Print Rich
```gdscript
func _ready():
	print_rich("[color=green][b]Success![/b][/color] Game started correctly.")
	print_rich("[color=red]Error:[/color] Could not find save file.")
```

