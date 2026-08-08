---
name: godot-xr
description: Godot Engine XR support (AR and VR).
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# XR Support

## Overview
Building AR/VR with the XR system: `XROrigin3D`/`XRCamera3D`/`XRController3D` nodes, the `XRServer` singleton for interface discovery, and OpenXR initialization.

## Key Version Differences (3.x vs 4.x)
- `ARVRServer`/`ARVRInterface` → `XRServer`/`XRInterface`.
- Initialize with `XRServer.find_interface("OpenXR")` + `XRInterface.initialize()`.
- Disable V-Sync to prevent motion sickness; match `Engine.physics_ticks_per_second` to the headset refresh rate.

## File Map
| File | Purpose |
|------|---------|
| [classes/core_nodes.md](classes/core_nodes.md) | XROrigin3D, XRCamera3D, controllers |
| [tips/tips.md](tips/tips.md) | V-Sync, physics tick rate, stereo |
| [usage/setup.md](usage/setup.md) | Project setup + init script |
| [examples/openxr_init.gd](examples/openxr_init.gd) | Initializing OpenXR |

## Quick Start
```gdscript
var xr_interface := XRServer.find_interface("OpenXR")
if xr_interface and xr_interface.initialize():
	get_viewport().use_xr = true
```
