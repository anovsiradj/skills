extends RigidBody3D
## Physics-driven body: use forces/impulses, never set position directly.

@export var throw_force := 10.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		apply_impulse(-global_transform.basis.z * throw_force)

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	# Optional: read state.linear_velocity for custom physics each tick.
	if state.linear_velocity.length() > 20.0:
		state.linear_velocity = state.linear_velocity.normalized() * 20.0
