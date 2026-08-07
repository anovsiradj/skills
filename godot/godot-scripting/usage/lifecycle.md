# GDScript Lifecycle
Understanding when your code actually runs.

### Core Functions
- `_init()`: Called when the object is first created in memory. Use for initial setup that doesn't require nodes.
- `_ready()`: Called when the node and its children are fully inside the scene tree. Use for setup that requires nodes.
- `_process(delta)`: Called every frame. Use for visual updates and frame-dependent logic.
- `_physics_process(delta)`: Called at a fixed rate. Use for movement and collision handling.

### Annotations for Lifecycle
- **`@onready`**: Ensures variables are initialized before they are used, avoiding null reference errors.
  ```gdscript
  @onready var my_node = $Path/To/Node
  func _ready():
      my_node.visible = true
  ```

- **`@onready_var`**: Ensures variables are initialized before they are used, similar to `@onready` but for variables.
  ```gdscript
  @onready_var var player: CharacterBody3D
  func _ready():
      player.position = Vector3.ZERO
  ```

### Node Access
Use the `$` shorthand to get a child node.
`$Sprite2D.play()` is equivalent to `get_node("Sprite2D").play()`.

### Example: Simple Interaction with `@onready`
```gdscript
extends CharacterBody2D

@export var speed = 300.0

@onready var player = $Player

func _physics_process(delta):
    var direction = Input.get_axis("ui_left", "ui_right")
    velocity.x = direction * speed
    move_and_slide()
```
