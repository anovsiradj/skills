# Resource vs Raw Files
Understanding how Godot stores data.

### Godot Native Formats
- `.tscn` (Text Scene) / `.tres` (Text Resource): Human-readable, perfect for Git.
- `.scn` (Binary Scene) / `.res` (Binary Resource): Faster to load, not human-readable.

### ResourceLoader vs FileAccess
- **`ResourceLoader`**: Use for imported assets (Textures, Scenes). Use `load()` or `preload()`.
- **`FileAccess`**: Use for raw data (Save games, `.txt`, `.json`).

### Example: Reading a Save Game
```gdscript
func load_save():
	var file = FileAccess.open("user://save.dat", FileAccess.MODE_READ)
	if file:
		var data = file.get_var()
		return data
	return null
```
