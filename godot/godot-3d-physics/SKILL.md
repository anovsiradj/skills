---
name: godot-3d-physics
description: Godot Engine 3D physics, collision, and ragdolls.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 3D Physics

## Key Insights
- **Body Types**: Mirrors 2D physics (`StaticBody3D`, `RigidBody3D`, `CharacterBody3D`, `AnimatableBody3D`).
- **Complex Collisions**: Supports convex hulls and triangle meshes for accurate collisions.
- **Advanced**: Supports Soft Bodies and Ragdolls for realistic death/impact animations.

## Major Version Differences (3.x vs 4.x)
- **Physics Interpolation**: Now available in 3D, fixing the "stutter" seen when the camera moves at a different rate than the physics.
- **CharacterBody3D**: Similar to 2D, `KinematicBody3D` became `CharacterBody3D` with a streamlined `move_and_slide()`.

## Weird/Unusual Things
- **VehicleBody3D**: Intended for arcade-style physics. Do not expect high-fidelity simulation (like BeamNG) without significant custom work.

## Recommendations
- **Performance**: Use "Convex" collision shapes instead of "Concave/Triangle" meshes whenever possible.
- **Character Controllers**: Use `CharacterBody3D` for almost all humanoid characters.

## Prohibitions
- Do not use a `TriangleMesh` for a moving object; it will be extremely slow and may cause physics glitches. Use a combination of boxes and spheres.

## ELI5: Convex vs Concave Collisions
- **Convex (The Rubber Band)**: Imagine wrapping a rubber band around an object. It fills in all the holes. It's very fast for the computer to calculate.
- **Concave (The Exact Shape)**: The computer checks every single triangle of the 3D model. This is very slow, like trying to count every grain of sand on a beach. Use this only for things that never move (like the floor).

### Example: Simple Jump
```gdscript
extends CharacterBody3D

const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
```

