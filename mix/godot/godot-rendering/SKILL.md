---
name: godot-rendering
description: Godot Engine rendering, renderers, and post-processing.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Rendering

## Overview
The rendering pipeline: renderer selection (Forward+ / Mobile / Compatibility), `WorldEnvironment` for sky/fog/tonemapping/glow, and low-level access via the `RenderingServer`.

## Key Version Differences (3.x vs 4.x)
- **Three renderers**: Forward+ (desktop default, Vulkan), Mobile (mobile/VR), Compatibility (web/old GPUs, OpenGL).
- **GI**: `LightmapGI` (baked), `VoxelGI`, `SDFGI` (Forward+ only) replace `GIProbe`/`BakedLightmap`.
- `RenderingServer` API reorganized; `canvas_item_add_rect()` etc. take an item `RID`.
- Volumetric fog, SSR/SSIL are Forward+ features; not available in Compatibility.

## File Map
| File | Purpose |
|------|---------|
| [classes/rendering_server.md](classes/rendering_server.md) | Low-level drawing |
| [tips/choice_matrix.md](tips/choice_matrix.md) | Renderer comparison |
| [usage/environment.md](usage/environment.md) | WorldEnvironment |
| [examples/rendering_server.gd](examples/rendering_server.gd) | Direct canvas drawing |
| [examples/environment_setup.gd](examples/environment_setup.gd) | WorldEnvironment from code |

## Quick Start
```gdscript
# Renderer is chosen in Project Settings > Rendering > Renderer.
# Forward+ (default), Mobile, or Compatibility.
```
