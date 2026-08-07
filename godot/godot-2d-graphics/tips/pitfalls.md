# Common 2D Graphics Pitfalls

### The Diagonal Speed Problem
**Issue**: If you move 1px right and 1px up, you are actually moving $\sim 1.41\text{px}$ total.
**Fix**: Always use `.normalized()` on your input vector before multiplying by speed.

### Frame Rate Dependency
**Issue**: `position += velocity` runs every frame. On a 144Hz monitor, the character moves faster than on a 60Hz monitor.
**Fix**: Always multiply movement by `delta` in `_process` or use `_physics_process`.

### Texture Filtering
**Issue**: Pixel art looks blurry when scaled.
**Fix**: In `Project Settings` -> `Rendering` -> `Textures`, change `Default Texture Filter` to `Nearest`.

### TileMap Performance
- **Large TileMaps**: Can cause performance issues if not optimized. Use **LOD (Level of Detail)** for distant tiles.
- **TileSet Size**: Keep TileSets small to avoid memory issues.
- **TileMap Layers**: Avoid excessive layers; use **TileMapLayer** for better organization.

### Particle Systems
- **CPU vs GPU**: CPU-based particles are easier to debug but less performant. GPU particles are faster but harder to debug.
- **Particle Count**: Limit the number of particles to prevent stuttering.
- **Particle Lifetimes**: Use **short-lived particles** for better performance.

### Sprite Animation
- **Animation Frames**: Ensure animation frames are optimized for smooth playback.
- **Animation Trees**: Use **AnimationTree** for complex animations to reduce script overhead.

### Collision Shapes
- **Complex Shapes**: Avoid overly complex collision shapes for performance reasons.
- **Collision Layers**: Use **Collision Layers** to optimize collision detection.

### Navigation Meshes
- **Navigation Regions**: Ensure **Navigation Regions** are correctly set up for 2D navigation.
- **Navigation Agents**: Use **NavigationAgent2D** for efficient pathfinding.

### Performance Tips
- **Atlas Textures**: Use **TextureAtlas** for sprites to reduce draw calls.
- **Sprite Packing**: Pack sprites into **TexturePacker** for better performance.
- **Culling**: Use **VisibilityNotifier2D** to cull off-screen objects.