---
name: godot-rendering
description: Godot Engine rendering, renderers, and post-processing.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Rendering

## Overview
Godot Engine's rendering system provides powerful tools for creating games with features like renderers, post-processing, and rendering features. This skill covers everything you need to know to create efficient and organized rendering content in Godot 4.7.

## Key Insights

### Rendering Features
- **Forward+**: The most advanced renderer, suited for desktop platforms only
- **Mobile**: Fewer features, but renders simple scenes faster
- **Compatibility**: The least advanced renderer, suited for low-end desktop and mobile platforms
- **RenderingDevice**: The rendering device backend

### Rendering Features
- **Forward+**: The most advanced renderer
- **Mobile**: Fewer features, but renders simple scenes faster
- **Compatibility**: The least advanced renderer
- **RenderingDevice**: The rendering device backend

## Major Version Differences (3.x vs 4.x)

### Rendering System Changes
- **Forward+**: The most advanced renderer, suited for desktop platforms only
- **Mobile**: Fewer features, but renders simple scenes faster
- **Compatibility**: The least advanced renderer, suited for low-end desktop and mobile platforms
- **RenderingDevice**: The rendering device backend
- **Better Performance**: Improved performance for rendering operations
- **Enhanced Editor**: Better editor support for rendering management

### Rendering Features
- **Forward+**: The most advanced renderer
- **Mobile**: Fewer features, but renders simple scenes faster
- **Compatibility**: The least advanced renderer
- **RenderingDevice**: The rendering device backend

## New Features in Godot 4.7

### Rendering Features
- **Forward+**: The most advanced renderer
- **Mobile**: Fewer features, but renders simple scenes faster
- **Compatibility**: The least advanced renderer
- **RenderingDevice**: The rendering device backend
- **Better Performance**: Improved performance for rendering operations
- **Enhanced Editor**: Better editor support for rendering management

## Technical Implementation

### File: forward_plus.gd
```gdscript
extends Node

@export_group("Forward+ Properties")
@export var forward_plus_name: String = ""
@export var forward_plus_path: String = ""

@export_group("Forward+ Features")
@export var forward_plus_visible: bool = true
@export var forward_plus_enabled: bool = true
@export var forward_plus_quality: int = 1

func _ready() -> void:
    # Set up the Forward+
    if forward_plus_name:
        name = forward_plus_name
    
    if forward_plus_path:
        # Load the Forward+
        load_forward_plus(forward_plus_path)
    
    if forward_plus_visible:
        # Show the Forward+
        show()
    
    if forward_plus_enabled:
        # Enable the Forward+
        pass
    
    if forward_plus_quality != 1:
        # Set the Forward+ quality
        set_forward_plus_quality(forward_plus_quality)

func _process(delta: float) -> void:
    # Update the Forward+

func load_forward_plus(path: String) -> void:
    # Load a Forward+
    var forward_plus = load(path)
    if forward_plus:
        # Load the Forward+
        pass

func show_forward_plus() -> void:
    # Show the Forward+
    show()

func hide_forward_plus() -> void:
    # Hide the Forward+
    hide()

func set_forward_plus_visible(visible: bool) -> void:
    # Set the Forward+ visible
    if visible:
        show()
    else:
        hide()

func set_forward_plus_enabled(enabled: bool) -> void:
    # Set the Forward+ enabled
    pass

func set_forward_plus_quality(quality: int) -> void:
    # Set the Forward+ quality
    pass
```

