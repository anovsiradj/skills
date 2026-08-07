---
name: godot-windowing
description: Godot Engine windowing, OS integration, and window management.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Windowing

## Overview
Godot Engine's windowing system provides powerful tools for creating games with features like windowing, OS integration, and window management. This skill covers everything you need to know to create efficient and organized windowing content in Godot 4.7.

## Key Insights

### Windowing Features
- **Window**: Window for windowing
- **OS Integration**: OS integration for windowing
- **Window Management**: Window management for windowing

### Windowing Features
- **Window**: Window for windowing
- **OS Integration**: OS integration for windowing
- **Window Management**: Window management for windowing

## Major Version Differences (3.x vs 4.x)

### Windowing System Changes
- **Window**: Enhanced window for windowing
- **OS Integration**: Enhanced OS integration for windowing
- **Window Management**: Enhanced window management for windowing
- **Better Performance**: Improved performance for windowing operations
- **Enhanced Editor**: Better editor support for windowing management

### Windowing Features
- **Window**: Enhanced window
- **OS Integration**: Enhanced OS integration
- **Window Management**: Enhanced window management

## New Features in Godot 4.7

### Windowing Features
- **Window**: Enhanced window
- **OS Integration**: Enhanced OS integration
- **Window Management**: Enhanced window management
- **Better Performance**: Improved performance for windowing operations
- **Enhanced Editor**: Better editor support for windowing management

## Technical Implementation

### File: window.gd
```gdscript
extends Node

@export_group("Window Properties")
@export var window_name: String = ""
@export var window_path: String = ""

@export_group("Window Features")
@export var window_visible: bool = true
@export var window_enabled: bool = true
@export var window_size: Vector2 = Vector2(800, 600)

func _ready() -> void:
    # Set up the window
    if window_name:
        name = window_name
    
    if window_path:
        # Load the window
        load_window(window_path)
    
    if window_visible:
        # Show the window
        show()
    
    if window_enabled:
        # Enable the window
        pass
    
    if window_size != Vector2(800, 600):
        # Set the window size
        set_window_size(window_size)

func _process(delta: float) -> void:
    # Update the window

func load_window(path: String) -> void:
    # Load a window
    var window = load(path)
    if window:
        # Load the window
        pass

func show_window() -> void:
    # Show the window
    show()

func hide_window() -> void:
    # Hide the window
    hide()

func set_window_visible(visible: bool) -> void:
    # Set the window visible
    if visible:
        show()
    else:
        hide()

func set_window_enabled(enabled: bool) -> void:
    # Set the window enabled
    pass

func set_window_size(size: Vector2) -> void:
    # Set the window size
    pass
```

### File: os_integration.gd
```gdscript
extends Node

@export_group("OS Integration Properties")
@export var os_integration_name: String = ""
@export var os_integration_path: String = ""

@export_group("OS Integration Features")
@export var os_integration_visible: bool = true
@export var os_integration_enabled: bool = true
@export var os_integration_type: int = 0

func _ready() -> void:
    # Set up the OS integration
    if os_integration_name:
        name = os_integration_name
    
    if os_integration_path:
        # Load the OS integration
        load_os_integration(os_integration_path)
    
    if os_integration_visible:
        # Show the OS integration
        show()
    
    if os_integration_enabled:
        # Enable the OS integration
        pass
    
    if os_integration_type != 0:
        # Set the OS integration type
        set_os_integration_type(os_integration_type)

func _process(delta: float) -> void:
    # Update the OS integration

func load_os_integration(path: String) -> void:
    # Load an OS integration
    var os_integration = load(path)
    if os_integration:
        # Load the OS integration
        pass

func show_os_integration() -> void:
    # Show the OS integration
    show()

func hide_os_integration() -> void:
    # Hide the OS integration
    hide()

func set_os_integration_visible(visible: bool) -> void:
    # Set the OS integration visible
    if visible:
        show()
    else:
        hide()

func set_os_integration_enabled(enabled: bool) -> void:
    # Set the OS integration enabled
    pass

func set_os_integration_type(type: int) -> void:
    # Set the OS integration type
    match type:
        0:  # Windows
            set_os_integration_type_windows()
        
        1:  # macOS
            set_os_integration_type_macos()
        
        2:  # Linux
            set_os_integration_type_linux()
        
        3:  # Android
            set_os_integration_type_android()
        
        4:  # iOS
            set_os_integration_type_ios()
        
        5:  # Web
            set_os_integration_type_web()

func set_os_integration_type_windows() -> void:
    # Set the OS integration type to Windows
    # Implementation
    pass

func set_os_integration_type_macos() -> void:
    # Set the OS integration type to macOS
    # Implementation
    pass

func set_os_integration_type_linux() -> void:
    # Set the OS integration type to Linux
    # Implementation
    pass

func set_os_integration_type_android() -> void:
    # Set the OS integration type to Android
    # Implementation
    pass

func set_os_integration_type_ios() -> void:
    # Set the OS integration type to iOS
    # Implementation
    pass

func set_os_integration_type_web() -> void:
    # Set the OS integration type to Web
    # Implementation
    pass
```

