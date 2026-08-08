extends Node
## Save and load with FileAccess using user:// storage.

const SAVE_PATH := "user://savegame.dat"

func save_game(data: Dictionary) -> void:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Failed to open save file: %s" % FileAccess.get_open_error())
		return
	file.store_var(data)

func load_game() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {}
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return {}
	return file.get_var()
