---
name: godot-3d-graphics
description: Godot Engine 3D graphics, PBR, lighting, and post-processing.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 3D Graphics

## Key Insights
- **PBR Workflow**: Follows the Disney PBR model (Roughness-Metallic).
- **Lighting**: Diverse range of lights (Directional, Omni, Spot, Area) with clustered forward optimizations in Forward+.
- **GI (Global Illumination)**: Multiple options depending on the scale:
	- `LightmapGI`: Baked, high quality, static.
	- `VoxelGI`: Dynamic, local area.
	- `SDFGI`: Dynamic, large open worlds.

## Major Version Differences (3.x vs 4.x)
- **SDFGI**: A massive addition to Godot 4 for real-time GI in open worlds without baking.
- **Vulkan Backend**: Significant visual jump over GLES3, allowing for better materials and lighting.

## Weird/Unusual Things
- **ORM Textures**: Godot uses a packed texture for Occlusion, Roughness, and Metallic in separate channels.
- **Volumetric Fog**: Fully integrated fog that interacts with lights and shadows.

## Recommendations
- **Open Worlds**: Use `SDFGI` for large environments.
- **Interior Rooms**: Use `VoxelGI` for better localized reflections and lighting.
- **Optimization**: Use "Distance Fade" to hide far-away lights/decals.

## Prohibitions
- Do not use `SDFGI` in very small, enclosed spaces where `VoxelGI` or Baked Lightmaps would be more accurate and performant.

## ELI5: Global Illumination (GI)
Normally, a light only hits the surface it's pointing at. But in real life, if you shine a flashlight on a red wall, the white floor next to it turns slightly red. That's "indirect light." GI is the computer's way of calculating that "bouncing light" so your game doesn't have pitch-black shadows.

### Example: Adding a Sun
1. Add a `DirectionalLight3D` (the Sun).
2. Add a `WorldEnvironment` node.
3. Set the `Environment` property to a `New Environment`.
4. Enable `SDFGI` in the Environment settings for real-time bouncing light.

