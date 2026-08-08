---
name: godot-3d-graphics
description: Godot Engine 3D graphics, PBR materials, lighting, and post-processing.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# 3D Graphics

## Overview
The 3D rendering stack: nodes and cameras, PBR materials via `StandardMaterial3D`, light types, and the `WorldEnvironment` for sky/fog/tonemapping.

## Key Version Differences (3.x vs 4.x)
- **Renderers**: Godot 4 has three renderers — Forward+ (desktop, default), Mobile (mobile/VR), and Compatibility (web/old GPUs). See godot-rendering.
- **Materials**: `SpatialMaterial` is now `StandardMaterial3D`. Alpha transparency uses `BaseMaterial3D.TRANSPARENCY_ALPHA`.
- **Lighting**: `GIProbe`/`BakedLightmap` are replaced by `LightmapGI`, `VoxelGI`, and `SDFGI` (see godot-rendering/usage).

## File Map
| File | Purpose |
|------|---------|
| [classes/basics.md](classes/basics.md) | Nodes, cameras, coordinate system |
| [classes/materials.md](classes/materials.md) | PBR materials, transparency modes |
| [tips/tips.md](tips/tips.md) | Transparency, normal maps, scale |
| [usage/lighting.md](usage/lighting.md) | Light types and environment |
| [examples/lighting_3d.gd](examples/lighting_3d.gd) | Lights from code |
| [examples/materials.gd](examples/materials.gd) | PBR materials from code |

## Quick Start
```gdscript
extends Node3D

func _ready() -> void:
	var cam := Camera3D.new()
	cam.position = Vector3(0, 2, 5)
	add_child(cam)
```
