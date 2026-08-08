# 3D Physics Bodies
Different ways to handle movement and collision.

### Body Types
- `StaticBody3D`: For things that never move (Floors, Walls).
- `RigidBody3D`: Fully simulated (Bouncing balls, falling crates). Uses forces and impulses.
- `CharacterBody3D`: Script-driven movement (Players, NPCs). Stops at walls.
- `AnimatableBody3D`: For moving platforms. Script-moved but acts as a solid wall.

### Collision Shapes
Every body needs a `CollisionShape3D`.
- **Sphere**: Fastest.
- **Box/Capsule**: Fast.
- **ConvexHull**: Medium.
- **Concave/Mesh**: Slowest. Only use for Static bodies.