### File: mobile.gd
```gdscript
extends Node

@export_group("Mobile Properties")
@export var mobile_name: String = ""
@export var mobile_path: String = ""

@export_group("Mobile Features")
@export var mobile_visible: bool = true
@export var mobile_enabled: bool = true
@export var mobile_quality: int = 1

func _ready() -> void:
    # Set up the Mobile
    if mobile_name:
        name = mobile_name
    
    if mobile_path:
        # Load the Mobile
        load_mobile(mobile_path)
    
    if mobile_visible:
        # Show the Mobile
        show()
    
    if mobile_enabled:
        # Enable the Mobile
        pass
    
    if mobile_quality != 1:
        # Set the Mobile quality
        set_mobile_quality(mobile_quality)

func _process(delta: float) -> void:
    # Update the Mobile

func load_mobile(path: String) -> void:
    # Load a Mobile
    var mobile = load(path)
    if mobile:
        # Load the Mobile
        pass

func show_mobile() -> void:
    # Show the Mobile
    show()

func hide_mobile() -> void:
    # Hide the Mobile
    hide()

func set_mobile_visible(visible: bool) -> void:
    # Set the Mobile visible
    if visible:
        show()
    else:
        hide()

func set_mobile_enabled(enabled: bool) -> void:
    # Set the Mobile enabled
    pass

func set_mobile_quality(quality: int) -> void:
    # Set the Mobile quality
    pass
```

### File: compatibility.gd
```gdscript
extends Node

@export_group("Compatibility Properties")
@export var compatibility_name: String = ""
@export var compatibility_path: String = ""

@export_group("Compatibility Features")
@export var compatibility_visible: bool = true
@export var compatibility_enabled: bool = true
@export var compatibility_quality: int = 1

func _ready() -> void:
    # Set up the Compatibility
    if compatibility_name:
        name = compatibility_name
    
    if compatibility_path:
        # Load the Compatibility
        load_compatibility(compatibility_path)
    
    if compatibility_visible:
        # Show the Compatibility
        show()
    
    if compatibility_enabled:
        # Enable the Compatibility
        pass
    
    if compatibility_quality != 1:
        # Set the Compatibility quality
        set_compatibility_quality(compatibility_quality)

func _process(delta: float) -> void:
    # Update the Compatibility

func load_compatibility(path: String) -> void:
    # Load a Compatibility
    var compatibility = load(path)
    if compatibility:
        # Load the Compatibility
        pass

func show_compatibility() -> void:
    # Show the Compatibility
    show()

func hide_compatibility() -> void:
    # Hide the Compatibility
    hide()

func set_compatibility_visible(visible: bool) -> void:
    # Set the Compatibility visible
    if visible:
        show()
    else:
        hide()

func set_compatibility_enabled(enabled: bool) -> void:
    # Set the Compatibility enabled
    pass

func set_compatibility_quality(quality: int) -> void:
    # Set the Compatibility quality
    pass
```

### File: rendering_device.gd
```gdscript
extends Node

@export_group("RenderingDevice Properties")
@export var rendering_device_name: String = ""
@export var rendering_device_path: String = ""

@export_group("RenderingDevice Features")
@export var rendering_device_visible: bool = true
@export var rendering_device_enabled: bool = true
@export var rendering_device_quality: int = 1

func _ready() -> void:
    # Set up the RenderingDevice
    if rendering_device_name:
        name = rendering_device_name
    
    if rendering_device_path:
        # Load the RenderingDevice
        load_rendering_device(rendering_device_path)
    
    if rendering_device_visible:
        # Show the RenderingDevice
        show()
    
    if rendering_device_enabled:
        # Enable the RenderingDevice
        pass
    
    if rendering_device_quality != 1:
        # Set the RenderingDevice quality
        set_rendering_device_quality(rendering_device_quality)

func _process(delta: float) -> void:
    # Update the RenderingDevice

func load_rendering_device(path: String) -> void:
    # Load a RenderingDevice
    var rendering_device = load(path)
    if rendering_device:
        # Load the RenderingDevice
        pass

func show_rendering_device() -> void:
    # Show the RenderingDevice
    show()

func hide_rendering_device() -> void:
    # Hide the RenderingDevice
    hide()

func set_rendering_device_visible(visible: bool) -> void:
    # Set the RenderingDevice visible
    if visible:
        show()
    else:
        hide()

func set_rendering_device_enabled(enabled: bool) -> void:
    # Set the RenderingDevice enabled
    pass

func set_rendering_device_quality(quality: int) -> void:
    # Set the RenderingDevice quality
    pass
```

