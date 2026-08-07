---
name: godot-rendering
description: Godot Engine rendering backends, Forward+, Mobile, and Compatibility renderers.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Rendering

## Key Insights
- **Three Renderers**:
	- **Forward+**: High-end desktop (Vulkan/D3D12/Metal).
	- **Mobile**: Balanced for mobile/desktop (Vulkan/D3D12/Metal).
	- **Compatibility**: Low-end/Web (OpenGL).
- **Backend**: Forward+ and Mobile use `RenderingDevice` (compute-heavy), while Compatibility is more traditional.

## Major Version Differences (3.x vs 4.x)
- **Vulkan**: Godot 4 introduces Vulkan as the primary driver for Forward+ and Mobile, moving away from GLES3/GLES2.
- **Clustered Forward**: Forward+ uses clustered rendering, removing limits on the number of lights affecting a single mesh.

## Weird/Unusual Things
- **Automatic Selection**: Godot typically selects the renderer based on the platform, but this can be overridden.
- **Web Renderer**: The Web platform uses the Compatibility renderer by default.

## Recommendations
- **Targeting Web/Old PC**: Always use the Compatibility renderer.
- **High Fidelity**: Stick to Forward+ for desktop to leverage advanced lighting and compute shaders.

## Prohibitions
- Do not use Forward+ features (like certain compute-heavy effects) when targeting the Compatibility renderer.

## ELI5: Renderers
Imagine you have three different artists to draw your game:
1. **The Master (Forward+)**: Uses the most expensive paints and takes the most time, but the result is a masterpiece.
2. **The Pro (Mobile)**: Uses good paints and is very fast, but skips some tiny details.
3. **The Student (Compatibility)**: Uses basic crayons. It's not as pretty, but every single person in the world has a piece of paper they can use to see it.

### Example: Changing Renderer
Go to `Project Settings` -> `Rendering` -> `Renderer` and select your target.

