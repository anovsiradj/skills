extends AnimationTree
## Blend between walk and run with a parameter.
## Requires: AnimationTree with a blend tree containing Walk/Run nodes and a
## float parameter named "blend", plus an AnimationPlayer child.

func _physics_process(delta: float) -> void:
	var speed := Input.get_axis("ui_left", "ui_right")
	set("parameters/blend", absf(speed))

# Alternatively, a state machine parameter:
# set("parameters/state_machine/transition_request", "jump")
