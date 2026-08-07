---
name: godot-input
description: Godot Engine input handling, input mapping, and input events.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Input

## Overview
Godot Engine's input system provides powerful tools for creating games with features like input handling, input mapping, and input events. This skill covers everything you need to know to create efficient and organized input handling in Godot 4.7.

## Key Insights

### Input Nodes
- **Input**: Node for accessing input functionality
- **InputMap**: Node for accessing input mapping functionality
- **InputEvent**: Node for accessing input event functionality
- **InputEventAction**: Node for accessing input event action functionality

### Input Types
- **Keyboard Input**: Input from keyboard
- **Mouse Input**: Input from mouse
- **Touch Input**: Input from touch
- **Joystick Input**: Input from joystick
- **Gesture Input**: Input from gestures

### Input Features
- **Input Mapping**: Input mapping for customizing input behavior
- **Input Events**: Input events for handling input
- **Input Actions**: Input actions for defining input actions
- **Input Gestures**: Input gestures for handling gestures

## Major Version Differences (3.x vs 4.x)

### Input System Changes
- **Input**: New input system for accessing input functionality
- **InputMap**: New input mapping system for customizing input behavior
- **InputEvent**: New input event system for handling input
- **InputEventAction**: New input event action system for defining input actions
- **Better Performance**: Improved performance for input operations
- **Enhanced Editor**: Better editor support for input management

### Input Features
- **Input Mapping**: Enhanced input mapping for customizing input behavior
- **Input Events**: Enhanced input events for handling input
- **Input Actions**: Enhanced input actions for defining input actions
- **Input Gestures**: Enhanced input gestures for handling gestures

## New Features in Godot 4.7

### Input Features
- **Input**: Enhanced input system
- **InputMap**: Enhanced input mapping system
- **InputEvent**: Enhanced input event system
- **InputEventAction**: Enhanced input event action system
- **Better Performance**: Improved performance for input operations
- **Enhanced Editor**: Better editor support for input management

### Input Types
- **Keyboard Input**: Enhanced keyboard input
- **Mouse Input**: Enhanced mouse input
- **Touch Input**: Enhanced touch input
- **Joystick Input**: Enhanced joystick input
- **Gesture Input**: Enhanced gesture input

## Technical Implementation

### File: input.gd
```gdscript
extends Input

@export_group("Input Properties")
@export var input_name: String = ""
@export var input_action: String = ""

@export_group("Input Features")
@export var input_keyboard: bool = false
@export var input_mouse: bool = false
@export var input_touch: bool = false
@export var input_joystick: bool = false
@export var input_gesture: bool = false

func _ready() -> void:
    # Set up the input
    if input_name:
        name = input_name
    
    if input_action:
        action = input_action
    
    if input_keyboard:
        # Handle keyboard input
        pass
    
    if input_mouse:
        # Handle mouse input
        pass
    
    if input_touch:
        # Handle touch input
        pass
    
    if input_joystick:
        # Handle joystick input
        pass
    
    if input_gesture:
        # Handle gesture input
        pass

func _process(delta: float) -> void:
    # Update the input

func is_action_pressed(action: String) -> bool:
    # Check if an action is pressed
    return is_action_pressed(action)

func is_action_just_pressed(action: String) -> bool:
    # Check if an action is just pressed
    return is_action_just_pressed(action)

func is_action_just_released(action: String) -> bool:
    # Check if an action is just released
    return is_action_just_released(action)

func get_action_strength(action: String) -> float:
    # Get the strength of an action
    return get_action_strength(action)

func get_axis_value(axis: String) -> float:
    # Get the value of an axis
    return get_axis_value(axis)
```

### File: input_map.gd
```gdscript
extends InputMap

@export_group("Input Map Properties")
@export var input_map_name: String = ""
@export var input_map_description: String = ""

@export_group("Input Map Features")
@export var input_map_action: bool = false
@export var input_map_event: bool = false

func _ready() -> void:
    # Set up the input map
    if input_map_name:
        name = input_map_name
    
    if input_map_description:
        description = input_map_description
    
    if input_map_action:
        # Add an action
        add_action(input_map_action)
    
    if input_map_event:
        # Add an event
        add_event(input_map_event)

func _process(delta: float) -> void:
    # Update the input map

func add_action(name: String, type: int = 0) -> void:
    # Add an action
    add_action(name, type)

func remove_action(name: String) -> void:
    # Remove an action
    remove_action(name)

func has_action(name: String) -> bool:
    # Check if an action exists
    return has_action(name)

func get_action_list() -> Array:
    # Get the list of actions
    return get_action_list()

func add_event(action: String, event: InputEvent) -> void:
    # Add an event
    add_event(action, event)

func remove_event(action: String, event: InputEvent) -> void:
    # Remove an event
    remove_event(action, event)

func has_event(action: String, event: InputEvent) -> bool:
    # Check if an event exists
    return has_event(action, event)

func get_event_list(action: String) -> Array:
    # Get the list of events
    return get_event_list(action)
```

