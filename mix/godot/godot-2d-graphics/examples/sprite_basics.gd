extends Sprite2D
## Static and animated sprite usage in Godot 4.

@export var flip_horizontally: bool = false:
	set(value):
		flip_horizontally = value
		flip_h = value

@export var flip_vertically: bool = false:
	set(value):
		flip_vertically = value
		flip_v = value

@export var tint: Color = Color.WHITE:
	set(value):
		tint = value
		modulate = value

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# AnimatedSprite2D needs a SpriteFrames resource (create it in the
	# inspector: New SpriteFrames, then add animations and frames).
	if animated_sprite.sprite_frames:
		animated_sprite.play("walk")
		animated_sprite.speed_scale = 1.5
