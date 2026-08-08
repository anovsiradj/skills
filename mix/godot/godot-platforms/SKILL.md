---
name: godot-platforms
description: Godot Engine platforms, porting, and deployment.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Platforms

## Overview
Deploying to multiple platforms: export presets and templates, platform detection via `OS`, renderer constraints per platform, and platform-specific permissions.

## Key Version Differences (3.x vs 4.x)
- **Web**: only the **Compatibility** renderer works; Web editor is not for production.
- **Android/iOS**: permissions must be declared in the export preset or the app crashes on camera/mic use.
- Platform detection: `OS.get_name()` / `OS.has_feature()`.
- Window control moved from `OS` to `DisplayServer` (see godot-windowing).

## File Map
| File | Purpose |
|------|---------|
| [classes/display_server.md](classes/display_server.md) | DisplayServer basics |
| [classes/os.md](classes/os.md) | OS detection |
| [tips/gotchas.md](tips/gotchas.md) | Web/mobile/platform pitfalls |
| [usage/exporting.md](usage/exporting.md) | Export workflow |
| [examples/platform_check.gd](examples/platform_check.gd) | Feature detection |

## Quick Start
```gdscript
if OS.has_feature("web"):
	# Browser build: use Compatibility renderer.
	pass
```
