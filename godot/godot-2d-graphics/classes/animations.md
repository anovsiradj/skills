# AnimatedSprite2D
For handling frame-based animations.

### Workflow
1. Add `AnimatedSprite2D` node.
2. Create a `New SpriteFrames` resource in the Inspector.
3. Add animations (e.g., "idle", "walk") and drag in frames.

### Control Methods
- `.play("animation_name")`: Starts the animation.
- `.stop()`: Pauses the animation.
- `.frame = n`: Sets the animation to a specific frame.

### Example: Contextual Animation
```gdscript
func update_animation(velocity):
	if velocity.length() == 0:
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = velocity.x < 0
```
