# Creating a Shader
The workflow for applying custom visuals to your game.

### Setup
1. Attach a `ShaderMaterial` to your node.
2. Inside the material, create a `New Shader`.
3. Define the type on the first line:
   - `shader_type canvas_item;` (2D)
   - `shader_type spatial;` (3D)
   - `shader_type particles;` (Particles)

### Example: Rainbow Color Shift (2D)
```glsl
shader_type canvas_item;

void fragment() {
    float shift = UV.x + TIME;
    COLOR = vec4(0.5 + 0.5 * cos(shift), 0.5 + 0.5 * sin(shift), 1.0, 1.0);
}
```
