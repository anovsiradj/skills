# OS Interaction
The `OS` singleton is the main way to check which platform your game is currently running on.

### Key Functions
- `OS.get_name()`: Returns the platform name as a string (e.g., "Windows", "macOS", "Linux", "Android", "iOS", "Web").
- `OS.has_feature(feature)`: Checks if a specific feature is enabled. Use this for platform-specific logic.
    - Example: `OS.has_feature("android")` or `OS.has_feature("ios")`.

### Example: Platform Specific Logic
```gdscript
func _ready():
	if OS.has_feature("android"):
		print("Welcome Android user!")
	elif OS.has_feature("windows"):
		print("Welcome Windows user!")
```
