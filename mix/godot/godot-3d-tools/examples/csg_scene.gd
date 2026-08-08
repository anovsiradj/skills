extends Node3D
## Building CSG geometry in code (prototyping only — bake before shipping).

func _ready() -> void:
	# Wall with a door carved out.
	var wall := CSGBox3D.new()
	wall.size = Vector3(10, 3, 0.5)
	wall.position.y = 1.5
	add_child(wall)

	var door := CSGBox3D.new()
	door.size = Vector3(1.2, 2.2, 0.6)
	door.position = Vector3(0, 1.1, 0)
	door.operation = CSGShape3D.OPERATION_SUBTRACTION
	wall.add_child(door)
