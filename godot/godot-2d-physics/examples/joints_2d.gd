extends Node2D
## Connecting two RigidBody2D bodies with a joint at runtime.

func _ready() -> void:
	var body_a := RigidBody2D.new()
	var body_b := RigidBody2D.new()

	body_a.position = Vector2(-50, 0)
	body_b.position = Vector2(50, 0)
	add_child(body_a)
	add_child(body_b)

	# PinJoint2D keeps both bodies at a fixed point (great for chains).
	var pin := PinJoint2D.new()
	pin.position = Vector2(0, 0)
	pin.node_a = body_a.get_path()
	pin.node_b = body_b.get_path()
	add_child(pin)
