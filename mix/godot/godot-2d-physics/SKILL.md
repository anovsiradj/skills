---
name: godot-2d-physics
description: Godot Engine 2D physics, rigid bodies, joints, and collision detection.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Physics

## Overview
The 2D physics system: body types, collision shapes, layers/masks, areas for detection, and joints for constraints. Physics runs in `_physics_process()` at a fixed rate.

## Key Version Differences (3.x vs 4.x)
- **`move_and_slide()`**: Uses the built-in `velocity` property of the body; no arguments needed in the common case (3.x took `velocity` as a parameter).
- **KinematicBody2D → CharacterBody2D**; `PhysicsBody2D` is now the abstract base.
- **One-way collisions, wall sliding, and floor detection** are configured via properties like `floor_max_angle` and `motion_mode`.
- Collision layers/masks are configured with `collision_layer` / `collision_mask` bitmasks on the body.

## File Map
| File | Purpose |
|------|---------|
| [classes/bodies.md](classes/bodies.md) | Body types and collision shapes |
| [tips/optimization.md](tips/optimization.md) | Physics performance and stability |
| [usage/character_movement.md](usage/character_movement.md) | CharacterBody2D platformer movement |
| [examples/character_body_2d.gd](examples/character_body_2d.gd) | Full platformer controller |
| [examples/area_detection.gd](examples/area_detection.gd) | Area2D overlap detection |
| [examples/joints_2d.gd](examples/joints_2d.gd) | PinJoint2D / DampedSpringJoint2D |

## Quick Start
```gdscript
extends CharacterBody2D

const SPEED := 300.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()
```
