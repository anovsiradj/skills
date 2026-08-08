extends Node2D
## 2D lighting with shadow occluders (Godot 4).

func _ready() -> void:
	# A point light: needs a radial gradient texture, plus shadows enabled.
	var light := PointLight2D.new()
	light.texture = load("res://assets/light.png")
	light.energy = 1.0
	light.color = Color.YELLOW
	light.shadow_enabled = true
	light.position = Vector2(100, 100)
	add_child(light)

	# An occluder defines where shadows are cast.
	var occluder := LightOccluder2D.new()
	var polygon := OccluderPolygon2D.new()
	polygon.polygon = PackedVector2Array([
		Vector2(-50, -50),
		Vector2(50, -50),
		Vector2(50, 50),
		Vector2(-50, 50),
	])
	occluder.occluder = polygon
	occluder.position = Vector2(200, 200)
	add_child(occluder)
