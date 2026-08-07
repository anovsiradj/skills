# Path2D and PathFollow2D
Used for creating structured movement paths.

### Workflow
1. Add `Path2D` node.
2. Draw the curve in the editor using the path tools.
3. Add `PathFollow2D` as a child of `Path2D`.
4. Add your Sprite/Character as a child of `PathFollow2D`.

### Implementation
Update the `progress` or `progress_ratio` property of the `PathFollow2D` node.

### Example: Constant Path Movement
```gdscript
extends PathFollow2D

var speed = 100.0

func _process(delta):
	# Progress is in pixels
	progress += speed * delta
```
