---
name: godot-file-formats
description: Godot Engine file formats, resource management, and I/O.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# File Formats

## Key Insights
- **Text vs Binary**: 
	- `.tscn` (Text): Human-readable, great for Git/Version Control.
	- `.scn` (Binary): Faster to load, smaller files.
- **Resource-Based**: Almost everything in Godot is a `Resource`. You can save a set of stats or a character's config as a `.tres` file and share it across many nodes.
- **PCK Files**: Game data is packed into a `.pck` file for distribution.

## Major Version Differences (3.x vs 4.x)
- **Resource Handling**: Improved efficiency in how resources are shared and cached in memory.

## Weird/Unusual Things
- **ConfigFile**: A built-in class for handling `.ini` style files, making it very easy to save user settings (volume, resolution) without writing a full JSON parser.

## Recommendations
- **Version Control**: Always use `.tscn` and `.tres` (text formats) so you can see exactly what changed in a Git commit.
- **Save Games**: Use `JSON` for simple save games or `ConfigFile` for settings.

## Prohibitions
- Do not save sensitive data (like passwords) in plain text `.tres` files; they are easy to read.

## ELI5: Resources (.tres)
Imagine you have 100 soldiers in your game. Instead of giving every single soldier their own copy of the "Soldier Stats" (Health: 100, Speed: 5), you write the stats once on a **piece of paper** (a Resource file). Then, you just give every soldier a **link** to that same piece of paper. If you change the health to 120 on the paper, all 100 soldiers are instantly updated!

### Example: Saving a Simple Config
```gdscript
func save_settings():
	var config = ConfigFile.new()
	config.set_value("Audio", "master_volume", 0.8)
	config.save("user://settings.cfg")

func load_settings():
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	if err == OK:
		var vol = config.get_value("Audio", "master_volume", 1.0)
		print("Volume is: ", vol)
```

