# CSG (Constructive Solid Geometry)
Tools for fast prototyping and "grey-boxing".

### Core Concepts
- **Addition**: Adds a shape to the mesh.
- **Subtraction**: Carves a hole using the shape.
- **Intersection**: Keeps only the area where shapes overlap.

### Key Classes
- `CSGBox3D`, `CSGSphere3D`, `CSGCylinder3D`: Basic primitives.
- `CSGPolygon3D`: Extrudes a 2D shape into 3D (great for walls/pipes).
- `CSGCombiner3D`: Organizes CSG nodes.

### Example: Carving a Doorway
1. Create a large `CSGBox3D` (The Wall).
2. Create a smaller `CSGBox3D` (The Door shape).
3. Make the Door box a child of the Wall box.
4. Set the Door box operation to **Subtraction**.
