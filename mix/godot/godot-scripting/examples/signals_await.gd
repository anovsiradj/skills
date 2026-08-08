extends Node
## Signals and await for async flow control.

signal player_died

func _ready() -> void:
	# Connect signal to a method.
	player_died.connect(_on_player_died)
	player_died.emit()

	# Await a signal or timer — replaces yield from 3.x.
	await get_tree().create_timer(1.0).timeout
	print("One second later")

	# Await a signal on an instanced scene (path must exist in your project).
	var enemy: Node = load("res://enemy.tscn").instantiate()
	add_child(enemy)
	await enemy.died
	print("Enemy died")

func _on_player_died() -> void:
	print("Player died!")
