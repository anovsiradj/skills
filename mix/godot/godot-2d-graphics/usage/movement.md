# 2D Movement Workflow
Standard way to move 2D objects, frame-rate independent and with editor-friendly exports.

### Basic Logic
1. Get input direction with `Input.get_axis()`.
2. Normalize the vector to prevent faster diagonal movement.
3. Multiply by speed and `delta`.
4. Update position (or use `move_and_slide()` on a `CharacterBody2D`).

### Example: Frame-Independent Movement
```gdscript
extends Node2D

@export var speed: float = 300.0

func _process(delta: float) -> void:
	var input_dir := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()

	position += input_dir * speed * delta
```

### Example: Grouped Movement Settings
```gdscript
extends CharacterBody2D

@export_group("Movement")
@export var speed: float = 300.0
@export var acceleration: float = 10.0
@export var friction: float = 10.0

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * speed, acceleration * speed * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * speed * delta)

	move_and_slide()
```
