# Keyframing Workflow
How to animate properties in the editor.

### Steps
1. Open `AnimationPlayer`.
2. Select a property in the Inspector (e.g., `position` or `modulate`).
3. Click the **Key Icon** next to the property.
4. Move the timeline playhead, change the property, and key it again.
5. Use **Markers** to divide long animations into usable sections.

### Scripted Animations (Tweens)
For simple, one-off transitions, use `create_tween()`.
```gdscript
func fade_out():
	var tween = create_tween()
	# Interpolate modulate:a from current to 0 over 1 second
	tween.tween_property(self, "modulate:a", 0.0, 1.0)
	tween.finished.connect(queue_free)
```
