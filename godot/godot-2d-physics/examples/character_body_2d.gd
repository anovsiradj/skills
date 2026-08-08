extends CharacterBody2D
## Standard platformer controller using move_and_slide() (Godot 4).

const SPEED := 300.0
const JUMP_VELOCITY := -400.0

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# Gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump (ui_accept = Space/Enter by default).
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Horizontal movement.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

	move_and_slide()
