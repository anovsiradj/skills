extends Node2D
## Emitting and connecting typed signals (observer pattern).

signal died(score_value: int)
signal health_changed(current: int, max: int)

@export var score := 100
var health := 3

func _ready() -> void:
	# Connect our own signal to a local handler.
	health_changed.connect(_on_health_changed)

func take_damage(amount: int) -> void:
	health -= amount
	health_changed.emit(health, 3)
	if health <= 0:
		died.emit(score)
		queue_free()

func _on_health_changed(current: int, max: int) -> void:
	print("HP: %d/%d" % [current, max])

# ---------------------------------------------------------------------------
# Connecting from another script (e.g. a GameManager):
#
# func _ready() -> void:
#     var enemy := preload("res://enemy.gd").new()
#     add_child(enemy)
#     enemy.died.connect(_on_enemy_died)
#
# func _on_enemy_died(value: int) -> void:
#     score += value
