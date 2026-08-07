---
name: godot-3d-physics
description: Godot Engine 3D physics, rigid bodies, joints, and collision detection.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# 3D Physics

## Overview
Godot Engine's 3D physics system provides a robust and flexible physics simulation for 3D games. This skill covers everything you need to know to create realistic physics interactions in Godot 4.7.

## Key Insights

### Physics Body Types
- **StaticBody3D**: Objects that don't move and act as immovable obstacles
- **AnimatableBody3D**: Objects that move only through script or animation (doors, platforms)
- **RigidBody3D**: Objects affected by gravity and forces
- **CharacterBody3D**: Objects designed for player characters with special collision handling

### Collision Shapes
- **Built-in Shapes**: Cuboid, sphere, capsule, cylinder, world boundary (infinite plane)
- **Mesh Shapes**: Generate triangle collision shapes for any mesh from the editor
- **Convex Shapes**: Generate one or several convex collision shapes for any mesh from the editor
- **Soft Bodies**: Deformable physics bodies

### Physics Joints
- **PinJoint3D**: Connects two bodies at a single point
- **HingeJoint3D**: Constrains rotation around a single axis
- **ConeTwistJoint3D**: Constrains rotation with a cone
- **Generic6DOFJoint3D**: Generic 6 degrees of freedom joint
- **SpringJoint3D**: Connects two bodies with a spring
- **Area3D**: Detects when bodies enter or leave a specific area

## Major Version Differences (3.x vs 4.x)

### Physics Engine Changes
- **Physics Interpolation**: Improved physics interpolation for smoother gameplay
- **Collision Layers**: Enhanced collision layer and mask system for better control
- **Sleep Optimization**: Better sleep/wake optimization for performance
- **Continuous Collision Detection**: Improved CCD for fast-moving objects
- **Soft Body Physics**: New soft body physics system

### Performance Improvements
- **Better Sleep/Wake**: Objects sleep when not moving to save CPU
- **CCD Support**: Continuous collision detection prevents tunneling
- **Layer/Mask System**: More granular control over collision detection
- **Soft Body Optimization**: Improved performance for soft body physics

## New Features in Godot 4.7

### Physics Interpolation
- **Improved Stability**: Better physics interpolation for smoother gameplay
- **Reduced Jitter**: Less physics jitter in fast-moving scenarios

### Collision Detection
- **CCD for Fast Objects**: Better support for continuous collision detection
- **Layer/Mask Optimization**: Improved layer/mask system for better performance

### Soft Body Physics
- **Deformable Bodies**: New support for deformable physics bodies
- **Performance Optimization**: Improved performance for soft body physics
- **Better Integration**: Better integration with other physics systems

## Technical Implementation

### File: rigid_body_3d.gd
```gdscript
extends RigidBody3D

@export_group("Physics Properties")
@export var mass: float = 1.0
@export var gravity_scale: float = 1.0
@export var linear_damp: float = 0.1
@export var angular_damp: float = 0.1
@export var lock_rotation: bool = false
@export var freeze: bool = false

@export_group("Movement")
@export var apply_impulse: bool = false
@export var impulse_vector: Vector3 = Vector3.ZERO
@export var apply_torque: bool = false
@export var torque: float = 0.0

func _ready() -> void:
    # Set up physics properties
    inertia = mass * 1000.0  # Approximate moment of inertia
    if lock_rotation:
        freeze = true
        freeze_mode = RigidBody3D.FREEZE_MODE_KINEMATIC

func _process(delta: float) -> void:
    if apply_impulse:
        apply_impulse(impulse_vector, Vector3.ZERO)
        apply_impulse = false

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
    if apply_torque:
        state.apply_torque(torque)
        apply_torque = false
```

