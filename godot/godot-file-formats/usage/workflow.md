# File System Workflow
Managing assets and save data.

### Storage Paths
- `res://`: Read-only in exported games. Used for game assets.
- `user://`: Read/Write. Used for save games, config files, and logs.

### Importing Assets
When you drop a file into Godot:
1. A `.import` file is created to store settings.
2. Godot converts the file into a binary format in `.godot/imported/`.
3. When you call `load()`, Godot looks at the `.import` file to find the binary version.
