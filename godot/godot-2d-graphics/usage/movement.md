# 2D Movement Workflow
Standard way to move 2D objects with support for `@export` and `@export_range`.

### Basic Logic
1. Get input direction.
2. Normalize the vector to prevent fast diagonal movement.
3. Use `@export_range` to control speed for better editor usability.
4. Update position.

### Example: Frame-Independent Movement with `@export_range`
```gdscript
@export var speed: float = 300.0
@export_range(0.0, 10.0) var max_speed: float = 3.0

func _process(delta):
    var input_dir = Vector2.ZERO
    input_dir.x = Input.get_axis("move_left", "move_right")
    input_dir.y = Input.get_axis("move_up", "move_down")
    
    if input_dir != Vector2.ZERO:
        input_dir = input_dir.normalized()
    
    velocity = input_dir * speed * max_speed
    move_and_slide()
```

### Basic Logic
1. Get input direction.
2. Normalize the vector (to prevent fast diagonal movement).
3. Multiply by speed and delta.
4. Update position.

### Example: Frame-Independent Movement with `@export_range`
```gdscript
@export var speed: float = 300.0
@export_range(0.0, 10.0) var max_speed: float = 3.0

func _process(delta):
    var input_dir = Vector2.ZERO
    input_dir.x = Input.get_axis("move_left", "move_right")
    input_dir.y = Input.get_axis("move_up", "move_down")
    
    if input_dir != Vector2.ZERO:
        input_dir = input_dir.normalized()
    
    velocity = input_dir * speed * max_speed
    move_and_slide()
```

### Example: Using `@export_group` for Movement Settings
```gdscript
@export_group("Movement Settings")
@export var speed: float = 300.0
@export_range(0.0, 10.0) var max_speed: float = 3.0
@export var acceleration: float = 10.0

func _physics_process(delta):
    var input_dir = Vector2.ZERO
    input_dir.x = Input.get_axis("move_left", "move_right")
    input_dir.y = Input.get_axis("move_up", "move_down")
    
    if input_dir != Vector2.ZERO:
        velocity = input_dir * speed * max_speed
        velocity = velocity.lerp(velocity, Vector2.ZERO, acceleration * delta)
    
    move_and_slide()
```
