extends Label
## MSDF fonts stay sharp when scaled. Enable in code or via import options.

func _ready() -> void:
	var font := FontFile.new()
	var err := font.load_dynamic_font("res://assets/fonts/NotoSans-Regular.ttf")
	if err != OK:
		push_error("Failed to load font: %s" % err)
		return

	font.multichannel_signed_distance_field = true
	font.msdf_pixel_range = 16
	font.msdf_size = 48

	add_theme_font_override("font", font)
	add_theme_font_size_override("font_size", 32)
	text = "Sharp at any scale"
