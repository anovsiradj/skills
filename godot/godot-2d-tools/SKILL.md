---
name: godot-2d-tools
description: Godot Engine 2D tools, TileMaps, and geometry helpers.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Tools

## Key Insights
- **TileMaps**: The core tool for grid-based level design.
- **Pathing**: `Path2D` and `PathFollow2D` provide a simple way to make objects move along a curve.
- **Geometry**: `Geometry2D` class offers static methods for boolean operations on polygons (union, intersection, etc.).

## Major Version Differences (3.x vs 4.x)
- **TileMap Overhaul**: Godot 4 completely redesigned TileMaps with a "Layers" system and "Terrain" (formerly Autotiles) which is much more powerful but has a different workflow.

## Weird/Unusual Things
- **PathFollow2D**: The rotation is handled automatically by default to face the direction of movement.

## Recommendations
- **Level Design**: Leverage TileMap layers to separate background, decoration, and collision.
- **Procedural Paths**: Use `Path2D` for things like patrol routes or camera tracks.

## Prohibitions
- Do not use `Geometry2D` operations every single frame in a tight loop; they can be computationally expensive.

## ELI5: PathFollow2D
Imagine you have a piece of string glued to a table in a curvy shape (`Path2D`). Now imagine a tiny bead (`PathFollow2D`) sliding along that string. You don't tell the bead "move left, then move up"; you just tell it "move 10% further along the string." The bead takes care of the turns for you.

### Example: Moving an Object on a Path
```gdscript
extends PathFollow2D

func _process(delta):
	# Progress is 0.0 to 1.0 (if loop is enabled)
	progress += 100 * delta 
```