### File: input_event.gd
```gdscript
extends InputEvent

@export_group("Input Event Properties")
@export var input_event_name: String = ""
@export var input_event_type: int = 0

@export_group("Input Event Features")
@export var input_event_pressed: bool = false
@export var input_event_released: bool = false
@export var input_event_just_pressed: bool = false
@export var input_event_just_released: bool = false

func _ready() -> void:
    # Set up the input event
    if input_event_name:
        name = input_event_name
    
    if input_event_type != 0:
        type = input_event_type
    
    if input_event_pressed:
        pressed = true
    
    if input_event_released:
        released = true
    
    if input_event_just_pressed:
        just_pressed = true
    
    if input_event_just_released:
        just_released = true

func _process(delta: float) -> void:
    # Update the input event

func is_pressed() -> bool:
    # Check if the input event is pressed
    return is_pressed()

func is_released() -> bool:
    # Check if the input event is released
    return is_released()

func is_just_pressed() -> bool:
    # Check if the input event is just pressed
    return is_just_pressed()

func is_just_released() -> bool:
    # Check if the input event is just released
    return is_just_released()

func get_button_index() -> int:
    # Get the button index
    return get_button_index()

func get_position() -> Vector2:
    # Get the position
    return get_position()

func get_global_position() -> Vector2:
    # Get the global position
    return get_global_position()

func get_delta() -> Vector2:
    # Get the delta
    return get_delta()

func get_speed() -> float:
    # Get the speed
    return get_speed()

func get_pressure() -> float:
    # Get the pressure
    return get_pressure()

func get_tilt() -> float:
    # Get the tilt
    return get_tilt()
```

### File: input_event_action.gd
```gdscript
extends InputEventAction

@export_group("Input Event Action Properties")
@export var input_event_action_name: String = ""
@export var input_event_action_type: int = 0

@export_group("Input Event Action Features")
@export var input_event_action_pressed: bool = false
@export var input_event_action_released: bool = false
@export var input_event_action_just_pressed: bool = false
@export var input_event_action_just_released: bool = false

func _ready() -> void:
    # Set up the input event action
    if input_event_action_name:
        name = input_event_action_name
    
    if input_event_action_type != 0:
        type = input_event_action_type
    
    if input_event_action_pressed:
        pressed = true
    
    if input_event_action_released:
        released = true
    
    if input_event_action_just_pressed:
        just_pressed = true
    
    if input_event_action_just_released:
        just_released = true

func _process(delta: float) -> void:
    # Update the input event action

func is_pressed() -> bool:
    # Check if the input event action is pressed
    return is_pressed()

func is_released() -> bool:
    # Check if the input event action is released
    return is_released()

func is_just_pressed() -> bool:
    # Check if the input event action is just pressed
    return is_just_pressed()

func is_just_released() -> bool:
    # Check if the input event action is just released
    return is_just_released()

func get_action() -> String:
    # Get the action
    return get_action()

func get_strength() -> float:
    # Get the strength
    return get_strength()
```

## Unusual Things

### Input System
- **Complex Setup**: Input system requires complex setup
- **Performance Cost**: Input system has a performance cost
- **Debugging**: Input system can be difficult to debug

### Input Mapping
- **Input Mapping**: Input mapping for customizing input behavior
- **Performance Cost**: Input mapping has a performance cost
- **Complexity**: Input mapping can be complex

### Input Events
- **Input Events**: Input events for handling input
- **Performance Cost**: Input events have a performance cost
- **Complexity**: Input events can be complex

### Input Actions
- **Input Actions**: Input actions for defining input actions
- **Performance Cost**: Input actions have a performance cost
- **Complexity**: Input actions can be complex

## Recommendations

### For Input System
- **Use Input**: Always use `Input` for accessing input functionality
- **Use InputMap**: Always use `InputMap` for accessing input mapping functionality
- **Use InputEvent**: Always use `InputEvent` for accessing input event functionality
- **Use InputEventAction**: Always use `InputEventAction` for accessing input event action functionality

### For Input Mapping
- **Use InputMap**: Always use `InputMap` for accessing input mapping functionality
- **Organize Input Actions**: Organize input actions in input map
- **Test in Editor**: Always test in editor

### For Input Events
- **Use InputEvent**: Always use `InputEvent` for accessing input event functionality
- **Organize Input Events**: Organize input events in input map
- **Test in Editor**: Always test in editor

### For Input Actions
- **Use InputEventAction**: Always use `InputEventAction` for accessing input event action functionality
- **Organize Input Actions**: Organize input actions in input map
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Input Actions**: Avoid using too many input actions without optimization
- **Complex Input Mapping**: Avoid using complex input mapping without optimization
- **Unbounded Input Events**: Avoid creating unbounded input events
- **Unbounded Input Actions**: Avoid creating unbounded input actions

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Input System
- **Incorrect Setup**: Incorrect input setup can cause issues
- **Performance Issues**: Complex input system can cause performance issues
- **Debugging**: Input system can be difficult to debug

