# Mobile Plugins
Extending Godot with native Android/iOS code.

### Key APIs
- `Engine.has_singleton(name)`: Checks if a native plugin is available.
- `Engine.get_singleton(name)`: Accesses the plugin's functions.

### Example: Using a Native Plugin
```gdscript
func access_native_feature():
	if Engine.has_singleton("MyCustomPlugin"):
		var plugin = Engine.get_singleton("MyCustomPlugin")
		plugin.do_something_native("Data from GDScript")
```
