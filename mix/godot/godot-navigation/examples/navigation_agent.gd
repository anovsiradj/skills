extends CharacterBody2D
## Steering a character toward a target using NavigationAgent2D.

@export var speed := 200.0

@onready var agent: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	# NavMesh syncs at end of frame — defer initial target.
	agent.target_position = global_position
	call_deferred("set_target", Vector2(300, 200))

func set_target(pos: Vector2) -> void:
	agent.target_position = pos

func _physics_process(delta: float) -> void:
	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return

	var next := agent.get_next_path_position()
	velocity = global_position.direction_to(next) * speed
	move_and_slide()
