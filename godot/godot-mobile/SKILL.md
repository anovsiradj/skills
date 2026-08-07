---
name: godot-mobile
description: Godot Engine mobile development, touch input, and platform integration.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Mobile

## Key Insights
- **Touch Input**: Use `TouchScreenButton` and `VirtualJoystick` for intuitive mobile controls.
- **Monetization**: Support for In-App Purchases (IAP) on Android and iOS via plugins.
- **Android Specifics**: Supports picture-in-picture mode.

## Major Version Differences (3.x vs 4.x)
- **C# Support**: C# support for Android and iOS is available from 4.2 but is still considered experimental.
- **Performance**: Vulkan-based renderers (Mobile) provide better performance on modern devices compared to GLES3.

## Weird/Unusual Things
- **Virtual Joysticks**: Godot doesn't have a "one-click" joystick node; it's typically implemented as a combination of `Control` nodes and input handling.

## Recommendations
- **Input**: Always provide a "Touch" version of your controls. Use `TouchScreenButton` for simple actions.
- **Rendering**: Use the "Mobile" renderer for a good balance of fidelity and battery life.
- **Testing**: Test on real hardware early, as emulators don't accurately represent touch latency or thermal throttling.

## Prohibitions
- Do not use C# for the Web platform; use GDScript.

## ELI5: Virtual Joysticks
Imagine your phone screen is a piece of glass with a invisible circle drawn on it. When you put your thumb on the circle and move it, the game doesn't see "thumb moving," it sees "the distance from the center of the circle." It uses that distance to decide if your character should walk slowly or run.

### Example: Simple Touch Event
```gdscript
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			print("Screen touched at: ", event.position)
		else:
			print("Finger lifted!")
	
	if event is InputEventScreenDrag:
		print("Finger dragging at: ", event.relative)
```

