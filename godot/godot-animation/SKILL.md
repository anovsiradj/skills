---
name: godot-animation
description: Godot Engine animation system, animation trees, and animation players.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Animation

## Overview
Godot Engine's animation system provides powerful tools for creating animations with features like animation players, animation trees, and animation libraries. This skill covers everything you need to know to create efficient and organized animations in Godot 4.7.

## Key Insights

### Animation Nodes
- **AnimationPlayer**: Node for playing animations
- **AnimationTree**: Node for creating complex animations
- **AnimationLibrary**: Node for organizing animations
- **AnimationMixer**: Node for mixing animations

### Animation Types
- **Tween Animations**: Smooth transitions between values
- **Keyed Animations**: Animations based on keyframes
- **Script Animations**: Animations based on script logic
- **Blend Tree Animations**: Animations based on blend trees

### Animation Features
- **Timeline**: Timeline for controlling animation playback
- **Tracks**: Tracks for controlling different aspects of animation
- **Keys**: Keys for defining animation values
- **Blending**: Blending between different animations

## Major Version Differences (3.x vs 4.x)

### Animation System Changes
- **AnimationTree**: New animation tree system for creating complex animations
- **AnimationLibrary**: New animation library system for organizing animations
- **AnimationMixer**: New animation mixer system for mixing animations
- **Better Performance**: Improved performance for animation playback
- **Enhanced Editor**: Better editor support for animation editing

### Animation Features
- **Timeline**: Enhanced timeline for controlling animation playback
- **Tracks**: Enhanced tracks for controlling different aspects of animation
- **Keys**: Enhanced keys for defining animation values
- **Blending**: Enhanced blending between different animations

## New Features in Godot 4.7

### Animation Features
- **AnimationTree**: Enhanced animation tree system
- **AnimationLibrary**: Enhanced animation library system
- **AnimationMixer**: Enhanced animation mixer system
- **Better Performance**: Improved performance for animation playback
- **Enhanced Editor**: Better editor support for animation editing

### Animation Types
- **Tween Animations**: Enhanced tween animations
- **Keyed Animations**: Enhanced keyed animations
- **Script Animations**: Enhanced script animations
- **Blend Tree Animations**: Enhanced blend tree animations

## Technical Implementation

### File: animation_player.gd
```gdscript
extends AnimationPlayer

@export_group("Animation Properties")
@export var animation_name: String = ""
@export var animation_speed: float = 1.0
@export var animation_loop: bool = true
@export var animation_autoplay: bool = false

@export_group("Playback Properties")
@export var playback_position: float = 0.0
@export var playback_speed: float = 1.0
@export var playback_paused: bool = false

@export_group("Blend Properties")
@export var blend_time: float = 0.0
@export var blend_mode: int = 0

func _ready() -> void:
    # Set up the animation player
    if animation_name:
        play(animation_name)
    
    if animation_autoplay:
        autoplay(animation_name)
    
    playback_speed = animation_speed

func _process(delta: float) -> void:
    # Update playback position
    if !playback_paused:
        playback_position += playback_speed * delta
        seek(playback_position)

func play_animation(name: String, speed: float = 1.0) -> void:
    # Play an animation
    play(name, speed)

func pause_animation() -> void:
    # Pause the animation
    pause()

func resume_animation() -> void:
    # Resume the animation
    play()

func stop_animation() -> void:
    # Stop the animation
    stop()

func blend_animation(name: String, speed: float = 1.0) -> void:
    # Blend an animation
    blend(name, speed, blend_time)
```

### File: animation_tree.gd
```gdscript
extends AnimationTree

@export_group("Animation Tree Properties")
@export var animation_resource: AnimationResource
@export var animation_player: AnimationPlayer
@export var animation_mixer: AnimationMixer

@export_group("Tree Properties")
@export var tree_root: String = ""
@export var tree_active: bool = true

@export_group("Blend Tree Properties")
@export var blend_tree_root: String = ""
@export var blend_tree_active: bool = true

func _ready() -> void:
    # Set up the animation tree
    if animation_resource:
        set_resource(animation_resource)
    
    if animation_player:
        set_animation_player(animation_player)
    
    if animation_mixer:
        set_animation_mixer(animation_mixer)

func _process(delta: float) -> void:
    # Update the animation tree
    if tree_active:
        advance(delta)
    
    if blend_tree_active:
        advance(delta)

func set_animation(name: String, speed: float = 1.0) -> void:
    # Set an animation
    set_animation(name, speed)

func blend_animation(name: String, speed: float = 1.0) -> void:
    # Blend an animation
    set_blend(name, speed)

func pause_animation() -> void:
    # Pause the animation
    set_active(false)

func resume_animation() -> void:
    # Resume the animation
    set_active(true)
```

