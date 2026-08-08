extends Node3D
## Configuring WorldEnvironment at runtime.

func _ready() -> void:
	var env := Environment.new()
	env.background_mode = Environment.BG_SKY
	env.sky = Sky.new()
	env.sky.sky_material = ProceduralSkyMaterial.new()

	# Glow: bright areas bleed light.
	env.glow_enabled = true
	env.glow_intensity = 1.0

	# Tonemapping: ACES for a cinematic look.
	env.tonemap_mode = Environment.TONE_MAPPER_ACES

	var we := WorldEnvironment.new()
	we.environment = env
	add_child(we)
