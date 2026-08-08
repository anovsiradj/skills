# 2D Physics Bodies
The building blocks of a physical world.

### Body Types
- `StaticBody2D`: Non-moving (Walls, Ground).
- `RigidBody2D`: Simulates physics (Balls, Crates). Uses `linear_velocity`.
- `CharacterBody2D`: Controlled by script (Player, Enemy). Uses `move_and_slide()`.
- `AnimatableBody2D`: Moved by script/animation but acts as a static body (Moving platforms).

### Collision Shapes
Every body needs a `CollisionShape2D` child. Common shapes:
- `RectangleShape2D`
- `CircleShape2D`
- `CapsuleShape2D`
- `CollisionPolygon2D` (More expensive, use sparingly).
