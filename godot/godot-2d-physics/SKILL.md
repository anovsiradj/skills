---
name: godot-2d-physics
description: Godot Engine 2D physics, collision bodies, and interpolation.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Physics

## Key Insights
- **Body Types**:
	- `StaticBody2D`: Doesn't move (walls).
	- `AnimatableBody2D`: Moved by script/animation (elevators).
	- `RigidBody2D`: Full physics simulation (falling boxes).
	- `CharacterBody2D`: Script-controlled movement (players).
- **Areas**: `Area2D` is for detection, not for blocking movement.

## Major Version Differences (3.x vs 4.x)
- **KinematicBody2D -> CharacterBody2D**: In Godot 4, `KinematicBody2D` was renamed to `CharacterBody2D` and introduced the `move_and_slide()` method without requiring velocity as an argument (it uses a built-in property now).
- **Physics Interpolation**: Godot 4 adds official support for physics interpolation to smooth out movement between physics ticks.

## Weird/Unusual Things
- **AnimatableBody2D**: Essential for moving platforms; using a StaticBody for this can cause "jitter" or bugs where the player doesn't move with the platform.

## Recommendations
- **Player Movement**: Use `CharacterBody2D` for players to have precise control over sliding and collisions.
- **Optimization**: Use simple shapes (Circle, Box) over Collision Polygons whenever possible.

## Prohibitions
- Do not move `StaticBody2D` nodes via script every frame; use `AnimatableBody2D` instead.

## ELI5: CharacterBody2D vs RigidBody2D
A `RigidBody2D` is like a **soccer ball**. You kick it, and it bounces and rolls based on physics laws. You don't tell it exactly where to go; you just push it.
A `CharacterBody2D` is like a **human**. You tell it "walk forward," and it does. It knows how to stop at a wall and how to climb a slope, but it doesn't just "bounce" away when something hits it unless you tell it to.

### Example: Basic Player Movement
```gdscript
extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()
```

