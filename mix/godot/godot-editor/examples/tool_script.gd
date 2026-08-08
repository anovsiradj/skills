@tool
extends Node2D
## @tool scripts run inside the editor — great for gizmos and previews.
## Note: _draw() only works on CanvasItem types (Node2D/Control).

@export var preview_radius := 1.0:
	set(value):
		preview_radius = value
		if Engine.is_editor_hint():
			queue_redraw()

func _draw() -> void:
	# Draw a preview circle only in the editor, not in the running game.
	if Engine.is_editor_hint():
		draw_circle(Vector2.ZERO, preview_radius, Color(1, 0, 0, 0.5))
