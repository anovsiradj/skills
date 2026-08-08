extends Node3D
## Initializing OpenXR and entering VR.

func _ready() -> void:
	var xr_interface := XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.initialize():
		# Match physics to the headset refresh rate and disable vsync
		# to prevent motion sickness.
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		Engine.physics_ticks_per_second = 90
		get_viewport().use_xr = true
	else:
		push_warning("OpenXR not available — running in desktop fallback mode")
