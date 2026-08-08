---
name: godot-2d-tools
description: Godot Engine 2D tools, TileMaps, Path2D, and geometry helpers.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Tools

## Overview
Level-design and geometry helpers: `TileMapLayer` for grid-based levels, `Path2D`/`PathFollow2D` for scripted movement routes, and `AStar2D` for grid pathfinding.

## Key Version Differences (3.x vs 4.x)
- **TileMap → TileMapLayer**: The old `TileMap` node became a per-layer node. `set_cell()` is now `set_cell(coords, source_id, atlas_coords)` on the layer (no `layer` index argument).
- **Autotiles → Terrain**: Terrain sets pick the correct neighbor tile automatically.
- `Path2D`/`PathFollow2D` API is largely unchanged.

## File Map
| File | Purpose |
|------|---------|
| [classes/tilemaps.md](classes/tilemaps.md) | TileMapLayer, TileSet, terrain |
| [tips/tips.md](tips/tips.md) | Painting, path smoothing, grid snap |
| [usage/pathing.md](usage/pathing.md) | Path2D / PathFollow2D movement |
| [examples/tilemap_layer.gd](examples/tilemap_layer.gd) | Setting tiles from code |
| [examples/path_follow_2d.gd](examples/path_follow_2d.gd) | Moving along a path |
| [examples/astar_grid.gd](examples/astar_grid.gd) | A* grid pathfinding |

## Quick Start
```gdscript
# TileMapLayer: set a tile at grid coords (5, 5) from source 0, atlas cell (0, 0)
$TileMapLayer.set_cell(Vector2i(5, 5), 0, Vector2i(0, 0))
```
