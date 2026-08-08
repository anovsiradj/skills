extends Node
## Key/value config storage using ConfigFile (INI-style).

const CONFIG_PATH := "user://settings.cfg"

func save_settings(volume: float, fullscreen: bool) -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("audio", "volume", volume)
	cfg.set_value("video", "fullscreen", fullscreen)
	cfg.save(CONFIG_PATH)

func load_settings() -> Dictionary:
	var cfg := ConfigFile.new()
	var err := cfg.load(CONFIG_PATH)
	if err != OK:
		return {}
	return {
		"volume": cfg.get_value("audio", "volume", -6.0),
		"fullscreen": cfg.get_value("video", "fullscreen", false),
	}
