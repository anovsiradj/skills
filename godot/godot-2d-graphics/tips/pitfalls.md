# Common 2D Graphics Pitfalls

### The Diagonal Speed Problem
**Issue**: If you move 1px right and 1px up simultaneously, you are actually moving ~1.41px total — diagonals are faster than straight lines.
**Fix**: Always call `.normalized()` on your input vector before multiplying by speed.

### Frame Rate Dependency
**Issue**: `position += velocity` runs every frame. On a 144Hz monitor the character moves faster than on a 60Hz monitor.
**Fix**: Multiply movement by `delta` in `_process`, or use `_physics_process`.

### Texture Filtering
**Issue**: Pixel art looks blurry when scaled.
**Fix**: In `Project Settings > Rendering > Textures`, change `Default Texture Filter` to `Nearest`.

### TileMap Performance
- **Large TileMaps**: Use `TileMapLayer` nodes and keep tile sets small.
- **Layers**: Avoid excessive layers; each layer is a separate draw pass.
- **Runtime edits**: Avoid modifying large tilemaps every frame.

### Particle Systems
- **CPU vs GPU**: CPU particles are easier to debug but less performant; GPU particles are faster but harder to debug.
- **Count/Lifetime**: Limit particle count and keep lifetimes short to prevent stuttering.

### Collision Shapes
- **Complex Shapes**: Overly complex collision shapes are slow. Prefer simple rectangles/circles.

### Performance Tips
- **Texture Atlases**: Pack sprites into a texture atlas to reduce draw calls.
- **Culling**: Use `VisibleOnScreenNotifier2D` (Godot 4) to disable off-screen objects.
