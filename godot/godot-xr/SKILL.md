---
name: godot-xr
description: Godot Engine XR (VR/AR) support and OpenXR integration.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# XR (VR & AR)

## Key Insights
- **OpenXR Standard**: Godot uses the OpenXR standard, ensuring compatibility with most modern headsets (Valve Index, Quest, etc.).
- **Standalone VR**: Support for Android-based headsets (Meta Quest) via plugins.
- **visionOS**: Limited support for Apple's visionOS (mostly flat plane applications).

## Major Version Differences (3.x vs 4.x)
- **OpenXR Native**: Godot 4 shifted fully to OpenXR, moving away from the older, fragmented VR plugins.

## Weird/Unusual Things
- **XR Plugins**: While OpenXR is the core, some specific headset features still require vendor-specific plugins.

## Recommendations
- **Input**: Use the `XRController3D` node to handle tracking and buttons for hands.
- **Comfort**: Always implement teleportation or "snap turning" to prevent motion sickness for users.
- **Performance**: Keep draw calls low; VR requires rendering the scene twice (once for each eye), which is very demanding.

## Prohibitions
- Do not use standard `Camera3D` for the player's head; use `XROrigin3D` and `XRCamera3D`.

## ELI5: OpenXR
Imagine if every brand of lightbulb had its own special socket. You'd need a different lamp for every brand. OpenXR is like a "Universal Socket." As long as the headset and the game both use this universal socket, they will work together, no matter who made them.

### Example: Basic XR Setup
1. Add an `XROrigin3D` node.
2. Add an `XRCamera3D` as a child of the origin.
3. Add two `XRController3D` nodes as children for the left and right hands.
4. In `_ready()`, initialize the OpenXR interface:
```gdscript
var xr_interface = XRServer.find_interface("OpenXR")
if xr_interface and xr_interface.is_initialized():
	get_viewport().use_xr = true
```

