---
name: godot-3d-physics
description: Godot Engine 3D physics, rigid bodies, joints, and collision detection.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# 3D Physics

## Overview
The 3D physics system: body types (`StaticBody3D`, `RigidBody3D`, `CharacterBody3D`, `AnimatableBody3D`), collision shapes, areas for detection, and joints. All physics runs in `_physics_process()`.

## Key Version Differences (3.x vs 4.x)
- **`move_and_slide()`**: Uses the body's `velocity` property; no velocity argument (3.x took it as a parameter).
- **KinematicBody3D → CharacterBody3D**; collision shape `shape` property is a `Shape3D` resource.
- Gravity is read from project settings (`physics/3d/default_gravity`).
- Joints: `Generic6DOFJoint3D` etc. use the same API family as 2D.

## File Map
| File | Purpose |
|------|---------|
| [classes/bodies.md](classes/bodies.md) | Body types and collision shapes |
| [tips/stability.md](tips/stability.md) | Physics stability and performance |
| [usage/character_controller.md](usage/character_controller.md) | First/third-person movement |
| [examples/character_body_3d.gd](examples/character_body_3d.gd) | Full 3D controller |
| [examples/area3d.gd](examples/area3d.gd) | Overlap detection |
| [examples/rigid_body_3d.gd](examples/rigid_body_3d.gd) | Impulses and forces |

## Quick Start
```gdscript
extends CharacterBody3D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 9.8 * delta
	move_and_slide()
```
