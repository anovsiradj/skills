# Navigation Agents
The "brains" that move characters.

### Key Classes
- `NavigationAgent2D` / `NavigationAgent3D`: The helper node.
- `NavigationRegion2D` / `NavigationRegion3D`: The "walkable" zone.

### Key Methods
- `set_target_position(pos)`: Sets the destination.
- `get_next_path_position()`: Finds the next waypoint on the path.
- `is_navigation_finished()`: True when close to target.

### Example: Basic Navigation
```gdscript
@onready var nav_agent = $NavigationAgent2D

func _physics_process(delta):
	if nav_agent.is_navigation_finished():
		return
		
	var next_pos = nav_agent.get_next_path_position()
	velocity = global_position.direction_to(next_pos) * speed
	move_and_slide()
```
