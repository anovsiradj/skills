---
name: godot-2d-graphics
description: Godot Engine 2D graphics, sprites, lighting, and font rendering.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Graphics

## Key Insights
- **Hybrid Tools**: Support for both basic sprites and complex polygons/lines.
- **Advanced Lighting**: 2D lighting supports normal maps, specular maps, and SDF (Signed Distance Fields) for global illumination.
- **Font Tech**: MSDF (Multi-channel Signed Distance Field) fonts allow scaling without losing sharpness.

## Major Version Differences (3.x vs 4.x)
- **SDFs**: Godot 4 introduces SDFs for 2D lighting, allowing for much more realistic light occlusion and shadows.
- **Font Rendering**: Significant upgrades to font handling, including better support for variable fonts and ligatures.

## Weird/Unusual Things
- **DPITexture**: Uses oversampling for SVGs to keep them sharp when scaling at runtime.
- **2D HDR**: Optional HDR rendering for better glow/bloom effects in 2D.

## Recommendations
- **Sharp Text**: Use MSDF fonts for any text that will be scaled dynamically.
- **Lighting**: Use `LightOccluder2D` to define where shadows should be cast.

## Prohibitions
- Do not use huge SVG files without considering the performance cost of runtime re-rasterization.

## ELI5: MSDF Fonts
Normally, when you zoom in on a letter, it gets "blocky" (like LEGOs). MSDF is like a magic trick where the computer doesn't store the letter as a picture of dots, but as a "map of distances" to the edge of the letter. No matter how much you zoom in, the computer just follows the map to draw a perfectly smooth line.

### Example: 2D Light Setup
1. Add a `PointLight2D` node.
2. Assign a texture to the light.
3. Add a `LightOccluder2D` to a wall node and draw a polygon around the wall.
4. The light will now cast a shadow behind the wall.

