extends Button
## Styling a control via theme overrides at runtime.

func _ready() -> void:
	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.2, 0.6, 1.0)
	style.corner_radius_top_left = 8
	style.corner_radius_top_right = 8
	style.corner_radius_bottom_left = 8
	style.corner_radius_bottom_right = 8

	add_theme_stylebox_override("normal", style)
	add_theme_color_override("font_color", Color.WHITE)
	add_theme_font_size_override("font_size", 20)
