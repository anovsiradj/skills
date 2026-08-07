# Scripting Best Practices

### Use Static Typing
Instead of `var health = 100`, use `var health: int = 100`.
**Why?** It's faster, provides better autocomplete, and catches bugs before you run the game.

### Use `@onready` Instead of `get_node`
**Pro Tip**: Use `@onready` to ensure nodes are ready before accessing them. This avoids potential null reference errors and improves performance by avoiding repeated `get_node` calls.

- **Example**:
  ```gdscript
  @onready var my_node = $Path/To/Node
  func _ready():
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
@onready var sprite = $Sprite2D
func _process(delta):
    sprite.rotate(delta)
```

### Signals
**Pro Tip**: Use signals for event-driven programming to decouple components and improve maintainability.

- **Example**:
  ```gdscript
  signal player_died
  func _ready():
      $Player.player_died.connect(_on_player_died)
  
  func _on_player_died():
      print("Player died!")
  ```

### Inheritance
**Pro Tip**: Use inheritance to avoid code duplication and promote code reuse.

- **Example**:
  ```gdscript
  class Enemy extends CharacterBody3D:
      var health: int = 100
      
      func take_damage(amount: int):
          health -= amount
          if health <= 0:
              queue_free()
  ```

### `@export` and `@export_var`
**Pro Tip**: Use `@export` and `@export_var` to expose variables and functions to the editor, making them configurable without modifying scripts.

- **Example**:
  ```gdscript
  @export var jump_force: float = 4.5
  func jump():
      velocity.y = jump_force
  ```

### `@tool` Scripts
**Pro Tip**: Use `@tool` scripts for editor-only functionality, such as custom editors or debug tools.

- **Example**:
  ```gdscript
  @tool
  class SceneOptimizer:
      static func optimize_scene(scene: Node):
          # Custom editor logic
  ```

### `@export_range`
**Pro Tip**: Use `@export_range` to restrict variable values within a specified range, improving editor usability.

- **Example**:
  ```gdscript
  @export_range(0.0, 10.0) var speed: float = 5.0
  ```

### `@onready_var`
**Pro Tip**: Use `@onready_var` to ensure variables are initialized before they are used, similar to `@onready` but for variables.

- **Example**:
  ```gdscript
  @onready_var var player: CharacterBody3D
  func _ready():
      player.position = Vector3.ZERO
  ```

### Avoid Global Variables
**Pro Tip**: Avoid using global variables to prevent naming conflicts and improve code modularity.

### Use `queue_free()` Instead of `free()`
**Pro Tip**: Use `queue_free()` to safely remove nodes from the scene tree, ensuring all pending operations are completed first.

- **Example**:
  ```gdscript
  func die():
      queue_free()
  ```

### Use `@export_on_restart`
**Pro Tip**: Use `@export_on_restart` to reset variables to their default values when the scene restarts.

- **Example**:
  ```gdscript
  @export_on_restart var restart_value: int = 0
  ```