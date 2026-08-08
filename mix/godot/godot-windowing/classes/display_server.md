# DisplayServer
The primary tool for window and screen management in Godot 4.

### Key Functions
- `window_set_size(size: Vector2i)`: Changes the window dimensions.
- `window_set_mode(mode: WindowMode)`: Switches between windowed, maximized, and fullscreen.
- `window_set_vsync_mode(mode: VSyncMode)`: Controls vertical synchronization.
- `window_get_position()` / `window_set_position()`: Manages window placement on the monitor.

### Example: Toggling Fullscreen
```gdscript
func toggle_fullscreen():
	var current_mode = DisplayServer.window_get_mode()
	if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
```
