# Windowing Tips & Gotchas

### Version Difference (3.x vs 4.x)
Window management moved from the `OS` singleton to `DisplayServer`.
- **Old (3.x)**: `OS.set_window_fullscreen(true)`
- **New (4.x)**: `DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)`

### V-Sync Performance
If you notice input lag or are targeting XR/high-refresh monitors, disable V-Sync:
`DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)`
