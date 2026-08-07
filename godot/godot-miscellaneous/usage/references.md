# Managing Node References
How to access other nodes efficiently.

### The `@onready` Pattern
Avoid calling `get_node()` in `_process()`. Cache the reference in `_ready()`.
```gdscript
# BAD: Slow, runs every frame
func _process(delta):
	get_node("Sprite2D").rotate(delta)

# GOOD: Fast, cached once
@onready var sprite = $Sprite2D
func _process(delta):
	sprite.rotate(delta)
```

### Scene Unique Names
To avoid fragile paths like `get_node("../../../UI/Label")`:
1. Right-click a node in the scene tree.
2. Select **Access as Unique Name**.
3. Access it in code via `%NodeName`.
```gdscript
func update_ui():
	%HealthLabel.text = "Health: 100"
```
