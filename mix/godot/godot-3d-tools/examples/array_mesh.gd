extends MeshInstance3D
## Building a custom mesh at runtime with SurfaceTool.

func _ready() -> void:
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)

	# A single triangle.
	var verts := [Vector3(0, 0, 0), Vector3(1, 0, 0), Vector3(0, 1, 0)]
	for v in verts:
		st.add_vertex(v)

	st.generate_normals()
	mesh = st.commit()
