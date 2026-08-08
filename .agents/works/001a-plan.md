# Plan: Godot Skills Structure (Implemented 2026.08.07)

## Status: IMPLEMENTED

The 24 Godot skills were refactored from monolithic `SKILL.md` files into a lean, consistent structure.

## Final Structure (per skill)

```
godot/<skill>/
├── SKILL.md          # Lean index: frontmatter + real overview + version notes + file map
├── classes/          # Concise class references (one topic file each)
├── tips/             # Gotchas & best practices
├── usage/            # How-to workflows
└── examples/         # Standalone GDScript example files (.gd / .gdshader)
```

## What Changed

### 1. SKILL.md → lean index
- Removed 300–800 lines of templated filler per skill (repeated "Key Insights", empty "Unusual Things", boilerplate "Prohibitions").
- Each index now has: frontmatter (name, description, license, metadata.version/authors), a real Overview, accurate 3.x vs 4.x version notes, a File Map table, and a Quick Start snippet.
- Version bumped to `2026.08.07+03` on all skills.

### 2. examples/ directory (NEW)
- All GDScript moved out of SKILL.md into standalone files under `examples/`.
- All examples fixed against the official docs (cloned at `tmp/godot-docs.git/`):
  - Removed singleton misuse: `Input.new()`, `InputMap.new()`, `extends InputMap` → use `Input`/`InputMap` singletons directly.
  - Removed fake classes: `AnimationTrack`, `AnimationKey`, `EditorSceneTree`, `EditorAssets`, `AudioBus`, `SDFGI.new()`, `SSIL.new()`, `DynamicFont`, `PointLight2D` misuse, `ConvexPolygon2D` for occluders → `OccluderPolygon2D`.
  - Fixed `FontFile.load_dynamic_font()` + MSDF properties per `class_fontfile.rst`.
  - Fixed `TileMapLayer.set_cell(coords, source_id, atlas_coords)` per class reference.
  - Verified `ENetMultiplayerPeer.create_server/create_client`, `XRServer.find_interface`, `Node.create_tween`, `Input.get_axis` signatures.

### 3. Sub-file fixes
- `godot-scripting/tips/best_practices.md` + `usage/lifecycle.md`: removed non-existent annotations (`@export_var`, `@onready_var`, `@export_on_restart`, `@export_exp_easing`) and duplicate sections.
- `godot-2d-graphics/classes/sprites.md` + `usage/movement.md`: deduplicated, fixed invalid `velocity.lerp()` example.
- `godot-3d-graphics/classes/materials.md`: removed fake `ORMMaterial3D`; fixed transparency/refraction API.
- `godot-audio/tips/tips.md`: removed fake classes (`AudioBus`, `AudioStreamMP3`, etc.).
- `godot-3d-physics/tips/stability.md`: removed non-existent `PhysicsServer3D.space_set_continuous_collision_mode` etc.
- `godot-rendering/tips/choice_matrix.md`: fixed LaTeX `$\rightarrow$`, corrected renderer list (3 renderers, not "Vulkan/Metal/WebGL").
- `godot-import/tips/version_control.md`: removed repetitive filler.
- Removed LaTeX math (`$\\sim$`, `$\\rightarrow$`) that breaks plain-Markdown rendering.

## Validation
- All GDScript API calls verified against `tmp/godot-docs.git/classes/class_*.rst`.
- Frontmatter preserved (authors kept; version bumped).
