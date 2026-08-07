# OS Singleton
The bridge between Godot and the underlying operating system.

### Key Functions
- `OS.get_name()`: Identifies the current OS (e.g., "Windows", "Android").
- `OS.get_executable_path()`: Returns the path to the running game binary.

### Example: Platform Check
```gdscript
func _ready():
	if OS.get_name() == "Windows":
		print("Running on Windows!")
```
