extends Node2D
## Grid-based pathfinding with AStar2D.

var astar := AStar2D.new()
const GRID_SIZE := 16

func _ready() -> void:
	# Add a point for each walkable grid cell (id = y * width + x).
	for y in range(10):
		for x in range(10):
			var id := y * 10 + x
			astar.add_point(id, Vector2(x, y) * GRID_SIZE)
			if x > 0:
				astar.connect_points(id, id - 1)
			if y > 0:
				astar.connect_points(id, id - 10)

func find_path_to(target_cell: Vector2i) -> PackedVector2Array:
	var from := astar.get_closest_point(global_position)
	var to := astar.get_closest_point(Vector2(target_cell) * GRID_SIZE)
	return astar.get_point_path(from, to)
