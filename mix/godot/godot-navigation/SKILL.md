---
name: godot-navigation
description: Godot Engine navigation, pathfinding, and navigation meshes.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Navigation

## Overview
Pathfinding: `NavigationRegion2D`/`NavigationRegion3D` define walkable surfaces (baked navmesh), `NavigationAgent2D`/`NavigationAgent3D` steer agents along paths, and `AStar2D`/`AStar3D` provide grid-based alternatives.

## Key Version Differences (3.x vs 4.x)
- Navigation **regions** replace the old `NavigationMeshInstance`; bake via `NavigationMesh` resource.
- Agent API: `set_target_position()`, `get_next_path_position()`, `is_navigation_finished()`.
- With `avoidance_enabled`, use the `velocity_computed` signal with `set_velocity()` — do not call `move_and_slide()` directly.
- NavMesh syncs at end of frame: set targets after `_ready()` (deferred or one physics frame later).

## File Map
| File | Purpose |
|------|---------|
| [classes/agents.md](classes/agents.md) | Agents and regions |
| [tips/pitfalls.md](tips/pitfalls.md) | First-frame bug, jitter, avoidance |
| [usage/setup.md](usage/setup.md) | Baking the navmesh |
| [examples/navigation_agent.gd](examples/navigation_agent.gd) | Moving an agent to a target |

## Quick Start
```gdscript
@onready var agent: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta: float) -> void:
	if agent.is_navigation_finished():
		return
	velocity = global_position.direction_to(agent.get_next_path_position()) * speed
	move_and_slide()
```
