# Shader Processor Functions
The entry points for your shader code.

### Primary Functions
- `vertex()`: Runs per vertex. Use for geometry displacement (e.g., wind blowing grass).
- `fragment()`: Runs per pixel. Use for colors, textures, and final visual properties.
- `light()`: Runs per pixel, per light. Use for custom shading (e.g., Toon/Cel shading).
- `start()` & `process()`: Used specifically in `particles` shaders.

### Built-in Variables
- `COLOR`: The final output color.
- `UV`: The texture coordinate map (range 0.0 to 1.0).
- `VERTEX`: The coordinate of the point being processed.
- `TIME`: A constant clock for animations (e.g., `sin(TIME)`).

### Example: Basic Sine Wave Vertex Displacement
```glsl
void vertex() {
    VERTEX.y += sin(TIME + VERTEX.x) * 0.5;
}
```
