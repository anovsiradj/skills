# The Input Map
Using abstract actions instead of hardcoded keys.

### Setup
1. Go to `Project` -> `Project Settings` -> `Input Map`.
2. Add a new action (e.g., "jump").
3. Assign a key (e.g., "Space") and a gamepad button (e.g., "Joypad Button 0").

### Benefits
- **Remapping**: Let players change their keys in a menu.
- **Multi-Device**: Support Keyboard and Gamepad with the same code.

### Example: Using Input Map
```gdscript
func _physics_process(delta):
	# No matter if it's 'Space' or 'Gamepad A', this works:
	if Input.is_action_just_pressed("jump"):
		perform_jump()
```
