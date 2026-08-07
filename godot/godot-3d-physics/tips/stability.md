# Physics Stability Tips

### The `_physics_process` Rule
**Prohibition**: Never put physics-related code (`move_and_slide`, `apply_force`) in `_process`.
**Reason**: `_process` runs as fast as the GPU can render, causing physics to be inconsistent across different computers. `_physics_process` runs at a fixed rate (default 60Hz).

### Interpolation
- **Description**: Physics interpolation helps smooth movement between frames by predicting positions based on physics calculations.
- **Tip**:
  - Use `_physics_process` instead of `_process` for accurate physics interpolation.
  - Set `physics_process_mode` to `PHYSICS_PROCESS_MODE_INTERPOLATED` for smoother movement.
  - Avoid excessive interpolation for fast-moving objects, as it can cause jitter.

### Avoid Direct Teleportation
**Prohibition**: Avoid setting `global_position` or `global_transform` every frame. This "teleports" the body, causing it to tunnel through walls.
**Correct**: Use `velocity` and `move_and_slide()` or apply forces to a `RigidBody3D`.

### Collision Complexity
**Tip**: Use **Compound Shapes**. Instead of one complex Mesh collision, use a group of 3-4 simple boxes/spheres. It is significantly faster and more stable.

### RigidBody3D
- **Description**: Use RigidBody3D for physics-based objects.
- **Tip**:
  - Set `mass` appropriately to avoid unrealistic movement.
  - Use `linear_damping` and `angular_damping` to control movement.
  - Enable `gravity` only if needed to avoid unnecessary calculations.

### CharacterBody3D
- **Description**: Use CharacterBody3D for player-controlled characters.
- **Tip**:
  - Use `_physics_process` for accurate movement.
  - Set `move_and_slide` or `move_and_collide` based on your needs.
  - Use `velocity` and `velocity_override` for precise control.

### Joints
- **Description**: Use joints to connect physics bodies.
- **Tip**:
  - Use `HingeJoint3D`, `BallJoint3D`, or `FixedJoint3D` based on your needs.
  - Avoid overly complex joint configurations that can cause instability.
  - Use `joint_preset` for common joint configurations.

### Physics Server
- **Description**: The Physics Server manages all physics calculations.
- **Tip**:
  - Use `PhysicsServer.space_create` to create physics spaces for better organization.
  - Use `PhysicsServer.space_get_physics_process_mode` to control interpolation.
  - Avoid creating too many physics spaces, as it can increase overhead.

### Continuous Collision Detection
- **Description**: Use continuous collision detection for fast-moving objects.
- **Tip**:
  - Enable `continuous_collision` for objects that move quickly.
  - Use `PhysicsServer3D.space_create` with `PhysicsServer3D.space_set_continuous_collision_mode` for better accuracy.

### Gravity
- **Description**: Adjust gravity settings for realistic movement.
- **Tip**:
  - Set `gravity` in `Project Settings` -> `Physics` -> `3D`.
  - Use `RigidBody3D.gravity_scale` to adjust gravity per object.
  - Avoid setting gravity to zero unless necessary, as it can cause instability in physics calculations.

### Sleeping and Waking
- **Description**: Physics bodies can sleep to save computation.
- **Tip**:
  - Use `RigidBody3D.sleeping` to control whether a body sleeps.
  - Avoid waking too many bodies at once, as it can cause performance spikes.
  - Use `PhysicsServer3D.space_wake_all_bodies` to wake all bodies in a space.