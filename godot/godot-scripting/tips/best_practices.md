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
  @export var gravity: float = 9.81
  ```

### `@export_enum`
**Pro Tip**: Use `@export_enum` to export integer or string properties as enumerated lists.

- **Example**:
  ```gdscript
  @export_enum("Warrior", "Magician", "Thief") var character_class: int
  ```

### `@export_flags`
**Pro Tip**: Use `@export_flags` to export integer properties as bit flags for multiple selections.

- **Example**:
  ```gdscript
  @export_flags("Fire", "Water", "Earth", "Wind") var spell_elements: int = 0
  ```

### `@export_enum`
**Pro Tip**: Use `@export_enum` to export integer or string properties as enumerated lists.

- **Example**:
  ```gdscript
  @export_enum("Warrior", "Magician", "Thief") var character_class: int
  ```

- **Example**:
  ```gdscript
  @export var jump_force: float = 4.5
  func jump():
      velocity.y = jump_force
  ```

### `@tool` Scripts
**Pro Tip**: Use `@tool` scripts for editor-only functionality, such as custom editors or debug tools.

### `@export_tool_button`
**Pro Tip**: Use `@export_tool_button` to create clickable buttons in the editor for calling functions.

- **Example**:
  ```gdscript
  @tool
  extends Sprite2D

  @export_tool_button("Randomize Color!")
  var randomize_color_action = randomize_color

  func randomize_color():
      self.modulate = Color(randf(), randf(), randf())
  ```

### `@rpc`
**Pro Tip**: Use `@rpc` for remote procedure calls in multiplayer scenarios.

- **Example**:
  ```gdscript
  @rpc("any_peer", "unreliable_ordered")
  func update_position(new_position: Vector3):
      position = new_position
  ```

### `@export_tool_button`
**Pro Tip**: Use `@export_tool_button` to create clickable buttons in the editor for calling functions.

- **Example**:
  ```gdscript
  @tool
  extends Sprite2D

  @export_tool_button("Randomize Color!")
  var randomize_color_action = randomize_color

  func randomize_color():
      self.modulate = Color(randf(), randf(), randf())
  ```

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

### `@export_flags`
**Pro Tip**: Use `@export_flags` to export integer properties as bit flags for multiple selections.

- **Example**:
  ```gdscript
  @export_flags("Fire", "Water", "Earth", "Wind") var spell_elements: int = 0
  ```

### `@export_flags_3d_render` and `@export_flags_2d_navigation`
**Pro Tip**: Use these annotations to export 3D render layers and 2D navigation layers as bit flags.

- **Example**:
  ```gdscript
  @export_flags_3d_render var render_layers: int = 1
  @export_flags_2d_navigation var navigation_layers: int = 1
  ```

### `@onready_var`
**Pro Tip**: Use `@onready_var` to ensure variables are initialized before they are used, similar to `@onready` but for variables.

- **Example**:
  ```gdscript
  @onready_var var player: CharacterBody3D
  func _ready():
      player.position = Vector3.ZERO
  ```

### `@export_group` and `@export_subgroup`
**Pro Tip**: Use these annotations to organize exported properties in the Inspector dock for better usability.

- **Example**:
  ```gdscript
  @export_group("Player Stats")
  @export var health: int = 100
  @export var speed: float = 5.0

  @export_subgroup("Inventory", "item_")
  @export var item_coins: int = 0
  @export var item_health_potions: int = 0
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

### `@export_on_restart`
**Pro Tip**: Use `@export_on_restart` to reset variables to their default values when the scene restarts.

- **Example**:
  ```gdscript
  @export_on_restart var restart_value: int = 0
  ```

### `@export_exp_easing`
**Pro Tip**: Use `@export_exp_easing` to export floating-point properties with easing curves for smooth transitions.

- **Example**:
  ```gdscript
  @export_exp_easing var transition_speed: float = 1.0
  ```