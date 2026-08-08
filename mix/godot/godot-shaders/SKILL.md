---
name: godot-shaders
description: Godot Engine shaders, shader language, and shader programming.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Shaders

## Overview
Writing shaders in Godot's shading language: `shader_type` declarations (`canvas_item`, `spatial`, `particles`), the `vertex`/`fragment`/`light` processor functions, and applying them via `ShaderMaterial`.

## Key Version Differences (3.x vs 4.x)
- Shader language is mostly compatible; `render_mode` and built-ins like `TIME`, `UV`, `VERTEX`, `COLOR` remain.
- `ShaderMaterial` and `Shader` resources; set uniforms with `set_shader_parameter()`.
- `light()` still runs per-pixel-per-light — keep it cheap.

## File Map
| File | Purpose |
|------|---------|
| [classes/processors.md](classes/processors.md) | vertex/fragment/light functions |
| [tips/performance.md](tips/performance.md) | Shader performance |
| [usage/workflow.md](usage/workflow.md) | Creating a shader |
| [examples/rainbow_shader.gdshader](examples/rainbow_shader.gdshader) | 2D animated color shift |

## Quick Start
```glsl
shader_type canvas_item;

void fragment() {
	COLOR = vec4(UV, 0.5, 1.0);
}
```
