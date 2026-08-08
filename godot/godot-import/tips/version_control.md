# Version Control Tips

### Commit These
- `.tscn`, `.tres`, and `.import` files — they store import settings (texture compression, etc.). If you delete them, every teammate will get different import settings.
- `project.godot`, export presets, and your `addons/` folder.

### Ignore These
- `.godot/` — massive and regenerated automatically by the engine on every machine.
- Editor-specific files (`.godot/editor/`, imported binaries under `.godot/imported/`).

### Reimporting
If you edit an asset in an external program (e.g. Photoshop), Godot detects the change via checksum and reimports automatically.
- Use `Project > Reimport` to force it.
- Keep `.import` sidecar files in version control so settings stay consistent.