## Unusual Things

### Forward+
- **Forward+**: The most advanced renderer, suited for desktop platforms only
- **Visible**: Visible for Forward+
- **Enabled**: Enabled for Forward+
- **Quality**: Quality for Forward+

### Mobile
- **Mobile**: Fewer features, but renders simple scenes faster
- **Visible**: Visible for Mobile
- **Enabled**: Enabled for Mobile
- **Quality**: Quality for Mobile

### Compatibility
- **Compatibility**: The least advanced renderer, suited for low-end desktop and mobile platforms
- **Visible**: Visible for Compatibility
- **Enabled**: Enabled for Compatibility
- **Quality**: Quality for Compatibility

### RenderingDevice
- **RenderingDevice**: The rendering device backend
- **Visible**: Visible for RenderingDevice
- **Enabled**: Enabled for RenderingDevice
- **Quality**: Quality for RenderingDevice

## Recommendations

### For Forward+
- **Use Forward+**: Use Forward+ renderer
- **Set Forward+ Visible**: Set Forward+ visible
- **Set Forward+ Enabled**: Set Forward+ enabled
- **Set Forward+ Quality**: Set Forward+ quality
- **Test in Editor**: Always test in editor

### For Mobile
- **Use Mobile**: Use Mobile renderer
- **Set Mobile Visible**: Set Mobile visible
- **Set Mobile Enabled**: Set Mobile enabled
- **Set Mobile Quality**: Set Mobile quality
- **Test in Editor**: Always test in editor

### For Compatibility
- **Use Compatibility**: Use Compatibility renderer
- **Set Compatibility Visible**: Set Compatibility visible
- **Set Compatibility Enabled**: Set Compatibility enabled
- **Set Compatibility Quality**: Set Compatibility quality
- **Test in Editor**: Always test in editor

### For RenderingDevice
- **Use RenderingDevice**: Use RenderingDevice backend
- **Set RenderingDevice Visible**: Set RenderingDevice visible
- **Set RenderingDevice Enabled**: Set RenderingDevice enabled
- **Set RenderingDevice Quality**: Set RenderingDevice quality
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Forward+**: Avoid using too many Forward+ without optimization
- **Complex Mobile**: Avoid using complex Mobile without optimization
- **Unbounded Compatibility**: Avoid creating unbounded Compatibility
- **Unbounded RenderingDevice**: Avoid creating unbounded RenderingDevice

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Forward+
- **Incorrect Setup**: Incorrect Forward+ setup can cause issues
- **Performance Issues**: Complex Forward+ features can cause performance issues
- **Complexity**: Forward+ features can be complex

### Mobile
- **Incorrect Setup**: Incorrect Mobile setup can cause issues
- **Performance Issues**: Complex Mobile features can cause performance issues
- **Complexity**: Mobile features can be complex

### Compatibility
- **Incorrect Setup**: Incorrect Compatibility setup can cause issues
- **Performance Issues**: Complex Compatibility features can cause performance issues
- **Complexity**: Compatibility features can be complex

### RenderingDevice
- **Incorrect Setup**: Incorrect RenderingDevice setup can cause issues
- **Performance Issues**: Complex RenderingDevice features can cause performance issues
- **Complexity**: RenderingDevice features can be complex

## ELI5: Forward+

Imagine you have a Forward+ renderer that you want to use for your game. Forward+ is like a system that can provide Forward+ renderer.

### Example: Using Forward+
```gdscript
extends Node

func _ready() -> void:
    # Create a Forward+
    var forward_plus = Node.new()
    add_child(forward_plus)
    
    # Set the Forward+ name
    forward_plus.name = "My Forward+"
    
    # Set the Forward+ path
    forward_plus.forward_plus_path = "res://forward_plus/forward_plus.tscn"
    
    # Set the Forward+ visible
    forward_plus.forward_plus_visible = true
    
    # Set the Forward+ enabled
    forward_plus.forward_plus_enabled = true
    
    # Set the Forward+ quality
    forward_plus.forward_plus_quality = 1
    
    # Load the Forward+
    forward_plus.load_forward_plus("res://forward_plus/forward_plus.tscn")
```

