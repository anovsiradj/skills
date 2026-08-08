extends Area2D
## Detect overlapping bodies and areas (e.g. pickups, trigger zones).

@export var score_value := 10

signal score_changed(amount: int)

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _on_body_entered(body: Node2D) -> void:
	# body is any PhysicsBody2D with a matching collision mask.
	if body.is_in_group("player"):
		score_changed.emit(score_value)
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	# area is another Area2D overlapping this one.
	if area.has_method("apply_pickup"):
		area.apply_pickup(score_value)
