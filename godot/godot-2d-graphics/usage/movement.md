# 2D Movement Workflow
Standard way to move 2D objects.

### Basic Logic
1. Get input direction.
2. Normalize the vector (to prevent fast diagonal movement).
3. Multiply by speed and delta.
4. Update position.

### Example: Frame-Independent Movement
```gdscript
@export var speed = 300.0

func _process(delta):
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir.y = Input.get_axis("move_up", "move_down")
	
	# Crucial: Normalize for diagonal speed consistency
	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()
	
	position += input_dir * speed * delta
```