## ELI5: Mobile

Imagine you have a Mobile renderer that you want to use for your game. Mobile is like a system that can provide Mobile renderer.

### Example: Using Mobile
```gdscript
extends Node

func _ready() -> void:
    # Create a Mobile
    var mobile = Node.new()
    add_child(mobile)
    
    # Set the Mobile name
    mobile.name = "My Mobile"
    
    # Set the Mobile path
    mobile.mobile_path = "res://mobile/mobile.tscn"
    
    # Set the Mobile visible
    mobile.mobile_visible = true
    
    # Set the Mobile enabled
    mobile.mobile_enabled = true
    
    # Set the Mobile quality
    mobile.mobile_quality = 1
    
    # Load the Mobile
    mobile.load_mobile("res://mobile/mobile.tscn")
```

## ELI5: Compatibility

Imagine you have a Compatibility renderer that you want to use for your game. Compatibility is like a system that can provide Compatibility renderer.

### Example: Using Compatibility
```gdscript
extends Node

func _ready() -> void:
    # Create a Compatibility
    var compatibility = Node.new()
    add_child(compatibility)
    
    # Set the Compatibility name
    compatibility.name = "My Compatibility"
    
    # Set the Compatibility path
    compatibility.compatibility_path = "res://compatibility/compatibility.tscn"
    
    # Set the Compatibility visible
    compatibility.compatibility_visible = true
    
    # Set the Compatibility enabled
    compatibility.compatibility_enabled = true
    
    # Set the Compatibility quality
    compatibility.compatibility_quality = 1
    
    # Load the Compatibility
    compatibility.load_compatibility("res://compatibility/compatibility.tscn")
```

## ELI5: RenderingDevice

Imagine you have a RenderingDevice backend that you want to use for your game. RenderingDevice is like a system that can provide RenderingDevice backend.

### Example: Using RenderingDevice
```gdscript
extends Node

func _ready() -> void:
    # Create a RenderingDevice
    var rendering_device = Node.new()
    add_child(rendering_device)
    
    # Set the RenderingDevice name
    rendering_device.name = "My RenderingDevice"
    
    # Set the RenderingDevice path
    rendering_device.rendering_device_path = "res://rendering_device/rendering_device.tscn"
    
    # Set the RenderingDevice visible
    rendering_device.rendering_device_visible = true
    
    # Set the RenderingDevice enabled
    rendering_device.rendering_device_enabled = true
    
    # Set the RenderingDevice quality
    rendering_device.rendering_device_quality = 1
    
    # Load the RenderingDevice
    rendering_device.load_rendering_device("res://rendering_device/rendering_device.tscn")
```

## Best Practices Summary

1. **Use Forward+** for Forward+ renderer
2. **Set Forward+ Visible** for Forward+
3. **Set Forward+ Enabled** for Forward+
4. **Set Forward+ Quality** for Forward+
5. **Use Mobile** for Mobile renderer
6. **Set Mobile Visible** for Mobile
7. **Set Mobile Enabled** for Mobile
8. **Set Mobile Quality** for Mobile
9. **Use Compatibility** for Compatibility renderer
10. **Set Compatibility Visible** for Compatibility
11. **Set Compatibility Enabled** for Compatibility
12. **Set Compatibility Quality** for Compatibility
13. **Use RenderingDevice** for RenderingDevice backend
14. **Set RenderingDevice Visible** for RenderingDevice
15. **Set RenderingDevice Enabled** for RenderingDevice
16. **Set RenderingDevice Quality** for RenderingDevice
17. **Test in Editor** for proper setup
18. **Always clean up** unused nodes to prevent memory leaks
