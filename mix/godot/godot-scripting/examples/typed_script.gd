extends Node
## Static typing + annotations in GDScript 2.0.

@export_group("Player Stats")
@export var health: int = 100
@export var speed: float = 5.0
@export var name_tag: String = "Hero"
@export_enum("Warrior", "Magician", "Thief") var character_class: String = "Warrior"
@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements: int = 0

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	# Typed arrays and dictionaries.
	var coins: Array[int] = [10, 20, 30]
	var stats: Dictionary = {"str": 10, "agi": 12}

	# Typed lambda: parameters, return type, and calling syntax.
	var double := func(x: int) -> int: return x * 2
	print(double.call(21))