### File: animation_library.gd
```gdscript
extends AnimationLibrary

@export_group("Animation Library Properties")
@export var animation_name: String = ""
@export var animation_resource: AnimationResource

@export_group("Library Properties")
@export var library_name: String = ""
@export var library_active: bool = true

func _ready() -> void:
    # Set up the animation library
    if animation_name and animation_resource:
        add_animation(animation_name, animation_resource)

func add_animation(name: String, resource: AnimationResource) -> void:
    # Add an animation
    add_animation(name, resource)

func remove_animation(name: String) -> void:
    # Remove an animation
    remove_animation(name)

func get_animation(name: String) -> AnimationResource:
    # Get an animation
    return get_animation(name)

func has_animation(name: String) -> bool:
    # Check if an animation exists
    return has_animation(name)

func get_animation_list() -> Array:
    # Get the list of animations
    return get_animation_list()
```

### File: animation_mixer.gd
```gdscript
extends AnimationMixer

@export_group("Animation Mixer Properties")
@export var animation_resource: AnimationResource
@export var animation_player: AnimationPlayer

@export_group("Mixer Properties")
@export var mixer_name: String = ""
@export var mixer_active: bool = true

@export_group("Blend Properties")
@export var blend_time: float = 0.0
@export var blend_mode: int = 0

func _ready() -> void:
    # Set up the animation mixer
    if animation_resource:
        set_resource(animation_resource)
    
    if animation_player:
        set_animation_player(animation_player)

func _process(delta: float) -> void:
    # Update the animation mixer
    if mixer_active:
        advance(delta)

func add_animation(name: String, resource: AnimationResource) -> void:
    # Add an animation
    add_animation(name, resource)

func remove_animation(name: String) -> void:
    # Remove an animation
    remove_animation(name)

func get_animation(name: String) -> AnimationResource:
    # Get an animation
    return get_animation(name)

func has_animation(name: String) -> bool:
    # Check if an animation exists
    return has_animation(name)

func get_animation_list() -> Array:
    # Get the list of animations
    return get_animation_list()

func blend_animation(name: String, speed: float = 1.0) -> void:
    # Blend an animation
    blend(name, speed, blend_time)
```

## Unusual Things

### Animation Trees
- **Complex Setup**: Animation trees require complex setup
- **Performance Cost**: Animation trees have a performance cost
- **Debugging**: Animation trees can be difficult to debug

### Animation Libraries
- **Organization**: Animation libraries help organize animations
- **Performance Cost**: Animation libraries have a performance cost
- **Memory Usage**: Animation libraries can cause memory usage issues

### Animation Mixers
- **Mixing**: Animation mixers allow mixing different animations
- **Performance Cost**: Animation mixers have a performance cost
- **Complexity**: Animation mixers can be complex

## Recommendations

### For Animation Players
- **Use AnimationPlayer**: Always use `AnimationPlayer` for playing animations
- **Organize Animations**: Organize animations in `AnimationLibrary`
- **Use AnimationTree**: Use `AnimationTree` for complex animations
- **Test in Editor**: Always test animations in the editor

### For Animation Trees
- **Use Simple Trees**: Use simple animation trees for simple animations
- **Optimize Trees**: Optimize animation trees for better performance
- **Test in Editor**: Always test animation trees in the editor

### For Animation Libraries
- **Organize Animations**: Organize animations in `AnimationLibrary`
- **Use AnimationPlayer**: Use `AnimationPlayer` for playing animations
- **Test in Editor**: Always test animations in the editor

### For Animation Mixers
- **Use AnimationMixer**: Use `AnimationMixer` for mixing animations
- **Optimize Mixers**: Optimize animation mixers for better performance
- **Test in Editor**: Always test animations in the editor

## Prohibitions

### Performance Issues
- **Too Many Animations**: Avoid using too many animations without optimization
- **Complex Trees**: Avoid using complex animation trees without optimization
- **Unbounded Libraries**: Avoid creating unbounded animation libraries
- **Unbounded Mixers**: Avoid creating unbounded animation mixers

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Animation Players
- **Incorrect Animation**: Incorrect animation can cause animation to look incorrect
- **Performance Issues**: Too many animations can cause performance issues
- **Memory Usage**: Animations can cause memory usage issues

### Animation Trees
- **Complex Setup**: Animation trees require complex setup
- **Performance Issues**: Complex animation trees can cause performance issues
- **Debugging**: Animation trees can be difficult to debug

### Animation Libraries
- **Organization**: Animation libraries help organize animations
- **Performance Issues**: Animation libraries can cause performance issues
- **Memory Issues**: Animation libraries can cause memory issues

