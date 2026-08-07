---
name: godot-2d-physics
description: Godot Engine 2D physics, rigid bodies, joints, and collision detection.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Physics

## Overview
Godot Engine's 2D physics system provides a robust and flexible physics simulation for 2D games. This skill covers everything you need to know to create realistic physics interactions in Godot 4.7.

## Key Insights

### Physics Body Types
- **StaticBody2D**: Objects that don't move and act as immovable obstacles
- **AnimatableBody2D**: Objects that move only through script or animation (doors, platforms)
- **RigidBody2D**: Objects affected by gravity and forces
- **CharacterBody2D**: Objects designed for player characters with special collision handling

### Collision Shapes
- **Built-in Shapes**: Line, box, circle, capsule, world boundary (infinite plane)
- **Collision Polygons**: Manually drawn or generated from sprites in the editor
- **One-Way Platforms**: Special collision shapes that allow movement in one direction

### Physics Joints
- **PinJoint2D**: Connects two bodies at a single point
- **GrooveJoint2D**: Constrains movement along a line
- **DampedSpringJoint2D**: Connects two bodies with a spring
- **Area2D**: Detects when bodies enter or leave a specific area

## Major Version Differences (3.x vs 4.x)

### Physics Engine Changes
- **Physics Interpolation**: Improved physics interpolation for smoother gameplay
- **Collision Layers**: Enhanced collision layer and mask system for better control
- **Sleep Optimization**: Better sleep/wake optimization for performance
- **Continuous Collision Detection**: Improved CCD for fast-moving objects

### Performance Improvements
- **Better Sleep/Wake**: Objects sleep when not moving to save CPU
- **CCD Support**: Continuous collision detection prevents tunneling
- **Layer/Mask System**: More granular control over collision detection

## New Features in Godot 4.7

### Physics Interpolation
- **Improved Stability**: Better physics interpolation for smoother gameplay
- **Reduced Jitter**: Less physics jitter in fast-moving scenarios

### Collision Detection
- **CCD for Fast Objects**: Better support for continuous collision detection
- **Layer/Mask Optimization**: Improved layer/mask system for better performance

## Technical Implementation

### File: rigid_body_2d.gd
```gdscript
extends RigidBody2D

@export_group("Physics Properties")
@export var mass: float = 1.0
@export var gravity_scale: float = 1.0
@export var linear_damp: float = 0.1
@export var angular_damp: float = 0.1
@export var lock_rotation: bool = false

@export_group("Movement")
@export var apply_impulse: bool = false
@export var impulse_vector: Vector2 = Vector2.ZERO
@export var apply_torque: bool = false
@export var torque: float = 0.0

func _ready() -> void:
    # Set up physics properties
    inertia = mass * 1000.0  # Approximate moment of inertia
    if lock_rotation:
        freeze = true
        freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC

func _process(delta: float) -> void:
    if apply_impulse:
        apply_impulse(impulse_vector, Vector2.ZERO)
        apply_impulse = false

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
    if apply_torque:
        state.apply_torque(torque)
        apply_torque = false
```

### File: character_body_2d.gd
```gdscript
extends CharacterBody2D

@export_group("Movement Properties")
@export var speed: float = 200.0
@export var jump_height: float = 300.0
@export var gravity: float = 980.0
@export var friction: float = 0.2
@export var bounce: float = 0.1

@export_group("Input")
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
    var input_vector = Vector2.ZERO
    
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
        if collider is RigidBody2D:
            # Apply bounce
            velocity = velocity.bounce(collision.get_normal()) * bounce
        elif collider is CharacterBody2D:
            # Push other character
            collider.velocity += collision.get_normal() * speed * 0.5
```

### File: joint_system.gd
```gdscript
extends Node2D

@export_group("Joint Properties")
@export var joint_type: int = 0
@export var body_a: RigidBody2D
@export var body_b: RigidBody2D
@export var anchor_a: Vector2 = Vector2.ZERO
@export var anchor_b: Vector2 = Vector2.ZERO

@export_group("Spring Properties")
@export var stiffness: float = 50.0
@export var damping: float = 5.0
@export var rest_length: float = 100.0

func _ready() -> void:
    # Create the appropriate joint type
    match joint_type:
        0:  # PinJoint2D
            var joint = PinJoint2D.new()
            joint.position_a = anchor_a
            joint.position_b = anchor_b
            if body_a and body_b:
                add_child(joint)
                joint.node_a = body_a.get_path()
                joint.node_b = body_b.get_path()
        
        1:  # DampedSpringJoint2D
            var joint = DampedSpringJoint2D.new()
            joint.position_a = anchor_a
            joint.position_b = anchor_b
            joint.damping = damping
            joint.stiffness = stiffness
            joint.rest_length = rest_length
            if body_a and body_b:
                add_child(joint)
                joint.node_a = body_a.get_path()
                joint.node_b = body_b.get_path()
```

