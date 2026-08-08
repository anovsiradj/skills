# Sprite Basics
The core of 2D visuals in Godot, including static and animated sprites.

### Key Classes
- `Sprite2D`: The simplest way to display a texture.
- `AnimatedSprite2D`: For frame-by-frame animations from a `SpriteFrames` resource.

### Key Properties
- `texture`: The image file to display.
- `flip_h` / `flip_v`: Mirrors the image horizontally or vertically.
- `modulate`: Changes the color/opacity of the sprite.
- `region_enabled` / `region_rect`: Display only a portion of the texture (sprite sheet).

### Example: Configuring a Sprite from Script
```gdscript
extends Sprite2D

func _ready() -> void:
	texture = load("res://assets/player.png")
	flip_h = true
	modulate = Color(1.0, 0.5, 0.5) # Tint pink
```

### AnimatedSprite2D
- `sprite_frames`: The `SpriteFrames` resource holding all animations.
- `play("animation_name")` / `stop()`: Control playback.
- `frame`: Current frame index.
- `speed_scale`: Playback speed multiplier.

### Example: Playing an Animation
```gdscript
extends AnimatedSprite2D

func _ready() -> void:
	# Requires a SpriteFrames resource with a "walk" animation.
	play("walk")
```

### Editor Annotations
Use `@export` and `@export_group` to expose properties in the inspector:

```gdscript
@export_group("Sprite Settings")
@export var sprite_color: Color = Color.WHITE:
	set(value):
		sprite_color = value
		modulate = value

@export_group("Animation")
@export_enum("Idle", "Walk", "Run", "Jump") var animation_state: String = "Idle":
	set(value):
		animation_state = value
		if sprite_frames and sprite_frames.has_animation(value):
			play(value)
```
