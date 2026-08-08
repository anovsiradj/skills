# File System Gotchas

### The Export Trap
**Critical Warning**: Never use `FileAccess` to load a resource from `res://` in a production build.
- **Why?** In exported games, `res://` is packed into a `.pck` file. `FileAccess` looks for a real folder on the hard drive, which doesn't exist.
- **Fix**: Always use `ResourceLoader` (or `load()`) for assets.

### Git Guidelines
- **Commit**: `.tscn`, `.tres`, and `.import` files.
- **Ignore**: The `.godot/` folder.

### Pathing
Always use `res://` or `user://` prefixes. Never use absolute paths like `C:/Games/...` as they will fail on other users' computers.
