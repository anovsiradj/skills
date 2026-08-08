# Materials & PBR
Physically Based Rendering (PBR) makes objects look realistic by simulating real-world light.

### StandardMaterial3D
The most versatile material. Key properties:
- **Albedo**: Base color or texture (`albedo_color` / `albedo_texture`).
- **Metallic**: How "metal" the surface is (0 = plastic, 1 = chrome).
- **Roughness**: How smooth the surface is (0 = mirror, 1 = matte).
- **Normal Map**: Adds fake depth/bumps to a flat surface (`normal_enabled` + `normal_texture`).
- **Ambient Occlusion**: Simulates light occlusion in crevices.
- **Specular**: Controls the intensity of specular highlights.

### Example: Mirror vs Matte
```gdscript
var mirror := StandardMaterial3D.new()
mirror.metallic = 1.0
mirror.roughness = 0.0

var matte := StandardMaterial3D.new()
matte.metallic = 0.0
matte.roughness = 1.0
```

### Transparency Modes
- **Alpha Scissor**: Hard cutoff. Best for leaves/grass. Fast and casts shadows.
- **Alpha**: Smooth blend. Best for glass/smoke. Slower and can have sorting issues.
- **Alpha Blend**: Uses a mask texture for the blend shape.

### Example: Glass Material
```gdscript
var glass := StandardMaterial3D.new()
glass.albedo_color = Color(0.8, 0.9, 1.0, 0.4)
glass.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
glass.refraction_enabled = true
glass.refraction_scale = 0.05
```

### ShaderMaterial
Custom shaders for advanced visual effects (see godot-shaders):
- **Custom Shaders**: Write your own vertex/fragment shaders.
- **Dynamic Properties**: Modify uniforms at runtime.

### Annotations
Use `@export` and `@export_group` to expose material properties in the editor:
```gdscript
@export_group("Material")
@export var albedo_color: Color = Color.WHITE
@export var metallic_value: float = 0.0
@export var roughness_value: float = 0.5
```
