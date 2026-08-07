---
name: godot-scripting
description: GDScript, C#, GDExtension, and general scripting patterns.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Scripting

## Key Insights
- **GDScript**: The primary, high-level interpreted language. Python-like syntax but optimized for Godot.
- **C#**: Full .NET 8 support. Best for performance-critical logic or developers coming from Unity.
- **GDExtension**: Low-level C++/Rust/etc. integration for maximum performance without recompiling the engine.

## Major Version Differences (3.x vs 4.x)
- **Static Typing**: Much stronger in GDScript 2.0 (Godot 4). Using types (`var x: int = 5`) provides better performance and autocomplete.
- **Await/Signal**: `yield` was replaced by `await` in Godot 4, making asynchronous code much easier to read.
- **Callable**: Introduced the `Callable` type for passing functions as arguments.

## Weird/Unusual Things
- **Cross-Language**: You can have a C# script and a GDScript in the same scene, and they can talk to each other via signals.
- **Nodes as Objects**: Everything is a Node, and scripts extend these nodes.

## Recommendations
- **Typing**: Always use static typing in GDScript for better performance and fewer bugs.
- **Performance**: Use GDScript for game logic and GDExtension for heavy math/algorithms.

## Prohibitions
- Do not use C# if you are targeting the Web platform (currently unsupported in Godot 4).

## ELI5: Signals
Imagine you have a "Door" and a "Button". Instead of the Button constantly asking the Door "Can I open you now?", the Button just shouts, "I HAVE BEEN PRESSED!" to everyone in the room. The Door is listening for that specific shout, and when it hears it, it opens. This is called a "Signal."

### Example: Signal and Await
```gdscript
# In Button.gd
signal button_pressed

func _on_touch():
	button_pressed.emit()

# In Door.gd
func _ready():
	# Wait for the button to be pressed
	await get_node("Button").button_pressed
	open_door()

func open_door():
	print("Door opened!")
```

