extends Node
## Controlling audio buses via the AudioServer singleton.

@export var master_volume_db := -6.0

func _ready() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), master_volume_db)

func toggle_sfx_mute(muted: bool) -> void:
	var bus_idx := AudioServer.get_bus_index("SFX")
	if bus_idx != -1:
		AudioServer.set_bus_mute(bus_idx, muted)

func set_music_volume(volume_db: float) -> void:
	var bus_idx := AudioServer.get_bus_index("Music")
	if bus_idx != -1:
		AudioServer.set_bus_volume_db(bus_idx, volume_db)
