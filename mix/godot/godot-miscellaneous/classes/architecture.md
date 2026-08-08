# Scene Tree & Signals
The glue that connects the game.

### The Node System
Everything is a Node. A Scene is a tree of Nodes.
- **Instancing**: Use `scene.instantiate()` to spawn copies of a scene (e.g., bullets, enemies).

### Signals (Observer Pattern)
Signals allow nodes to communicate without being tightly coupled.
- **Emitter**: Calls `signal_name.emit()`.
- **Listener**: Connects to the signal and runs a function.

### Example: Signal Connection
```gdscript
# In Enemy.gd
signal died(score_value)

func die():
	died.emit(100)
	queue_free()

# In GameManager.gd
func _ready():
	var enemy = $Enemy
	enemy.died.connect(_on_enemy_died)

func _on_enemy_died(value):
	score += value
```
