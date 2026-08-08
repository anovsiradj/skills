extends CharacterBody2D
## Polling the Input singleton every physics frame.

func _physics_process(delta: float) -> void:
	# Held down: returns true every frame while pressed.
	var moving := Input.is_action_pressed("move_right")

	# Single press: true only on the frame the action starts.
	if Input.is_action_just_pressed("jump"):
		velocity.y = -300.0

	# Axis helpers: -1.0 .. 1.0 (see usage/input_map.md).
	velocity.x = Input.get_axis("move_left", "move_right") * 200.0
	velocity.y += 980.0 * delta
	move_and_slide()