### File: collision_detection.gd
```gdscript
extends Node2D

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
        var shape = CollisionShape2D.new()
        shape.shape = RectangleShape2D.new()
        shape.shape.extents = Vector2(32, 1)
        add_child(shape)
    
    # Set up area if needed
    if area_type != 0:
        var area = Area2D.new()
        area.collision_layer = collision_layer
        area.collision_mask = collision_mask
        add_child(area)

func _on_body_entered(body: Node2D) -> void:
    print(enter_message)

func _on_body_exited(body: Node2D) -> void:
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

### One-Way Platforms
- **Special Collision**: Special collision shapes that allow movement in one direction only
- **Margin Control**: The `one_way_margin` property controls how far objects can fall through
- **Performance Cost**: Requires more processing for collision detection

## Recommendations

### For Character Movement
- **Use CharacterBody2D**: Always use `CharacterBody2D` for player characters
- **Combine with CollisionPolygon2D**: Use `CollisionPolygon2D` for precise collision shapes
- **Optimize Input**: Use `Input.get_action_strength()` for smoother input handling

### For Rigid Bodies
- **Set Mass Properties**: Always set appropriate mass and inertia for realistic physics
- **Use CCD for Fast Objects**: Use continuous collision detection for fast-moving objects
- **Optimize Damping**: Use appropriate damping values for realistic motion

### For Joints
- **Use DampedSpringJoint2D**: Use `DampedSpringJoint2D` for more realistic spring behavior
- **Adjust Stiffness**: Adjust stiffness and damping for desired behavior
- **Test in Editor**: Always test joints in the editor for proper setup

### For Collision Detection
- **Use CollisionLayers**: Use collision layers and masks for better control
- **Optimize Shapes**: Use simple shapes for better performance
- **Test Collision**: Always test collision in the editor for proper setup

## Prohibitions

### Performance Issues
- **Unlimited Rigid Bodies**: Avoid creating unlimited `RigidBody2D` nodes without proper cleanup
- **Complex Joints**: Avoid using overly complex joint systems without optimization
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

### One-Way Platforms
- **Incorrect Margin**: Incorrect `one_way_margin` can cause issues with platform movement
- **Performance Issues**: One-way platforms can cause performance issues
- **Testing**: One-way platforms require extensive testing

## ELI5: Physics Interpolation

Imagine you're watching a video of a ball rolling down a hill. The video has a fixed frame rate (like 60 frames per second). If the ball moves too fast between frames, you might see it jump or teleport. Physics interpolation is like adding extra frames between the recorded ones to make the ball move more smoothly, so it looks like it's actually rolling smoothly.

### Example: Setting Up Physics Interpolation
```gdscript
extends RigidBody2D

func _ready() -> void:
    # Enable physics interpolation
    physics_interpolation = true
    
    # Set up the rigid body
    mass = 1.0
    gravity_scale = 1.0
    
    # Add a collision shape
    var shape = CollisionShape2D.new()
    shape.shape = CircleShape2D.new()
    shape.shape.radius = 32.0
    add_child(shape)
```

## ELI5: Sleep/Wake System

Imagine you have a bunch of toys on a table. Most of the time, the toys don't move, so you don't need to watch them constantly. But if you push one toy, it starts moving, and you need to watch it until it stops. In Godot's physics system, objects automatically "sleep" when they're not moving to save CPU, and "wake up" when they start moving.

### Example: Setting Up Sleep/Wake
```gdscript
extends RigidBody2D

func _ready() -> void:
    # Set up the rigid body
    mass = 1.0
    gravity_scale = 1.0
    
    # Enable sleep
    can_sleep = true
    
    # Set up the collision shape
    var shape = CollisionShape2D.new()
    shape.shape = RectangleShape2D.new()
    shape.shape.extents = Vector2(32, 32)
    add_child(shape)

func _process(delta: float) -> void:
    # Wake up the object
    if Input.is_action_just_pressed("wake_up"):
        wake_up()
```

## ELI5: One-Way Platforms

Imagine you have a ladder. You can climb up the ladder, but you can't climb down it. In Godot, you can create one-way platforms that allow movement in one direction only, like a floor that you can jump on but can't fall through.

### Example: Setting Up One-Way Platform
```gdscript
extends StaticBody2D

func _ready() -> void:
    # Set up the static body
    var shape = CollisionShape2D.new()
    shape.shape = RectangleShape2D.new()
    shape.shape.extents = Vector2(64, 16)
    add_child(shape)
    
    # Set up one-way platform
    var one_way_shape = CollisionShape2D.new()
    one_way_shape.shape = RectangleShape2D.new()
    one_way_shape.shape.extents = Vector2(64, 16)
    one_way_shape.position = Vector2(0, 16)
    one_way_shape.one_way_collision = true
    one_way_shape.one_way_collision_margin = 16.0
    add_child(one_way_shape)
```

## ELI5: Joints

Imagine you have two toys connected by a string. The string keeps them at a certain distance from each other but allows them to move around. In Godot, you can create joints that connect two physics bodies with different types of constraints.

### Example: Setting Up Joints
```gdscript
extends Node2D

func _ready() -> void:
    # Create two rigid bodies
    var body_a = RigidBody2D.new()
    body_a.position = Vector2(100, 100)
    add_child(body_a)
    
    var body_b = RigidBody2D.new()
    body_b.position = Vector2(200, 200)
    add_child(body_b)
    
    # Create a pin joint between them
    var joint = PinJoint2D.new()
    joint.position_a = Vector2(50, 50)
    joint.position_b = Vector2(50, 50)
    joint.node_a = body_a.get_path()
    joint.node_b = body_b.get_path()
    add_child(joint)
```

## Best Practices Summary

1. **Always use CharacterBody2D** for player characters
2. **Use CCD for fast-moving objects** to prevent tunneling
3. **Optimize sleep/wake settings** for better performance
4. **Use simple collision shapes** for better performance
5. **Test collision in editor** for proper setup
6. **Use appropriate damping** for realistic motion
7. **Set mass properties** for realistic physics
8. **Use one-way platforms** for platforms that only allow upward movement
9. **Always clean up** unused physics nodes to prevent memory leaks
10. **Test physics** thoroughly in the editor before deployment
