# Rendering Server
For those who need extreme performance.

### What is it?
Normally, you add a `Sprite2D` node. This is a "Manager". The manager then tells the `RenderingServer` to draw a texture.
Talking directly to the `RenderingServer` skips the node overhead.

### When to use?
- When rendering >10,000 individual objects.
- When creating custom procedural mesh systems.

### Example: Drawing a point directly
```gdscript
var canvas_item = RenderingServer.canvas_item_create()
RenderingServer.canvas_item_add_rect(canvas_item, Rect2(0, 0, 10, 10), Color.RED)
```
