# 3D Rendering Tips

### The Transparency Gotcha
Avoid using "Alpha" transparency for everything. It causes **sorting issues** where objects behind a transparent surface might disappear or flicker. 
**Rule**: Use "Alpha Scissor" whenever you can get away with it.

### Normal Map Flipping
If you import a normal map from a tool other than Blender and the bumps look like holes, flip the **Green (Y) channel** during import or in a shader.

### Scale Consistency
Always keep your object scales at `(1, 1, 1)`. If you need to resize an object, resize the `Mesh` resource or the mesh in the 3D modeling software. Scaling the `Node3D` can cause issues with physics and children.
