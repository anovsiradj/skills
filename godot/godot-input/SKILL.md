---
name: godot-input
description: Godot Engine input mapping, device support, and event handling.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Input

## Key Insights
- **Input Mapping**: Instead of checking for "Key W", check for an action like "move_forward". This allows users to remap keys.
- **Universal Control**: Use the same action system for keyboards, gamepads, and touch.
- **Physical Keys**: "Physical" mapping allows the game to work regardless of the keyboard layout (QWERTY vs AZERTY).

## Major Version Differences (3.x vs 4.x)
- **Enhanced Gamepad Support**: Better native handling of modern controllers and motion sensors.

## Weird/Unusual Things
- **Mouse Capture**: The mouse can be "captured" (hidden and locked), which is essential for First Person Shooters.
- **Raw Input**: On Windows/Linux, captured mouse input bypasses OS acceleration for precise aiming.

## Recommendations
- **Always use Input Map**: Never hardcode `KEY_W` in your scripts. Use `Input.is_action_pressed("ui_up")`.
- **Deadzones**: Configure gamepad deadzones in the Input Map to prevent "drift".

## Prohibitions
- Do not check for input in `_process` if you are doing physics-related movement; use `_physics_process`.

## ELI5: Input Mapping
Imagine you have a robot. Instead of telling it "When I press the button on the left side of my keyboard, move forward," you tell the robot "There is a command called 'WALK'. I'll tell you later which button triggers 'WALK'." 
Now, if you decide you want to use a controller, you just tell the robot "The 'A' button also triggers 'WALK'." The robot doesn't have to change how it walks; it just knows a new button triggers the same command.

### Example: Checking Input
```gdscript
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		jump()
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
```

