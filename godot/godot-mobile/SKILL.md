---
name: godot-mobile
description: Godot Engine mobile platforms, virtual joysticks, touch screens, and in-app purchases.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Mobile

## Overview
Targeting Android/iOS: touch input, native plugins via `Engine.get_singleton()`, Android plugin architecture (v2), and the Mobile renderer.

## Key Version Differences (3.x vs 4.x)
- **Android plugins**: v2 architecture (`GodotPlugin` base class + `@UsedByGodot`), replacing deprecated `.gdap`-based v1 plugins.
- **Rendering**: use the **Mobile** renderer for mobile/VR; Compatibility for web.
- Touch input: `InputEventScreenTouch` / `InputEventScreenDrag`, or `TouchScreenButton` nodes.

## File Map
| File | Purpose |
|------|---------|
| [classes/plugins.md](classes/plugins.md) | Engine singleton plugin access |
| [tips/tips.md](tips/tips.md) | Naming, v2 architecture, testing |
| [usage/android_plugins.md](usage/android_plugins.md) | Native Android plugin setup |
| [examples/touch_input.gd](examples/touch_input.gd) | Touch events |
| [examples/native_plugin.gd](examples/native_plugin.gd) | Calling a native singleton |

## Quick Start
```gdscript
if Engine.has_singleton("MyCustomPlugin"):
	var plugin = Engine.get_singleton("MyCustomPlugin")
	plugin.do_something_native("Data from GDScript")
```
