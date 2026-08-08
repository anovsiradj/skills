extends Node2D
## One-off scripted transitions with Tweens (no AnimationPlayer needed).

func _ready() -> void:
	# Fade out then free: uses modulate:a shorthand.
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	tween.finished.connect(queue_free)

func bounce() -> void:
	var t := create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	t.tween_property(self, "position:y", position.y - 50.0, 0.8)
