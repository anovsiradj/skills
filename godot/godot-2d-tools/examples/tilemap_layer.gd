extends TileMapLayer
## Setting tiles from code at runtime.

func _ready() -> void:
	# Place a tile from source 0 at atlas coords (0, 0) on a grid of tiles.
	for x in range(10):
		for y in range(5):
			set_cell(Vector2i(x, y), 0, Vector2i(0, 0))

	# Read back which tile is at a position.
	var source_id: int = get_cell_source_id(Vector2i(3, 3))
	if source_id != -1:
		print("Tile present at (3, 3)")
