extends Node2D
## One-shot sound effects with pitch variation.

@onready var sfx: AudioStreamPlayer = $Sfx

func play_footstep() -> void:
	sfx.pitch_scale = randf_range(0.9, 1.1)
	sfx.play()
