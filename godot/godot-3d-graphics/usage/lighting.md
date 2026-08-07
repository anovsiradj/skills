# Setting up Lighting
Creating atmosphere with lights and environment.

### Lighting Types
- `DirectionalLight3D`: Sun/Moon. Parallel rays, infinite distance.
- `OmniLight3D`: Light bulb. Radiates in all directions from a point.
- `SpotLight3D`: Flashlight. Cone-shaped light.

### Environment (WorldEnvironment)
Controls global settings:
- **Sky**: Use `ProceduralSkyMaterial` for a dynamic sky.
- **Fog**: Enable `Volumetric Fog` for atmospheric depth.
- **Tonemapping**: Use `ACES` for a high-contrast, cinematic look.

### Example: Cinematic Night Scene
1. Set `WorldEnvironment` background to a dark blue color.
2. Add a `DirectionalLight3D` with a low intensity and dark blue color.
3. Add `OmniLight3D` nodes as street lamps with warm orange light.
4. Enable `Glow` in `WorldEnvironment` to make lamps shine.
