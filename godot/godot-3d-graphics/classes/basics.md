# 3D Basics
The core building blocks for 3D scenes.

### Key Classes
- `Node3D`: The base for all 3D objects.
- `MeshInstance3D`: Displays a 3D mesh.
- `Camera3D`: The player's viewpoint.

### Coordinate System
Godot uses a **Right-Handed** system:
- **Y**: Up/Down
- **X**: Left/Right
- **Z**: Front/Back (Negative Z is forward)

### Example: Creating a Basic Object
1. Add `Node3D` as scene root.
2. Add `MeshInstance3D` as child $\rightarrow$ Assign a `BoxMesh`.
3. Add `Camera3D` $\rightarrow$ Move it back (Z = 5) and point it at the box.
4. Add `DirectionalLight3D` for lighting.
