# Tooling Tips

### Efficient Tile Painting
Use the **Terrain** system in the TileSet editor to avoid manually picking transition tiles for grass-to-dirt edges.

### Path Smoothing
When using `Path2D`, use the curve handles in the editor to avoid "jerky" turns. If the object rotates weirdly, toggle `rotates` off in the `PathFollow2D` inspector.

### Grid Snapping
Enable **Grid Snap** (top right of viewport) to ensure your manually placed objects align perfectly with your TileMap.
