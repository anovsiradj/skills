# Physics Stability Tips

### The `_physics_process` Rule
**Prohibition**: Never put physics-related code (`move_and_slide`, `apply_force`) in `_process`.
**Reason**: `_process` runs as fast as the frame rate allows, making physics inconsistent across computers. `_physics_process` runs at a fixed rate (default 60 Hz).

### Avoid Direct Teleportation
**Prohibition**: Avoid setting `global_position`/`global_transform` on a physics body every frame. This "teleports" the body and can cause tunneling through walls.
**Correct**: Use `velocity` + `move_and_slide()` for `CharacterBody3D`, or forces/impulses for `RigidBody3D`.

### Collision Complexity
Use **compound shapes**: 3–4 simple boxes/spheres are significantly faster and more stable than one complex mesh collision.

### RigidBody3D
- Set `mass` appropriately to avoid unrealistic movement.
- Use `linear_damp` and `angular_damp` (Godot 4 names) to control movement.
- Use `apply_force` / `apply_impulse` instead of setting velocity directly.

### Continuous Collision Detection
Enable `continuous_cd` on `RigidBody3D` for fast-moving objects to prevent tunneling through thin walls.

### Gravity
- Set gravity in `Project Settings > Physics > 3D`.
- Use `RigidBody3D.gravity_scale` to adjust gravity per object.

### Sleeping and Waking
- Physics bodies sleep to save computation.
- Avoid waking too many bodies at once — it causes performance spikes.

### Joints
- Use `HingeJoint3D`, `PinJoint3D`, or `ConeTwistJoint3D` based on your needs.
- Avoid overly complex joint configurations that can cause instability.
