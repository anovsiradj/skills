---
name: godot-navigation
description: Godot Engine navigation, A* pathfinding, and navmeshes.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Navigation

## Key Insights
- **A\* Algorithm**: Built-in `AStar2D` and `AStar3D` for custom point-to-point pathfinding.
- **Navigation Meshes (NavMesh)**: Used for complex area-based movement.
- **Dynamic Avoidance**: Agents can avoid each other and dynamic obstacles in real-time.

## Major Version Differences (3.x vs 4.x)
- **NavigationServer**: Godot 4 introduced a much more powerful `NavigationServer` that handles navmesh baking and pathfinding on a separate thread.
- **Runtime Baking**: Navmeshes can now be baked at runtime, allowing for destructible environments.

## Weird/Unusual Things
- **NavigationAgent**: The `NavigationAgent2D/3D` nodes act as a bridge between the high-level server and your character's movement logic.

## Recommendations
- **Static Levels**: Bake your NavMesh in the editor for better performance.
- **Dynamic Levels**: Use `NavigationRegion3D` to bake small sections of the map when something changes.

## Prohibitions
- Do not call expensive navmesh baking every frame; do it only when a significant change occurs in the environment.

## ELI5: NavMesh
Imagine your game world is a big room with furniture. A NavMesh is like a "walkable rug" that the computer lays down on the floor. The rug covers every spot where a character can actually stand. If there's a table, the rug has a hole in it. When you tell a character to move, they just look for the shortest path across the rug. If they hit a hole, they walk around it.

### Example: Basic Navigation
1. Add a `NavigationRegion3D` and create a `NavigationMesh`.
2. Add a `NavigationAgent3D` to your character.
3. In script:
```gdscript
func _ready():
	var target_pos = Vector3(10, 0, 10)
	nav_agent.target_position = target_pos

func _physics_process(delta):
	var next_path_pos = nav_agent.get_next_path_position()
	var current_pos = global_position
	var new_velocity = (next_path_pos - current_pos).normalized() * SPEED
	velocity = new_velocity
	move_and_slide()
```