### Animation Mixers
- **Mixing**: Animation mixers allow mixing different animations
- **Performance Issues**: Animation mixers can cause performance issues
- **Complexity**: Animation mixers can be complex

## ELI5: Animation Players

Imagine you have a bunch of recorded videos. You want to play these videos in a specific order, at a specific speed, and loop them. AnimationPlayer is like a video player that can play these animations.

### Example: Using Animation Players
```gdscript
extends AnimationPlayer

func _ready() -> void:
    # Create an animation player
    var animation_player = AnimationPlayer.new()
    add_child(animation_player)
    
    # Add an animation
    var animation = Animation.new()
    animation.length = 2.0
    
    var track = AnimationTrack.new()
    track.type = AnimationTrack.Type.VALUE
    track.path = NodePath("Sprite2D:position")
    
    var key = AnimationKey.new()
    key.time = 0.0
    key.value = Vector2(0, 0)
    track.add_key(key)
    
    key = AnimationKey.new()
    key.time = 1.0
    key.value = Vector2(100, 0)
    track.add_key(key)
    
    animation.add_track(track)
    
    animation_player.add_animation("move", animation)
    
    # Play the animation
    animation_player.play("move")
```

## ELI5: Animation Trees

Imagine you have a bunch of recorded videos and you want to create a complex animation by combining these videos. AnimationTree is like a system that can combine these animations in complex ways.

### Example: Using Animation Trees
```gdscript
extends AnimationTree

func _ready() -> void:
    # Create an animation tree
    var animation_tree = AnimationTree.new()
    add_child(animation_tree)
    
    # Create an animation player
    var animation_player = AnimationPlayer.new()
    animation_tree.set_animation_player(animation_player)
    
    # Add an animation
    var animation = Animation.new()
    animation.length = 2.0
    
    var track = AnimationTrack.new()
    track.type = AnimationTrack.Type.VALUE
    track.path = NodePath("Sprite2D:position")
    
    var key = AnimationKey.new()
    key.time = 0.0
    key.value = Vector2(0, 0)
    track.add_key(key)
    
    key = AnimationKey.new()
    key.time = 1.0
    key.value = Vector2(100, 0)
    track.add_key(key)
    
    animation.add_track(track)
    
    animation_player.add_animation("move", animation)
    
    # Set the animation tree
    animation_tree.set_animation("move", 1.0)
```

## ELI5: Animation Libraries

Imagine you have a bunch of recorded videos and you want to organize them in a library. AnimationLibrary is like a library that can store and organize animations.

### Example: Using Animation Libraries
```gdscript
extends AnimationLibrary

func _ready() -> void:
    # Create an animation library
    var animation_library = AnimationLibrary.new()
    add_child(animation_library)
    
    # Add an animation
    var animation = Animation.new()
    animation.length = 2.0
    
    var track = AnimationTrack.new()
    track.type = AnimationTrack.Type.VALUE
    track.path = NodePath("Sprite2D:position")
    
    var key = AnimationKey.new()
    key.time = 0.0
    key.value = Vector2(0, 0)
    track.add_key(key)
    
    key = AnimationKey.new()
    key.time = 1.0
    key.value = Vector2(100, 0)
    track.add_key(key)
    
    animation.add_track(track)
    
    animation_library.add_animation("move", animation)
```

## ELI5: Animation Mixers

Imagine you have two recorded videos and you want to mix them together. AnimationMixer is like a system that can mix different animations.

### Example: Using Animation Mixers
```gdscript
extends AnimationMixer

func _ready() -> void:
    # Create an animation mixer
    var animation_mixer = AnimationMixer.new()
    add_child(animation_mixer)
    
    # Add an animation
    var animation = Animation.new()
    animation.length = 2.0
    
    var track = AnimationTrack.new()
    track.type = AnimationTrack.Type.VALUE
    track.path = NodePath("Sprite2D:position")
    
    var key = AnimationKey.new()
    key.time = 0.0
    key.value = Vector2(0, 0)
    track.add_key(key)
    
    key = AnimationKey.new()
    key.time = 1.0
    key.value = Vector2(100, 0)
    track.add_key(key)
    
    animation.add_track(track)
    
    animation_mixer.add_animation("move", animation)
    
    # Mix the animation
    animation_mixer.blend_animation("move", 1.0)
```

## Best Practices Summary

1. **Use AnimationPlayer** for playing animations
2. **Organize Animations** in AnimationLibrary
3. **Use AnimationTree** for complex animations
4. **Use AnimationMixer** for mixing animations
5. **Test in Editor** for proper setup
6. **Always clean up** unused nodes to prevent memory leaks
