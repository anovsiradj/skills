---
name: godot-3d-tools
description: Godot Engine 3D tools, meshes, and procedural geometry.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 3D Tools

## Key Insights
- **Prototyping**: CSG (Constructive Solid Geometry) is built-in for fast grey-boxing.
- **GridMaps**: 3D equivalent of TileMaps for grid-based level building.
- **glTF 2.0**: The gold standard for importing/exporting 3D assets.

## Major Version Differences (3.x vs 4.x)
- **glTF Integration**: Much deeper integration and better runtime support for loading glTF files in Godot 4.

## Weird/Unusual Things
- **CSG to Mesh**: CSG nodes can be converted to static meshes once the prototype is finished to improve performance.
- **Path3D**: Works identically to `Path2D`, allowing for smooth 3D movement along a spline.

## Recommendations
- **Prototyping**: Use CSG nodes to block out your level, then replace them with optimized meshes.
- **Interchange**: Always export from Blender as `.blend` (which Godot imports via glTF) or `.glb`.

## Prohibitions
- Do not use CSG nodes for the final release of a complex game; they are computationally heavier than standard meshes.

## ELI5: CSG (Constructive Solid Geometry)
Imagine you have a block of clay.
- **Addition**: You stick two blocks together to make a wall.
- **Subtraction**: You take a smaller block and "push" it through the big block to make a hole (like a window).
CSG lets you build levels like you're playing with clay, instead of having to build every tiny piece in a different program.

### Example: Creating a Room with CSG
1. Add a `CSGBox3D` (the outer shell).
2. Set it to "Subtraction".
3. Add a smaller `CSGBox3D` inside it.
4. Now you have a hollow room!

