# Renderer Choice Matrix
Godot 4 has three renderers. Choose one in `Project Settings > Rendering > Renderer`.

| Renderer    | API     | Best For                        | Features |
|-------------|---------|---------------------------------|----------|
| **Forward+** | Vulkan  | Desktop games, high-end graphics | SDFGI, VoxelGI, volumetric fog, SSR, compute shaders |
| **Mobile**   | Vulkan  | Mobile and standalone VR        | Most features, reduced quality settings |
| **Compatibility** | OpenGL | Web exports, old/low-end GPUs | No SDFGI/volumetric fog/compute; limited post-processing |

### Feature Comparison

| Feature                | Forward+ | Mobile | Compatibility |
|------------------------|:--------:|:------:|:-------------:|
| SDFGI                  | ✅       | ❌     | ❌            |
| VoxelGI                | ✅       | ❌     | ❌            |
| Volumetric Fog         | ✅       | ✅     | ❌            |
| Screen-Space Reflections | ✅     | ❌     | ❌            |
| Compute Shaders        | ✅       | ✅     | ❌            |
| Multiple light types   | ✅       | ✅     | Partial       |

### Recommendations
- **Web build?** → Compatibility.
- **Mobile or standalone VR?** → Mobile.
- **Desktop PC game?** → Forward+ (default).

### Renderer Architecture
The `RenderingServer` manages all rendering operations:
- **Scene Rendering**: Culls and draws nodes.
- **Viewport**: Manages viewport settings and camera.
- **Texture Generation**: Handles texture creation and filtering.
- **Lighting**: Manages dynamic and baked lighting.
- **Post-Processing**: Bloom, depth of field, motion blur.

### Platform Notes
- Vulkan is required for Forward+/Mobile (Windows, Linux, macOS via Metal-backed Vulkan).
- Web requires the Compatibility renderer; the Web editor does **not** support C#, GDExtension, debugging, or project exporting.
