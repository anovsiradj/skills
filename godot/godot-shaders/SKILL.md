---
name: godot-shaders
description: Godot Engine shader language, visual shaders, and custom effects.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Shaders

## Key Insights
- **Language**: A GLSL-inspired language.
- **Types**:
	- **Vertex**: Moves the points of the object.
	- **Fragment**: Colors the pixels.
	- **Light**: Changes how light hits the surface.
	- **Sky/Fog**: Specific to environment rendering.
- **Visual Shaders**: A node-based editor for those who don't want to write code.

## Major Version Differences (3.x vs 4.x)
- **RenderingDevice**: Godot 4 allows shaders to interact more deeply with the GPU via the new backend.
- **Compute Shaders**: Significant improvements in how compute shaders are handled for non-rendering tasks.

## Weird/Unusual Things
- **DrawableTexture2D**: Allows shaders to procedurally generate textures in real-time.

## Recommendations
- **Performance**: Do as much as possible in the Vertex shader instead of the Fragment shader (Vertex runs once per point, Fragment runs once per pixel).
- **Visuals**: Start with Visual Shaders to prototype, then switch to code for optimization.

## Prohibitions
- Do not use complex loops inside a fragment shader; it can kill performance on mobile devices.

## ELI5: Vertex vs Fragment Shaders
Imagine you are painting a wooden fence.
- **Vertex Shader**: This is like moving the fence posts. You can make the fence bend or wave like it's underwater.
- **Fragment Shader**: This is like choosing the paint color for every single tiny spot on the fence. You can make it look shiny, rusty, or like it's changing colors.

### Example: Simple Wave Effect (Vertex Shader)
```gdshader
shader_type spatial;

void vertex() {
    VERTEX.y += sin(TIME * 2.0 + VERTEX.x) * 0.5;
}
```

