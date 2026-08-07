---
name: godot-animation
description: Godot Engine animation system, AnimationPlayer, Tweening, and IK.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Animation

## Key Insights
- **AnimationPlayer**: The powerhouse. Can animate ANY property of ANY node (position, color, volume, etc.).
- **Tweens**: Great for simple, code-driven animations (e.g., "fade out over 0.5 seconds").
- **Bézier Curves**: Allow for smooth, natural movement instead of linear paths.

## Major Version Differences (3.x vs 4.x)
- **Tween API**: Godot 4 completely replaced the `Tween` node with a "Tween Object" created via code (`create_tween()`), which is much more flexible and memory-efficient.

## Weird/Unusual Things
- **Method Tracks**: You can call any function in your script directly from an animation track.
- **Audio Tracks**: You can sync sound effects perfectly with an animation.

## Recommendations
- **Complex Sequences**: Use `AnimationPlayer` for cutscenes and character states.
- **UI/Simple FX**: Use `Tweens` for UI transitions and juice.
- **Interpolation**: Use "Cubic" or "Bézier" instead of "Linear" for a more professional, organic feel.

## Prohibitions
- Do not use `AnimationPlayer` for things that need to be extremely dynamic (like a character following a mouse); use code or Tweens for that.

## ELI5: Tweens vs AnimationPlayer
`AnimationPlayer` is like a **Movie**. You decide exactly what happens at second 1, second 2, and second 3. You record it once, and it plays back the same way every time.
A `Tween` is like a **Rubber Band**. You tell the object, "I don't care how you do it, just stretch from here to there over 1 second." It's calculated on the fly.

### Example: Creating a Fade-out Tween
```gdscript
func fade_out():
	var tween = create_tween()
	# Move the opacity from 1.0 to 0.0 over 1 second
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	# Call a function when the animation finishes
	tween.finished.connect(_on_fade_finished)

func _on_fade_finished():
	queue_free()
```

