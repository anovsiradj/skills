# GDScript Lifecycle
Understanding when your code actually runs.

### Core Functions
- `_init()`: Called when the object is first created in memory. Use for initial setup that doesn't require nodes.
- `_ready()`: Called when the node and its children are fully inside the scene tree. Use for setup that requires nodes.
- `_process(delta)`: Called every frame. Use for visual updates and frame-dependent logic.
- `_physics_process(delta)`: Called at a fixed rate (default 60 Hz). Use for movement and collision handling.
- `_exit_tree()`: Called when the node leaves the scene tree. Use for cleanup.

### `@onready` for Node Access
`@onready` guarantees the variable is set before `_ready()` runs, avoiding null references.

```gdscript
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite.visible = true
```

### Node Access
Use the `$` shorthand to get a child node.
`$Sprite2D.play()` is equivalent to `get_node("Sprite2D").play()`.

### Example: Simple Player with Lifecycle
```gdscript
extends CharacterBody2D

@export var speed := 300.0

@onready var sprite: Sprite2D = $Sprite2D

func _init() -> void:
	print("Object created")

func _ready() -> void:
	print("Entered scene tree")
	sprite.play("idle")

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	move_and_slide()
```
