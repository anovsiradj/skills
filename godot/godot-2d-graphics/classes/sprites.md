# Sprite Basics
The core of 2D visuals in Godot.

### Key Classes
- `Sprite2D`: The simplest way to display a texture.
- `AnimatedSprite2D`: For frame-by-frame animations.

### Key Properties
- `texture`: The image file to display.
- `flip_h` / `flip_v`: Mirrors the image horizontally or vertically.
- `modulate`: Changes the color/opacity of the sprite (e.g., flashing red when hit).

### Example: Simple Sprite Setup
```gdscript
# Change color to red and half transparency
$Sprite2D.modulate = Color(1, 0, 0, 0.5)
# Mirror the character
$Sprite2D.flip_h = true
```
