extends Node3D
## Setting up 3D lights from code.

func _ready() -> void:
	# Sun light: parallel rays, no position needed.
	var sun := DirectionalLight3D.new()
	sun.energy = 1.2
	sun.light_color = Color(1.0, 0.95, 0.9)
	sun.rotation_degrees = Vector3(-45, 30, 0)
	sun.shadow_enabled = true
	add_child(sun)

	# Point light: light bulb radiating in all directions.
	var bulb := OmniLight3D.new()
	bulb.energy = 2.0
	bulb.omni_range = 5.0
	bulb.position = Vector3(2, 3, 0)
	add_child(bulb)

	# Spot light: flashlight cone.
	var lamp := SpotLight3D.new()
	lamp.energy = 3.0
	lamp.spot_range = 10.0
	lamp.spot_angle = 30.0
	lamp.position = Vector3(0, 4, 2)
	add_child(lamp)
