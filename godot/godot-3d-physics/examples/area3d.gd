extends Area3D
## Detect bodies entering/leaving an area (damage zones, triggers).

@export var damage := 10.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
