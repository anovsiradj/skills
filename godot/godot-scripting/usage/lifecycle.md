# GDScript Lifecycle
Understanding when your code actually runs.

### Core Functions
- `_init()`: Called when the object is first created in memory.
- `_ready()`: Called when the node and its children are fully inside the scene tree. Use this for setup.
- `_process(delta)`: Called every frame. Use for visual updates.
- `_physics_process(delta)`: Called at a fixed rate. Use for movement and collisions.

### Node Access
Use the `$` shorthand to get a child node.
`$Sprite2D.play()` is equivalent to `get_node("Sprite2D").play()`.

### Example: Simple Interaction
```gdscript
extends CharacterBody2D

@export var speed = 300.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	move_and_slide()
```
