# Window Workflow
Managing resolution and display modes.

### Resolution Handling
Combine `DisplayServer` calls with project settings:
1. Go to `Project Settings` -> `Display` -> `Window`.
2. Set `Viewport Width/Height` for your base resolution.
3. Use `Stretch Mode: canvas_items` and `Aspect: keep` to handle different monitor sizes.

### Fullscreen Transitions
Always use `DisplayServer` for mode changes in Godot 4.
```gdscript
# Maximize window
DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
```
