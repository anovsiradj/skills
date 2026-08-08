extends Control
## Handling touch input on mobile.

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			print("Touch at ", event.position)
	elif event is InputEventScreenDrag:
		print("Drag delta: ", event.relative)

func _unhandled_input(event: InputEvent) -> void:
	# Mouse events double as touch events on mobile with emulation.
	if event is InputEventMouseButton and event.pressed:
		print("Tap at ", event.position)
