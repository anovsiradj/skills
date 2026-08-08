# Scripting Best Practices

### Use Static Typing
Instead of `var health = 100`, use `var health: int = 100`.
**Why?** It's faster, provides better autocomplete, and catches bugs before you run the game.

### Use `@onready` Instead of `get_node`
Cache node references with `@onready` to avoid repeated `get_node()` calls and null errors.

```gdscript
@onready var my_node: Sprite2D = $Path/To/Node

func _ready() -> void:
	my_node.visible = true
```

### Avoid Hardcoded Paths
Don't use `get_node("Root/UI/Player/HealthBar")`. If you move the HealthBar, the script breaks.
**Better**: Use **Scene Unique Names** (Right click node -> Access as Unique Name) and access it via `%HealthBar`.

### Node Reference Caching
Avoid calling `get_node()` or `$` inside `_process`.
**Bad**:
```gdscript
func _process(delta):
	$Sprite2D.rotate(delta)
```
**Good**:
```gdscript
@onready var sprite: Sprite2D = $Sprite2D

func _process(delta):
	sprite.rotate(delta)
```

### Signals
Use signals for event-driven programming to decouple components.

```gdscript
signal player_died

func _ready() -> void:
	$Player.died.connect(_on_player_died)

func _on_player_died() -> void:
	print("Player died!")
```

### Inheritance
Use inheritance to avoid code duplication and promote code reuse.

```gdscript
class Enemy extends CharacterBody3D:
	var health: int = 100

	func take_damage(amount: int) -> void:
		health -= amount
		if health <= 0:
			queue_free()
```

### `@export` Annotations
Expose variables to the editor so designers can tune them without editing scripts.

```gdscript
@export var jump_force: float = 4.5
@export var gravity: float = 9.81
```

### `@export_enum`
Export a property as a dropdown list.

```gdscript
@export_enum("Warrior", "Magician", "Thief") var character_class: String = "Warrior"
```

### `@export_flags`
Export an integer as bit flags for multiple selections.

```gdscript
@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements: int = 0
```

### `@export_group` and `@export_subgroup`
Organize exported properties in the Inspector dock.

```gdscript
@export_group("Player Stats")
@export var health: int = 100
@export var speed: float = 5.0

@export_subgroup("Inventory", "item_")
@export var item_coins: int = 0
@export var item_health_potions: int = 0
```

### `@export_range`
Restrict a value to a range with optional step.

```gdscript
@export_range(0.0, 10.0, 0.5) var speed: float = 5.0
```

### `@export_tool_button`
Create a clickable button in the inspector that calls a method.

```gdscript
@tool
extends Sprite2D

@export_tool_button("Randomize Color!")
var randomize_color_action = randomize_color

func randomize_color() -> void:
	modulate = Color(randf(), randf(), randf())
```

### `@tool` Scripts
Use `@tool` for editor-only functionality (custom editors, debug tools). Guard editor-only code with `Engine.is_editor_hint()`.

### `@rpc`
Use `@rpc` for remote procedure calls in multiplayer (see godot-networking).

```gdscript
@rpc("any_peer", "unreliable_ordered")
func update_position(new_position: Vector3) -> void:
	position = new_position
```

### Avoid Global Variables
Use autoload singletons or dependency injection instead of global variables to avoid naming conflicts.

### Use `queue_free()` Instead of `free()`
`queue_free()` safely removes a node at the end of the frame, preventing crashes if other code still references it.

```gdscript
func die() -> void:
	queue_free()
```
