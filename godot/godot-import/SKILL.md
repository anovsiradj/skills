---
name: godot-import
description: Godot Engine asset import pipeline, formats, and custom plugins.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Import

## Key Insights
- **Recommended 3D Format**: glTF 2.0 is the preferred format for 3D assets.
- **Transparent Pipeline**: Godot can import `.blend` files by calling Blender's glTF exporter in the background.
- **Runtime Loading**: You can load glTF scenes at runtime, even in exported projects.

## Major Version Differences (3.x vs 4.x)
- **glTF Focus**: Godot 4 moved heavily toward glTF 2.0 as the primary interchange format.
- **Import Settings**: More granular control over how textures and meshes are imported (e.g., compression settings).

## Weird/Unusual Things
- **Mikktspace**: Godot uses Mikktspace for tangents on import, ensuring that normal maps from Blender look exactly the same in Godot.

## Recommendations
- **3D Workflow**: Use `.blend` files directly in your project folder; Godot will handle the conversion.
- **2D Workflow**: Use SVG for UI elements to maintain sharpness at all resolutions.

## Prohibitions
- Do not rely on FBX as your primary format; while supported, glTF is more stable and feature-complete in Godot.

## ELI5: The Import Pipeline
Imagine Godot is a chef. You give the chef raw ingredients (a `.blend` file from Blender or a `.png` from Photoshop). The chef doesn't just throw them on the plate; they chop them, peel them, and cook them into a "Godot Resource" (`.res` or `.scn`). This "cooking" process (Importing) happens so that when the game runs, the chef can just serve the food instantly without having to cook it again.

### Example: Importing a 3D Model
1. Drag `my_model.glb` into the `res://` folder.
2. Double-click the file in the FileSystem dock.
3. Adjust "Import" settings (e.g., "Generate Physics" -> "Simplified Convex Hull").
4. Click "Reimport".