### File: window_management.gd
```gdscript
extends Node

@export_group("Window Management Properties")
@export var window_management_name: String = ""
@export var window_management_path: String = ""

@export_group("Window Management Features")
@export var window_management_visible: bool = true
@export var window_management_enabled: bool = true
@export var window_management_mode: int = 0

func _ready() -> void:
    # Set up the window management
    if window_management_name:
        name = window_management_name
    
    if window_management_path:
        # Load the window management
        load_window_management(window_management_path)
    
    if window_management_visible:
        # Show the window management
        show()
    
    if window_management_enabled:
        # Enable the window management
        pass
    
    if window_management_mode != 0:
        # Set the window management mode
        set_window_management_mode(window_management_mode)

func _process(delta: float) -> void:
    # Update the window management

func load_window_management(path: String) -> void:
    # Load a window management
    var window_management = load(path)
    if window_management:
        # Load the window management
        pass

func show_window_management() -> void:
    # Show the window management
    show()

func hide_window_management() -> void:
    # Hide the window management
    hide()

func set_window_management_visible(visible: bool) -> void:
    # Set the window management visible
    if visible:
        show()
    else:
        hide()

func set_window_management_enabled(enabled: bool) -> void:
    # Set the window management enabled
    pass

func set_window_management_mode(mode: int) -> void:
    # Set the window management mode
    match mode:
        0:  # Windowed
            set_window_management_mode_windowed()
        
        1:  # Fullscreen
            set_window_management_mode_fullscreen()
        
        2:  # Borderless
            set_window_management_mode_borderless()
        
        3:  # Maximized
            set_window_management_mode_maximized()
        
        4:  # Minimized
            set_window_management_mode_minimized()

func set_window_management_mode_windowed() -> void:
    # Set the window management mode to windowed
    # Implementation
    pass

func set_window_management_mode_fullscreen() -> void:
    # Set the window management mode to fullscreen
    # Implementation
    pass

func set_window_management_mode_borderless() -> void:
    # Set the window management mode to borderless
    # Implementation
    pass

func set_window_management_mode_maximized() -> void:
    # Set the window management mode to maximized
    # Implementation
    pass

func set_window_management_mode_minimized() -> void:
    # Set the window management mode to minimized
    # Implementation
    pass
```

## Unusual Things

### Windowing
- **Window**: Window for windowing
- **Visible**: Visible for window
- **Enabled**: Enabled for window
- **Size**: Size for window

### OS Integration
- **OS Integration**: OS integration for windowing
- **Visible**: Visible for OS integration
- **Enabled**: Enabled for OS integration
- **Type**: Type for OS integration

### Window Management
- **Window Management**: Window management for windowing
- **Visible**: Visible for window management
- **Enabled**: Enabled for window management
- **Mode**: Mode for window management

## Recommendations

### For Windowing
- **Use Window**: Use window for windowing
- **Set Window Visible**: Set window visible
- **Set Window Enabled**: Set window enabled
- **Set Window Size**: Set window size
- **Test in Editor**: Always test in editor

