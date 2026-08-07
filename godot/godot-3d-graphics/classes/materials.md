# Materials & PBR
Physically Based Rendering (PBR) makes objects look realistic by simulating real-world light.

### StandardMaterial3D
The most versatile material. Key properties:
- **Albedo**: Base color or texture.
- **Metallic**: How "metal" the surface is (0 = plastic, 1 = chrome).
- **Roughness**: How smooth the surface is (0 = mirror, 1 = matte).
- **Normal Map**: Adds fake depth/bumps to a flat surface.
- **Ambient Occlusion**: Simulates light occlusion in crevices.
- **Specular**: Controls the intensity of specular highlights.

### ORMMaterial3D
Optimized for real-time ray tracing. Key features:
- **Subsurface Scattering**: Simulates light scattering under surfaces.
- **Volumetric Fog**: Adds depth with volumetric effects.
- **Ray-Traced Reflections**: High-quality reflections using ray tracing.
- **Translucency**: Supports translucent materials.

### ShaderMaterial3D
Custom shaders for advanced visual effects. Key features:
- **Custom GLSL Shaders**: Write your own vertex and fragment shaders.
- **Compute Shaders**: Use GPU compute shaders for advanced calculations.
- **Dynamic Properties**: Modify material properties at runtime.

### Transparency Modes
- **Alpha Scissor**: Hard cutoff. Best for leaves/grass. Fast and casts shadows.
- **Alpha**: Smooth blend. Best for glass/smoke. Slow and has sorting issues.
- **Masking**: Uses a separate mask texture for transparency.

### Example: Mirror Material
1. Create `StandardMaterial3D`.
2. Set `Albedo` to white.
3. Set `Metallic` to `1.0`.
4. Set `Roughness` to `0.0`.

### Example: Glass Material
1. Create `StandardMaterial3D`.
2. Set `Albedo` to a light gray.
3. Set `Metallic` to `0.0`.
4. Set `Roughness` to `0.5`.
5. Enable `Transparency` with `Alpha` mode.
6. Set `Refraction` to `1.5` for a realistic glass effect.

### Example: ORM Material for Ray Tracing
1. Create `ORMMaterial3D`.
2. Enable `Subsurface Scattering`.
3. Enable `Volumetric Fog`.
4. Set `Ray Traced Reflections` to `true`.