### File: character_body_3d.gd
```gdscript
extends CharacterBody3D

@export_group("Movement Properties")
@export var speed: float = 200.0
@export var jump_height: float = 300.0
@export var gravity: float = 980.0
@export var friction: float = 0.2
@export var bounce: float = 0.1

@export_group("Input")
@export var move_forward: String = "ui_up"
@export var move_backward: String = "ui_down"
@export var move_left: String = "ui_left"
@export var move_right: String = "ui_right"
@export var jump_action: String = "ui_accept"

@export_group("Collision")
@export var collision_layer: int = 1
@export var collision_mask: int = 1

func _ready() -> void:
    # Set up collision properties
    collision_layer = 1 << collision_layer
    collision_mask = 1 << collision_mask

func _physics_process(delta: float) -> void:
    var input_vector = Vector3.ZERO
    
    if Input.is_action_pressed(move_forward):
        input_vector.z -= 1.0
    if Input.is_action_pressed(move_backward):
        input_vector.z += 1.0
    if Input.is_action_pressed(move_left):
        input_vector.x -= 1.0
    if Input.is_action_pressed(move_right):
        input_vector.x += 1.0
    
    # Apply movement
    var velocity = velocity + input_vector.normalized() * speed * delta
    velocity = velocity * (1.0 - friction)
    
    # Apply gravity
    velocity.y += gravity * delta
    
    # Jump
    if Input.is_action_just_pressed(jump_action) and is_on_floor():
        velocity.y = -jump_height
    
    # Move the character
    var collision = move_and_collide(velocity * delta)
    
    if collision:
        # Handle collision
        var collider = collision.get_collider()
        if collider is RigidBody3D:
            # Apply bounce
            velocity = velocity.bounce(collision.get_normal()) * bounce
        elif collider is CharacterBody3D:
            # Push other character
            collider.velocity += collision.get_normal() * speed * 0.5
```

### File: joint_system.gd
```gdscript
extends Node3D

@export_group("Joint Properties")
@export var joint_type: int = 0
@export var body_a: RigidBody3D
@export var body_b: RigidBody3D
@export var anchor_a: Vector3 = Vector3.ZERO
@export var anchor_b: Vector3 = Vector3.ZERO

@export_group("Spring Properties")
@export var stiffness: float = 50.0
@export var damping: float = 5.0
@export var rest_length: float = 100.0

@export_group("Hinge Properties")
@export var angle_limit: float = 0.0
@export var motor_enabled: bool = false
@export var motor_speed: float = 0.0

func _ready() -> void:
    # Create the appropriate joint type
    match joint_type:
        0:  # PinJoint3D
            var joint = PinJoint3D.new()
            joint.position_a = anchor_a
            joint.position_b = anchor_b
            if body_a and body_b:
                add_child(joint)
                joint.node_a = body_a.get_path()
                joint.node_b = body_b.get_path()
        
        1:  # HingeJoint3D
            var joint = HingeJoint3D.new()
            joint.position_a = anchor_a
            joint.position_b = anchor_b
            joint.angle_limit = angle_limit
            joint.motor_enabled = motor_enabled
            joint.motor_speed = motor_speed
            if body_a and body_b:
                add_child(joint)
                joint.node_a = body_a.get_path()
                joint.node_b = body_b.get_path()
        
        2:  # SpringJoint3D
            var joint = SpringJoint3D.new()
            joint.position_a = anchor_a
            joint.position_b = anchor_b
            joint.stiffness = stiffness
            joint.damping = damping
            joint.rest_length = rest_length
            if body_a and body_b:
                add_child(joint)
                joint.node_a = body_a.get_path()
                joint.node_b = body_b.get_path()
```

### File: soft_body.gd
```gdscript
extends SoftBody3D

@export_group("Soft Body Properties")
@export var mass: float = 1.0
@export var stiffness: float = 1.0
@export var damping: float = 0.1
@export var pressure: float = 0.0

@export_group("Collision")
@export var collision_layer: int = 1
@export var collision_mask: int = 1

@export_group("Visualization")
@export var visualize_mesh: bool = false
@export var visualize_collision: bool = false

func _ready() -> void:
    # Set up soft body properties
    mass = mass
    stiffness = stiffness
    damping = damping
    pressure = pressure
    
    # Set up collision properties
    collision_layer = 1 << collision_layer
    collision_mask = 1 << collision_mask
    
    # Set up visualization
    if visualize_mesh:
        # Visualize the mesh
        var mesh_instance = MeshInstance3D.new()
        mesh_instance.mesh = mesh
        add_child(mesh_instance)
    
    if visualize_collision:
        # Visualize the collision
        var collision_shape = CollisionShape3D.new()
        collision_shape.shape = shape
        add_child(collision_shape)
```

### File: collision_detection.gd
```gdscript
extends Node3D

@export_group("Collision Properties")
@export var collision_layer: int = 1
@export var collision_mask: int = 1
@export var one_way_platform: bool = false
@export var one_way_margin: float = 16.0

@export_group("Area Properties")
@export var area_type: int = 0
@export var enter_message: String = "Body entered area"
@export var exit_message: String = "Body left area"

func _ready() -> void:
    # Set up collision properties
    if one_way_platform:
        # Set up one-way platform
        var shape = CollisionShape3D.new()
        shape.shape = BoxShape3D.new()
        shape.shape.size = Vector3(32, 1, 32)
        add_child(shape)
    
    # Set up area if needed
    if area_type != 0:
        var area = Area3D.new()
        area.collision_layer = collision_layer
        area.collision_mask = collision_mask
        add_child(area)

func _on_body_entered(body: Node3D) -> void:
    print(enter_message)

func _on_body_exited(body: Node3D) -> void:
    print(exit_message)
```

