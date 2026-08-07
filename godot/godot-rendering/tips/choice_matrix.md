# Renderer Choice Matrix

| Renderer          | Pros                                      | Cons                                      | Best For                          |
|-------------------|------------------------------------------|---------------------------------------|----------------------------------|
| Compatibility     | Works everywhere, simple            | Poor performance, no modern features | Learning, simple projects, Web-based projects            |
| Mobile            | Optimized for mobile devices            | Limited features, lower performance  | Mobile and VR projects            |
| Forward+          | Good performance, modern features       | Requires Vulkan/DirectX 12, limited Web support | Desktop projects, high-end graphics |
| Vulkan            | High performance, modern features, GPU instancing | Complex setup, limited compatibility   | High-end desktop projects          |
| Metal             | Optimized for Apple devices, good performance | Limited to macOS/iOS                  | Apple platforms                     |
| WebGL             | Works in browsers                         | Limited features, lower performance   | Web-based projects                  |

### Feature Comparison

| Feature            | Compatibility | Mobile | Forward+ | Vulkan | Metal | WebGL |
| :----------------- | :-----------: | :------: | :------: | :-----: | :----: | :-----: |
| **Target**         | Web / Old PC  | Mobile / VR | Desktop | Desktop | Apple Devices | Web |
| **API**            | OpenGL        | Vulkan   | Vulkan   | Vulkan | Metal | WebGL |
| **SDFGI**          | ❌            | ❌       | ✅       | ✅     | ✅    | ❌    |
| **VoxelGI**        | ❌            | ❌       | ✅       | ✅     | ✅    | ❌    |
| **Volumetric Fog** | ❌            | ❌       | ✅       | ✅     | ✅    | ❌    |
| **Subsurface Scattering** | ❌          | ❌       | ✅       | ✅     | ✅    | ❌    |
| **Compute Shaders** | ❌            | ❌       | ❌       | ✅     | ✅    | ❌    |
| **Multi-Threaded Rendering** | ❌      | ❌       | ✅       | ✅     | ✅    | ❌    |

### Recommendation
- **Web Project?** $ightarrow$ Compatibility or WebGL.
- **Mobile Game?** $ightarrow$ Mobile.
- **High-end PC Game?** $ightarrow$ Forward+, Vulkan, or Metal.
- **Apple Platforms?** $ightarrow$ Metal.
- **VR Project?** $ightarrow$ Mobile renderer.

### Renderer Architecture
The Rendering Server manages all rendering operations, including:
- **Scene Rendering**: Handles the rendering of nodes and their children.
- **Viewport**: Manages the viewport settings and camera.
- **Texture Generation**: Handles texture generation and filtering.
- **Lighting**: Manages dynamic and baked lighting.
- **Post-Processing**: Handles effects like bloom, depth of field, and motion blur.

### Vulkan Fallback
If Vulkan is not available, Godot falls back to OpenGL. This ensures compatibility but may reduce performance. Vulkan is the default renderer for:
- **Linux** (if available)
- **Windows** (if available)
- **macOS** (if Metal is unavailable)

### WebGL Limitations
- **No GLSL ES 3.00+**: Limited to GLSL ES 1.00.
- **No Compute Shaders**: Not supported.
- **No Physics**: Physics simulations are disabled.
- **No Multiplayer**: Networking is disabled.
- **No GDExtension**: Not supported.
- **No Vulkan/DirectX 12**: Not supported.