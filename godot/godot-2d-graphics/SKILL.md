---
name: godot-2d-graphics
description: Godot Engine 2D graphics, sprites, lighting, and font rendering.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Graphics

## Overview
Covers the core 2D rendering stack in Godot 4: sprite and polygon nodes, 2D lights and shadows, MSDF font rendering, and GPU particle systems.

## Key Version Differences (3.x vs 4.x)
- **2D Lighting**: `PointLight2D` now uses a texture + `shadow_enabled`; occluders use an `OccluderPolygon2D` resource assigned to `LightOccluder2D.occluder`.
- **Fonts**: MSDF is a first-class `FontFile` feature (`multichannel_signed_distance_field`, `msdf_pixel_range`, `msdf_size`). `DynamicFont` no longer exists.
- **TileMap**: `TileMap` (3.x) is replaced by the node-based `TileMapLayer` (see godot-2d-tools).
- **Particles**: `Particles2D` became `GPUParticles2D` / `CPUParticles2D`.

## File Map
| File | Purpose |
|------|---------|
| [classes/sprites.md](classes/sprites.md) | Sprite2D, AnimatedSprite2D, editor annotations |
| [tips/pitfalls.md](tips/pitfalls.md) | Movement, filtering, tilemap, and particle pitfalls |
| [usage/movement.md](usage/movement.md) | Frame-independent 2D movement workflow |
| [examples/sprite_basics.gd](examples/sprite_basics.gd) | Static and animated sprites |
| [examples/lighting_setup.gd](examples/lighting_setup.gd) | 2D lights and shadow occluders |
| [examples/msdf_fonts.gd](examples/msdf_fonts.gd) | Crisp MSDF font rendering |

## Quick Start
```gdscript
extends Sprite2D

@export var speed: float = 300.0

func _process(delta: float) -> void:
	position += Vector2(Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized() * speed * delta
```
