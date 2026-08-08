extends MultiMeshInstance3D
## Render thousands of instances with one draw call.

func _ready() -> void:
	multimesh = MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	multimesh.mesh = BoxMesh.new()

	const COUNT := 10000
	multimesh.instance_count = COUNT

	# Place each instance with a random transform.
	for i in COUNT:
		var t := Transform3D()
		t.origin = Vector3(
			randf_range(-50, 50),
			randf_range(0, 10),
			randf_range(-50, 50)
		)
		multimesh.set_instance_transform(i, t)
