# Responsive UI Workflow
Designing interfaces that work on any screen size.

### Anchors vs Containers
- **Anchors**: Best for simple, fixed positioning (e.g., a mini-map in the top-right). Use the Anchor Presets in the editor toolbar.
- **Containers**: Best for dynamic content (e.g., a settings menu). Nest containers (e.g., a `VBoxContainer` inside a `MarginContainer`) to build complex layouts.

### Centering an Element via Script
```gdscript
var rect = TextureRect.new()
rect.texture = load("res://icon.svg")
# Center anchors
rect.anchor_left = 0.5
rect.anchor_right = 0.5
rect.anchor_top = 0.5
rect.anchor_bottom = 0.5

# Offset by half size for true centering
var tex_size = rect.texture.get_size()
rect.offset_left = -tex_size.x / 2
rect.offset_right = tex_size.x / 2
rect.offset_top = -tex_size.y / 2
rect.offset_bottom = tex_size.y / 2
add_child(rect)
```
