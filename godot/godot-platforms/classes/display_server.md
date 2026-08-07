# DisplayServer
`DisplayServer` manages the window and interaction with the OS display.

### Key Functions
- `DisplayServer.window_set_mode(mode)`: Sets the window mode (Windowed, Fullscreen, etc.).
- `DisplayServer.window_get_size()`: Gets the current size of the window.

### Example: Toggling Fullscreen
```gdscript
func toggle_fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
```
