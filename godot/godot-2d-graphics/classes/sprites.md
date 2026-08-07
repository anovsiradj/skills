# Sprite Basics
The core of 2D visuals in Godot, including static and animated sprites.

### Key Classes
- `Sprite2D`: The simplest way to display a texture.
- `AnimatedSprite2D`: For frame-by-frame animations.
- **Annotations**: Use `@export` and `@export_enum` for editor-friendly properties.

### Example: Using `@export_group` for Sprite Properties
```gdscript
@export_group("Sprite Settings")
@export var sprite_color: Color = Color.WHITE
@export var flip_horizontally: bool = false
@export var flip_vertically: bool = false

@export_group("Animation")
@export_enum("Idle", "Walk", "Run", "Jump") var animation_state: String = "Idle"
```

### Key Classes
- `Sprite2D`: The simplest way to display a texture.
- `AnimatedSprite2D`: For frame-by-frame animations.

### Key Properties
- `texture`: The image file to display.
- `flip_h` / `flip_v`: Mirrors the image horizontally or vertically.
- `modulate`: Changes the color/opacity of the sprite.
- **Annotations**: Use `@export` to expose properties in the editor.

### Example: Using `@export` for Sprite Properties
```gdscript
@export var sprite_color: Color = Color.WHITE
@export var flip_horizontally: bool = false
@export var flip_vertically: bool = false

func _ready():
    $Sprite2D.modulate = sprite_color
    $Sprite2D.flip_h = flip_horizontally
    $Sprite2D.flip_v = flip_vertically
```

### Example: Simple Sprite Setup with Annotations
```gdscript
@export var sprite_color: Color = Color.WHITE
@export var flip_horizontally: bool = false
@export var flip_vertically: bool = false

func _ready():
    $Sprite2D.modulate = sprite_color
    $Sprite2D.flip_h = flip_horizontally
    $Sprite2D.flip_v = flip_vertically

# Example of using AnimatedSprite2D with @export_enum
@export_enum("Idle", "Walk", "Run", "Jump") var animation_state: String = "Idle"
```
