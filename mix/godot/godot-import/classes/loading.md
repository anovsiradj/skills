# Resource Loading
How Godot handles external assets.

### Key Classes
- `ResourceLoader`: The engine's way of bringing assets from disk into memory.
- `FileAccess`: Used for raw file I/O (Reading/Writing).

### Critical Pattern: Loading vs Preloading
- `load("path")`: Loads the resource when the line is executed. Use for assets that change or are loaded during gameplay.
- `preload("path")`: Loads the resource when the script is first loaded. Use for essential assets to avoid "lag spikes" during gameplay.

### Example: Loading a Texture
```gdscript
# Preload for performance
var player_texture = preload("res://assets/player.png")

func change_skin(path):
	# Load dynamically
	var new_skin = load(path)
	$Sprite2D.texture = new_skin
```
