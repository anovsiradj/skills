---
name: godot-3d-tools
description: Godot Engine 3D tools, GridMaps, CSG, procedural geometry, and pathfinding.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# 3D Tools

## Overview
Level-building and procedural geometry: CSG nodes for grey-boxing, `GridMap` for voxel-style levels, procedural meshes via `ArrayMesh`/`SurfaceTool`, and `AStar3D` for pathfinding.

## Key Version Differences (3.x vs 4.x)
- **CSG**: Same node names; results should be baked to static meshes before shipping (use the "Bake Mesh Instance" option).
- **Procedural meshes**: `ArrayMesh` API now uses `SurfaceTool` and `Arrays` with typed arrays (`PackedVector3Array` etc.).
- `AStar3D` works on `Vector3` points (2.x `AStar` was split into `AStar2D`/`AStar3D`).

## File Map
| File | Purpose |
|------|---------|
| [classes/csg.md](classes/csg.md) | CSG nodes and operations |
| [tips/performance.md](tips/performance.md) | Mesh/CSG/GridMap performance |
| [usage/workflow.md](usage/workflow.md) | Grey-boxing to production workflow |
| [examples/csg_scene.gd](examples/csg_scene.gd) | CSG carving from code |
| [examples/array_mesh.gd](examples/array_mesh.gd) | Building a mesh with SurfaceTool |

## Quick Start
```gdscript
# Grey-box a level: CSG nodes block out geometry, then bake to mesh.
var wall := CSGBox3D.new()
wall.size = Vector3(10, 3, 0.5)
add_child(wall)
```
