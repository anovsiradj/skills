extends Node2D
## When to use preload vs load.

# Preload: compile-time, ideal for assets always needed (no lag spikes).
# NOTE: the file must exist, otherwise the script won't parse.
# const PLAYER_TEXTURE := preload("res://assets/player.png")

@export var player_texture: Texture2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	# Exported texture assigned in the inspector (no hardcoded path).
	if player_texture:
		sprite.texture = player_texture

	# Load: runtime, ideal for swappable/changed assets.
	var skin: Texture2D = load("res://skins/red.tres")
	if skin:
		sprite.texture = skin

	# Background loading without blocking the main thread.
	var loader := ResourceLoader.load_threaded_request("res://big_level.tscn")
	if loader:
		var level: PackedScene = ResourceLoader.load_threaded_get("res://big_level.tscn")
		print("Level loaded: ", level != null)
