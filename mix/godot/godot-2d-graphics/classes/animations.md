# AnimatedSprite2D
For handling frame-based animations with support for advanced features like `@export_enum` and `@export_group`.

### Workflow
1. Add `AnimatedSprite2D` node.
2. Create a `SpriteFrames` resource in the Inspector.
3. Add animations (e.g., "idle", "walk") and drag in frames.
4. Use `@export_enum` to expose animation states in the editor.

### Example: Using `@export_enum` for Animation States
```gdscript
@export_enum("Idle", "Walk", "Run", "Jump") var current_animation: String = "Idle"

func _ready():
    $AnimatedSprite2D.play(current_animation)
```

### Workflow
1. Add `AnimatedSprite2D` node.
2. Create a `New SpriteFrames` resource in the Inspector.
3. Add animations (e.g., "idle", "walk") and drag in frames.

### Control Methods
- `.play("animation_name")`: Starts the animation.
- `.stop()`: Pauses the animation.
- `.frame = n`: Sets the animation to a specific frame.
- **Annotations**: Use `@export` and `@export_enum` for editor-friendly control.

### Example: Using `@export_group` for Animation Control
```gdscript
@export_group("Animation Control")
@export_enum("Idle", "Walk", "Run", "Jump") var current_animation: String = "Idle"
@export var animation_speed: float = 1.0

func _ready():
    $AnimatedSprite2D.play(current_animation)
    $AnimatedSprite2D.animation_speed = animation_speed
```

### Example: Contextual Animation with `@export`
```gdscript
@export var animation_speed: float = 1.0
@export_enum("Idle", "Walk", "Run", "Jump") var current_animation: String = "Idle"

func update_animation(velocity):
    if velocity.length() == 0:
        $AnimatedSprite2D.play("idle")
    else:
        $AnimatedSprite2D.play("walk")
        $AnimatedSprite2D.flip_h = velocity.x < 0
        $AnimatedSprite2D.animation_speed = animation_speed
```
