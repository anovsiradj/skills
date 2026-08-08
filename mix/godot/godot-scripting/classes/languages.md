# Scripting Languages
Godot supports multiple languages based on your needs.

### GDScript
- **Type**: High-level, interpreted.
- **Best For**: Gameplay logic, UI, quick prototyping, and editor scripts.
- **Pros**: Deep integration, fast iteration, easy to learn, and strong static typing support in Godot 4.
- **Features**:
  - **Static Typing**: Use `var x: int = 5` for better performance and autocomplete.
  - **Annotations**: `@export`, `@rpc`, `@tool`, `@onready`, and more for editor-friendly properties.
  - **Signals**: Use `await` for asynchronous code with signals.
  - **Callable**: Pass functions as arguments using the `Callable` type.

### Example: Using Static Typing
```gdscript
var player_name: String = "Hero"
var player_health: int = 100
var player_coins: Array[int] = [10, 20, 30]
```

### C# (.NET)
- **Type**: Compiled.
- **Best For**: Performance-critical systems, developers from Unity.
- **Pros**: Strong typing, huge library ecosystem.
- **Warning**: Web export support is limited/experimental in Godot 4.

### GDExtension
- **Type**: Native (C++, Rust, etc.).
- **Best For**: Heavy algorithms (Pathfinding, Physics engines).
- **Pros**: Native speed without needing to recompile the whole engine.