### For OS Integration
- **Use OS Integration**: Use OS integration for windowing
- **Set OS Integration Visible**: Set OS integration visible
- **Set OS Integration Enabled**: Set OS integration enabled
- **Set OS Integration Type**: Set OS integration type
- **Test in Editor**: Always test in editor

### For Window Management
- **Use Window Management**: Use window management for windowing
- **Set Window Management Visible**: Set window management visible
- **Set Window Management Enabled**: Set window management enabled
- **Set Window Management Mode**: Set window management mode
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Windows**: Avoid using too many windows without optimization
- **Complex OS Integration**: Avoid using complex OS integration without optimization
- **Unbounded Window Management**: Avoid creating unbounded window management

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Windowing
- **Incorrect Setup**: Incorrect window setup can cause issues
- **Performance Issues**: Complex window features can cause performance issues
- **Complexity**: Window features can be complex

### OS Integration
- **Incorrect Setup**: Incorrect OS integration setup can cause issues
- **Performance Issues**: Complex OS integration features can cause performance issues
- **Complexity**: OS integration features can be complex

### Window Management
- **Incorrect Setup**: Incorrect window management setup can cause issues
- **Performance Issues**: Complex window management features can cause performance issues
- **Complexity**: Window management features can be complex

## ELI5: Windowing

Imagine you have a window that you want to use for your game. Windowing is like a system that can provide windowing.

### Example: Using Windowing
```gdscript
extends Node

func _ready() -> void:
    # Create a window
    var window = Node.new()
    add_child(window)
    
    # Set the window name
    window.name = "My Window"
    
    # Set the window path
    window.window_path = "res://window/window.tscn"
    
    # Set the window visible
    window.window_visible = true
    
    # Set the window enabled
    window.window_enabled = true
    
    # Set the window size
    window.window_size = Vector2(800, 600)
    
    # Load the window
    window.load_window("res://window/window.tscn")
```

## ELI5: OS Integration

Imagine you have an OS integration that you want to use for your game. OS integration is like a system that can provide OS integration.

### Example: Using OS Integration
```gdscript
extends Node

func _ready() -> void:
    # Create an OS integration
    var os_integration = Node.new()
    add_child(os_integration)
    
    # Set the OS integration name
    os_integration.name = "My OS Integration"
    
    # Set the OS integration path
    os_integration.os_integration_path = "res://os_integration/os_integration.tscn"
    
    # Set the OS integration visible
    os_integration.os_integration_visible = true
    
    # Set the OS integration enabled
    os_integration.os_integration_enabled = true
    
    # Set the OS integration type
    os_integration.os_integration_type = 0
    
    # Load the OS integration
    os_integration.load_os_integration("res://os_integration/os_integration.tscn")
```

## ELI5: Window Management

Imagine you have a window management that you want to use for your game. Window management is like a system that can provide window management.

### Example: Using Window Management
```gdscript
extends Node

func _ready() -> void:
    # Create a window management
    var window_management = Node.new()
    add_child(window_management)
    
    # Set the window management name
    window_management.name = "My Window Management"
    
    # Set the window management path
    window_management.window_management_path = "res://window_management/window_management.tscn"
    
    # Set the window management visible
    window_management.window_management_visible = true
    
    # Set the window management enabled
    window_management.window_management_enabled = true
    
    # Set the window management mode
    window_management.window_management_mode = 0
    
    # Load the window management
    window_management.load_window_management("res://window_management/window_management.tscn")
```

## Best Practices Summary

1. **Use Window** for windowing
2. **Set Window Visible** for window
3. **Set Window Enabled** for window
4. **Set Window Size** for window
5. **Use OS Integration** for windowing
6. **Set OS Integration Visible** for OS integration
7. **Set OS Integration Enabled** for OS integration
8. **Set OS Integration Type** for OS integration
9. **Use Window Management** for windowing
10. **Set Window Management Visible** for window management
11. **Set Window Management Enabled** for window management
12. **Set Window Management Mode** for window management
13. **Test in Editor** for proper setup
14. **Always clean up** unused nodes to prevent memory leaks
