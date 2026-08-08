extends PathFollow2D
## Moves a child node along a Path2D curve at constant speed.

@export var speed := 100.0

func _process(delta: float) -> void:
	# progress is measured in pixels along the curve.
	progress += speed * delta

	# Or use progress_ratio for a 0.0..1.0 loop:
	# progress_ratio = fmod(progress_ratio + delta * 0.1, 1.0)
