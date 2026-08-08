extends Node2D
## Drawing directly with the RenderingServer (bypasses node overhead).

var canvas_item: RID

func _ready() -> void:
	canvas_item = RenderingServer.canvas_item_create()
	RenderingServer.canvas_item_set_parent(canvas_item, get_canvas_item())

func _process(delta: float) -> void:
	# Redraw every frame: clear, then add geometry.
	RenderingServer.canvas_item_clear(canvas_item)
	RenderingServer.canvas_item_add_rect(
		canvas_item,
		Rect2(10, 10, 50, 50),
		Color.RED
	)

func _exit_tree() -> void:
	if canvas_item.is_valid():
		RenderingServer.free_rid(canvas_item)
