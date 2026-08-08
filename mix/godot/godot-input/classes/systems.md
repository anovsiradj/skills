# Input Systems
How to handle player input.

### Input (Singleton)
Best for "Polling" (checking every frame).
- `Input.is_action_pressed("action")`: True while held.
- `Input.is_action_just_pressed("action")`: True only on first press.
- `Input.get_axis("left", "right")`: Returns a float from -1.0 to 1.0.

### InputEvent
Best for "Events" (single occurrences).
- `InputEventKey`: Keyboard press.
- `InputEventMouseButton`: Mouse click.
- `InputEventMouseMotion`: Mouse movement.

### Example: Polling vs Event
```gdscript
func _process(delta):
	# POLLING: Constant movement
	if Input.is_action_pressed("move_right"):
		velocity.x = speed

func _unhandled_input(event):
	# EVENT: One-time action
	if event.is_action_pressed("jump"):
		jump()
```
