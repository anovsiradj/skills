# Setting up Lighting
Creating atmosphere with lights and environment.

### Lighting Types
- `DirectionalLight3D`: Sun/Moon. Parallel rays, infinite distance.
- `OmniLight3D`: Light bulb. Radiates in all directions from a point.
- `SpotLight3D`: Flashlight. Cone-shaped light.
- **Annotations**: Use `@export` to configure light properties in the editor.

### Example: Using `@export` for Light Properties
```gdscript
@export var light_intensity: float = 1.0
@export var light_color: Color = Color.WHITE
@export_range(0.0, 100.0) var shadow_distance: float = 50.0
```

### Environment (WorldEnvironment)
Controls global settings:
- **Sky**: Use `ProceduralSkyMaterial` for a dynamic sky.
- **Fog**: Enable `Volumetric Fog` for atmospheric depth.
- **Tonemapping**: Use `ACES` for a high-contrast, cinematic look.
- **Annotations**: Use `@export_group` to organize environment properties.

### Example: Using `@export_group` for Environment Settings
```gdscript
@export_group("Sky Settings")
@export var sky_color: Color = Color.BLUE
@export var sky_intensity: float = 1.0

@export_group("Fog Settings")
@export var fog_enabled: bool = true
@export var fog_density: float = 0.01
```

### Example: Cinematic Night Scene with `@export`
1. Set `WorldEnvironment` background to a dark blue color.
2. Use `@export` to configure `DirectionalLight3D`:
   ```gdscript
   @export var directional_light_intensity: float = 0.2
   @export var directional_light_color: Color = Color(0.1, 0.1, 0.2)
   ```
3. Add `OmniLight3D` nodes as street lamps with warm orange light.
   ```gdscript
   @export var street_light_intensity: float = 1.0
   @export var street_light_color: Color = Color(1.0, 0.8, 0.5)
   ```
4. Enable `Glow` in `WorldEnvironment` to make lamps shine.
5. Use `@export_group` for organizing environment properties:
   ```gdscript
   @export_group("Lighting")
   @export var glow_enabled: bool = true
   @export var glow_intensity: float = 1.5
   ```