## Unusual Things

### Physics Interpolation
- **Smooth Gameplay**: Physics interpolation makes gameplay smoother by interpolating between physics steps
- **Performance Cost**: Requires more CPU for the interpolation calculations
- **Best for Fast Objects**: Most useful for fast-moving objects like bullets

### Sleep/Wake System
- **Automatic Optimization**: Objects automatically sleep when not moving to save CPU
- **Wakeup Thresholds**: Objects wake up when forces exceed certain thresholds
- **Manual Control**: Can manually control sleep/wake states

### Soft Body Physics
- **Deformable Bodies**: Soft body physics allows for deformable physics bodies
- **Performance Cost**: Requires significant CPU resources
- **Complex Setup**: Soft body physics requires complex setup

### One-Way Platforms
- **Special Collision**: Special collision shapes that allow movement in one direction only
- **Margin Control**: The `one_way_margin` property controls how far objects can fall through
- **Performance Cost**: Requires more processing for collision detection

## Recommendations

### For Character Movement
- **Use CharacterBody3D**: Always use `CharacterBody3D` for player characters
- **Combine with CollisionShape3D**: Use `CollisionShape3D` for precise collision shapes
- **Optimize Input**: Use `Input.get_action_strength()` for smoother input handling

### For Rigid Bodies
- **Set Mass Properties**: Always set appropriate mass and inertia for realistic physics
- **Use CCD for Fast Objects**: Use continuous collision detection for fast-moving objects
- **Optimize Damping**: Use appropriate damping values for realistic motion

### For Joints
- **Use HingeJoint3D**: Use `HingeJoint3D` for hinge-like movements
- **Use SpringJoint3D**: Use `SpringJoint3D` for spring-like movements
- **Use PinJoint3D**: Use `PinJoint3D` for pin-like movements
- **Adjust Parameters**: Adjust joint parameters for desired behavior
- **Test in Editor**: Always test joints in the editor for proper setup

### For Soft Bodies
- **Use Simple Meshes**: Use simple meshes for better performance
- **Optimize Stiffness**: Use appropriate stiffness values for desired behavior
- **Use Damping**: Use damping to reduce oscillations
- **Test in Editor**: Always test soft bodies in the editor for proper setup

## Prohibitions

### Performance Issues
- **Unlimited Rigid Bodies**: Avoid creating unlimited `RigidBody3D` nodes without proper cleanup
- **Complex Joints**: Avoid using overly complex joint systems without optimization
- **Unbounded Soft Bodies**: Avoid creating unbounded soft body systems without optimization
- **Unbounded Collisions**: Avoid creating collision systems that can cause infinite loops

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between physics bodies
- **Unused Nodes**: Remove unused physics nodes from the scene tree to prevent memory leaks

## Pitfalls

### Physics Interpolation
- **Incorrect Setup**: Incorrect physics interpolation setup can cause visual glitches
- **Performance Issues**: Too much interpolation can cause performance issues
- **Frame Rate Dependency**: Interpolation can be frame rate dependent

### Sleep/Wake System
- **Unexpected Wakes**: Objects can wake up unexpectedly due to forces
- **Performance Issues**: Incorrect sleep/wake settings can cause performance issues
- **Debugging**: Sleep/wake issues can be difficult to debug

### Soft Body Physics
- **Performance Issues**: Soft body physics can cause performance issues
- **Complex Setup**: Soft body physics requires complex setup
- **Testing**: Soft body physics requires extensive testing

### One-Way Platforms
- **Incorrect Margin**: Incorrect `one_way_margin` can cause issues with platform movement
- **Performance Issues**: One-way platforms can cause performance issues
- **Testing**: One-way platforms require extensive testing

## ELI5: Physics Interpolation

Imagine you're watching a video of a ball rolling down a hill. The video has a fixed frame rate (like 60 frames per second). If the ball moves too fast between frames, you might see it jump or teleport. Physics interpolation is like adding extra frames between the recorded ones to make the ball move more smoothly, so it looks like it's actually rolling smoothly.

### Example: Setting Up Physics Interpolation
```gdscript
extends RigidBody3D

func _ready() -> void:
    # Enable physics interpolation
    physics_interpolation = true
    
    # Set up the rigid body
    mass = 1.0
    gravity_scale = 1.0
    
    # Add a collision shape
    var shape = CollisionShape3D.new()
    shape.shape = BoxShape3D.new()
    shape.shape.size = Vector3(32, 32, 32)
    add_child(shape)
```

