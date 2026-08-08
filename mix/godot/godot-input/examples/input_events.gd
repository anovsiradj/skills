extends Node
## Handling InputEvents via callbacks.

func _input(event: InputEvent) -> void:
	# Runs before GUI; good for general input.
	if event is InputEventKey and event.pressed and not event.echo:
		print("Key: ", event.keycode)

func _unhandled_input(event: InputEvent) -> void:
	# Runs after GUI; put gameplay input here so UI wins.
	if event.is_action_pressed("shoot"):
		shoot()

func _shortcut_input(event: InputEvent) -> void:
	# Runs between GUI and _unhandled_input; for keyboard shortcuts.
	if event is InputEventKey and event.pressed and event.ctrl_pressed:
		if event.keycode == KEY_S:
			save_game()

func _on_click(event: InputEventMouseButton) -> void:
	if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Clicked at ", event.position)

func shoot() -> void:
	print("Bang!")

func save_game() -> void:
	print("Game saved")