### Input Mapping
- **Incorrect Setup**: Incorrect input mapping setup can cause issues
- **Performance Issues**: Complex input mapping can cause performance issues
- **Complexity**: Input mapping can be complex

### Input Events
- **Incorrect Setup**: Incorrect input event setup can cause issues
- **Performance Issues**: Complex input events can cause performance issues
- **Complexity**: Input events can be complex

### Input Actions
- **Incorrect Setup**: Incorrect input action setup can cause issues
- **Performance Issues**: Complex input actions can cause performance issues
- **Complexity**: Input actions can be complex

## ELI5: Input System

Imagine you have a bunch of input devices like keyboards, mice, and joysticks. Input system is like a system that can access input from these devices.

### Example: Using Input System
```gdscript
extends Input

func _ready() -> void:
    # Create an input
    var input = Input.new()
    add_child(input)
    
    # Set the input name
    input.name = "My Input"
    
    # Set the input action
    input.action = "move"
    
    # Check if an action is pressed
    if input.is_action_pressed("move"):
        print("Move action is pressed!")
    
    # Check if an action is just pressed
    if input.is_action_just_pressed("jump"):
        print("Jump action is just pressed!")
    
    # Check if an action is just released
    if input.is_action_just_released("shoot"):
        print("Shoot action is just released!")
```

## ELI5: Input Mapping

Imagine you have a bunch of input actions like "move", "jump", and "shoot". Input mapping is like a system that can map input actions to input events.

### Example: Using Input Mapping
```gdscript
extends InputMap

func _ready() -> void:
    # Create an input map
    var input_map = InputMap.new()
    add_child(input_map)
    
    # Set the input map name
    input_map.name = "My Input Map"
    
    # Set the input map description
    input_map.description = "A map for input actions"
    
    # Add an action
    input_map.add_action("move")
    
    # Add an event
    var event = InputEventKey.new()
    event.keycode = KEY_W
    input_map.add_event("move", event)
    
    # Check if an action exists
    if input_map.has_action("move"):
        print("Move action exists!")
    
    # Get the list of actions
    var actions = input_map.get_action_list()
    print(actions)
```

## ELI5: Input Events

Imagine you have a bunch of input events like key presses, mouse clicks, and touch gestures. Input events are like tools that can handle input events.

### Example: Using Input Events
```gdscript
extends InputEvent

func _ready() -> void:
    # Create an input event
    var input_event = InputEvent.new()
    add_child(input_event)
    
    # Set the input event name
    input_event.name = "My Input Event"
    
    # Set the input event type
    input_event.type = InputEvent.KEY
    
    # Check if the input event is pressed
    if input_event.is_pressed():
        print("Input event is pressed!")
    
    # Check if the input event is released
    if input_event.is_released():
        print("Input event is released!")
    
    # Check if the input event is just pressed
    if input_event.is_just_pressed():
        print("Input event is just pressed!")
    
    # Check if the input event is just released
    if input_event.is_just_released():
        print("Input event is just released!")
    
    # Get the button index
    var button_index = input_event.get_button_index()
    print(button_index)
    
    # Get the position
    var position = input_event.get_position()
    print(position)
```

## ELI5: Input Event Action

Imagine you have a bunch of input event actions like "move", "jump", and "shoot". Input event action is like a system that can define input event actions.

### Example: Using Input Event Action
```gdscript
extends InputEventAction

func _ready() -> void:
    # Create an input event action
    var input_event_action = InputEventAction.new()
    add_child(input_event_action)
    
    # Set the input event action name
    input_event_action.name = "My Input Event Action"
    
    # Set the input event action type
    input_event_action.type = InputEventAction.ACTION
    
    # Check if the input event action is pressed
    if input_event_action.is_pressed():
        print("Input event action is pressed!")
    
    # Check if the input event action is released
    if input_event_action.is_released():
        print("Input event action is released!")
    
    # Check if the input event action is just pressed
    if input_event_action.is_just_pressed():
        print("Input event action is just pressed!")
    
    # Check if the input event action is just released
    if input_event_action.is_just_released():
        print("Input event action is just released!")
    
    # Get the action
    var action = input_event_action.get_action()
    print(action)
    
    # Get the strength
    var strength = input_event_action.get_strength()
    print(strength)
```

## Best Practices Summary

1. **Use Input** for accessing input functionality
2. **Use InputMap** for accessing input mapping functionality
3. **Use InputEvent** for accessing input event functionality
4. **Use InputEventAction** for accessing input event action functionality
5. **Organize Input Actions** in input map
6. **Organize Input Events** in input map
7. **Test in Editor** for proper setup
8. **Always clean up** unused nodes to prevent memory leaks