## ELI5: Sleep/Wake System

Imagine you have a bunch of toys on a table. Most of the time, the toys don't move, so you don't need to watch them constantly. But if you push one toy, it starts moving, and you need to watch it until it stops. In Godot's physics system, objects automatically "sleep" when they're not moving to save CPU, and "wake up" when they start moving.

### Example: Setting Up Sleep/Wake
```gdscript
extends RigidBody3D

func _ready() -> void:
    # Set up the rigid body
    mass = 1.0
    gravity_scale = 1.0
    
    # Enable sleep
    can_sleep = true
    
    # Set up the collision shape
    var shape = CollisionShape3D.new()
    shape.shape = BoxShape3D.new()
    shape.shape.size = Vector3(32, 32, 32)
    add_child(shape)

func _process(delta: float) -> void:
    # Wake up the object
    if Input.is_action_just_pressed("wake_up"):
        wake_up()
```

## ELI5: Soft Body Physics

Imagine you have a piece of clay. You can stretch, compress, and bend the clay, and it will deform realistically. Soft body physics is like giving your 3D objects the ability to deform like clay.

### Example: Setting Up Soft Body Physics
```gdscript
extends SoftBody3D

func _ready() -> void:
    # Create a soft body
    var soft_body = SoftBody3D.new()
    soft_body.mass = 1.0
    soft_body.stiffness = 1.0
    soft_body.damping = 0.1
    soft_body.pressure = 0.0
    
    # Add a mesh
    var mesh = ArrayMesh.new()
    # Add vertices to the mesh
    var surface_tool = SurfaceTool.new()
    surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
    surface_tool.add_vertex(Vector3(0, 0, 0))
    surface_tool.add_vertex(Vector3(32, 0, 0))
    surface_tool.add_vertex(Vector3(32, 32, 0))
    surface_tool.add_vertex(Vector3(0, 32, 0))
    surface_tool.commit(mesh)
    
    soft_body.mesh = mesh
    add_child(soft_body)
```

## ELI5: One-Way Platforms

Imagine you have a ladder. You can climb up the ladder, but you can't climb down it. In Godot, you can create one-way platforms that allow movement in one direction only, like a floor that you can jump on but can't fall through.

### Example: Setting Up One-Way Platform
```gdscript
extends StaticBody3D

func _ready() -> void:
    # Set up the static body
    var shape = CollisionShape3D.new()
    shape.shape = BoxShape3D.new()
    shape.shape.size = Vector3(64, 16, 64)
    add_child(shape)
    
    # Set up one-way platform
    var one_way_shape = CollisionShape3D.new()
    one_way_shape.shape = BoxShape3D.new()
    one_way_shape.shape.size = Vector3(64, 16, 64)
    one_way_shape.position = Vector3(0, 8, 0)
    one_way_shape.one_way_collision = true
    one_way_shape.one_way_collision_margin = 16.0
    add_child(one_way_shape)
```

## ELI5: Joints

Imagine you have two toys connected by a string. The string keeps them at a certain distance from each other but allows them to move around. In Godot, you can create joints that connect two physics bodies with different types of constraints.

### Example: Setting Up Joints
```gdscript
extends Node3D

func _ready() -> void:
    # Create two rigid bodies
    var body_a = RigidBody3D.new()
    body_a.position = Vector3(100, 100, 0)
    add_child(body_a)
    
    var body_b = RigidBody3D.new()
    body_b.position = Vector3(200, 200, 0)
    add_child(body_b)
    
    # Create a pin joint between them
    var joint = PinJoint3D.new()
    joint.position_a = Vector3(50, 50, 0)
    joint.position_b = Vector3(50, 50, 0)
    joint.node_a = body_a.get_path()
    joint.node_b = body_b.get_path()
    add_child(joint)
```

## Best Practices Summary

1. **Always use CharacterBody3D** for player characters
2. **Use CCD for fast-moving objects** to prevent tunneling
3. **Optimize sleep/wake settings** for better performance
4. **Use simple collision shapes** for better performance
5. **Test collision in editor** for proper setup
6. **Use appropriate damping** for realistic motion
7. **Set mass properties** for realistic physics
8. **Use one-way platforms** for platforms that only allow upward movement
9. **Use soft body physics** for deformable objects
10. **Always clean up** unused physics nodes to prevent memory leaks
11. **Test physics** thoroughly in the editor before deployment
