# Physics Optimization & Tips

### Static vs Animatable
**Never** move a `StaticBody2D` via script. This breaks physics calculations and causes jittery collisions. Use `AnimatableBody2D` for moving platforms.

### Shape Complexity
Order of performance (Fastest to Slowest):
1. Circle
2. Capsule/Box
3. Polygon

**Tip**: Use a few simple boxes instead of one complex polygon for your collision shape.

### Jittery Movement
If your character looks like it's vibrating while moving against a wall, ensure you are using `_physics_process` instead of `_process` for movement logic.
