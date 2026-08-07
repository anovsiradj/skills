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
- **Annotations**: Use `@export` to expose properties in the editor.

### Example: Using `@export` for Material Properties
```gdscript
@export var albedo_color: Color = Color.WHITE
@export var metallic_value: float = 0.0
@export var roughness_value: float = 0.5
```

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

### Example: Mirror Material with `@export`
1. Create `StandardMaterial3D`.
2. Use `@export` to configure material properties:
   ```gdscript
   @export var albedo_color: Color = Color.WHITE
   @export var metallic_value: float = 1.0
   @export var roughness_value: float = 0.0
   ```
3. Set `Albedo` to white.
4. Set `Metallic` to `1.0`.
5. Set `Roughness` to `0.0`.

### Example: Glass Material with `@export_range`
1. Create `StandardMaterial3D`.
2. Use `@export` and `@export_range` to configure material properties:
   ```gdscript
   @export var albedo_color: Color = Color(0.8, 0.8, 0.8)
   @export var metallic_value: float = 0.0
   @export_range(0.0, 1.0) var roughness_value: float = 0.5
   @export var refraction_index: float = 1.5
   ```
3. Enable `Transparency` with `Alpha` mode.
4. Set `Refraction` to `1.5` for a realistic glass effect.

### Example: Glass Material
1. Create `StandardMaterial3D`.
2. Set `Albedo` to a light gray.
3. Set `Metallic` to `0.0`.
4. Set `Roughness` to `0.5`.
5. Enable `Transparency` with `Alpha` mode.
6. Set `Refraction` to `1.5` for a realistic glass effect.

### Example: ORM Material for Ray Tracing with `@export`
1. Create `ORMMaterial3D`.
2. Use `@export` to configure material properties:
   ```gdscript
   @export var subsurface_scattering: bool = true
   @export var volumetric_fog: bool = true
   @export var ray_traced_reflections: bool = true
   ```
3. Enable `Subsurface Scattering`.
4. Enable `Volumetric Fog`.
5. Set `Ray Traced Reflections` to `true`.

### Example: Using `@export_group` for Material Properties
```gdscript
@export_group("Material Settings")
@export var albedo_color: Color = Color.WHITE
@export var metallic_value: float = 0.0
@export var roughness_value: float = 0.5

@export_group("Transparency")
@export var transparency_mode: String = "Alpha"
@export var refraction_index: float = 1.5
```