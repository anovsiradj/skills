# Prototyping Workflow
How to move from blocks to a final game.

### The Grey-Boxing Loop
1. Use CSG nodes to block out the level layout.
2. Playtest for scale and flow.
3. Refine the shapes.
4. **Bake to Mesh**: Once satisfied, use the "Bake Mesh Instance" option in the CSG menu.
5. Replace the baked mesh with a high-fidelity asset from Blender.

### Using CSGPolygon3D
To create a complex room layout:
1. Draw the floor plan using the points in `CSGPolygon3D`.
2. Set the `Mode` to `Depth`.
3. Adjust the `Depth` value to "push" the walls up.
