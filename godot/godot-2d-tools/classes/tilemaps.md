# TileMapLayer
The primary tool for grid-based level design in Godot 4.

### Concepts
- **TileSet**: The resource containing the tiles, their collisions, and navigation.
- **Layer**: A separate plane of tiles. Use layers for backgrounds, walls, and decorations.
- **Terrain**: (Replaces Autotiles) Logic to automatically pick the right tile based on neighbors.

### Key Functions
- `set_cell(coords, source_id, atlas_coords)`: Sets a tile at a specific grid position.
- `get_cell_source_id(coords)`: Checks what tile is at a position.

### Example: Setting a Tile via Code
```gdscript
# Set tile at (5, 5) using source 0 and atlas coords (0, 0)
$TileMapLayer.set_cell(Vector2i(5, 5), 0, Vector2i(0, 0))
```
