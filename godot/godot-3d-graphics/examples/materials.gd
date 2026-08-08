extends MeshInstance3D
## Creating PBR materials in code.

func _ready() -> void:
	# Metal: high metallic, near-zero roughness.
	var metal := StandardMaterial3D.new()
	metal.albedo_color = Color.WHITE
	metal.metallic = 1.0
	metal.roughness = 0.1

	# Glass: alpha transparency + refraction.
	var glass := StandardMaterial3D.new()
	glass.albedo_color = Color(0.8, 0.9, 1.0, 0.4)
	glass.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	glass.refraction_enabled = true
	glass.refraction_scale = 0.05

	# Swap material on a child mesh.
	var mesh_instance := MeshInstance3D.new()
	mesh_instance.mesh = SphereMesh.new()
	mesh_instance.material_override = glass
	add_child(mesh_instance)
