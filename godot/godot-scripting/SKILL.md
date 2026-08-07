---
name: godot-scripting
description: Godot Engine scripting, GDScript, C#, GDExtension, and general scripting patterns.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Scripting

## Overview
Godot Engine's scripting system provides powerful tools for creating games with features like GDScript, C#, GDExtension, and general scripting patterns. This skill covers everything you need to know to create efficient and organized scripting content in Godot 4.7.

## Key Insights

### Scripting Features
- **GDScript**: The primary, high-level interpreted language
- **C#**: Full .NET 8 support
- **GDExtension**: Low-level C++/Rust/etc. integration for maximum performance

### Scripting Features
- **GDScript**: The primary, high-level interpreted language
- **C#**: Full .NET 8 support
- **GDExtension**: Low-level C++/Rust/etc. integration for maximum performance

## Major Version Differences (3.x vs 4.x)

### Scripting System Changes
- **GDScript**: Enhanced GDScript with static typing
- **C#**: Enhanced C# with full .NET 8 support
- **GDExtension**: Enhanced GDExtension with low-level integration
- **Better Performance**: Improved performance for scripting operations
- **Enhanced Editor**: Better editor support for scripting management

### Scripting Features
- **GDScript**: Enhanced GDScript with static typing
- **C#**: Enhanced C# with full .NET 8 support
- **GDExtension**: Enhanced GDExtension with low-level integration

## New Features in Godot 4.7

### Scripting Features
- **GDScript**: Enhanced GDScript with static typing
- **C#**: Enhanced C# with full .NET 8 support
- **GDExtension**: Enhanced GDExtension with low-level integration
- **Better Performance**: Improved performance for scripting operations
- **Enhanced Editor**: Better editor support for scripting management

## Technical Implementation

### File: gdscript.gd
```gdscript
extends Node

@export_group("GDScript Properties")
@export var gdscript_name: String = ""
@export var gdscript_path: String = ""

@export_group("GDScript Features")
@export var gdscript_visible: bool = true
@export var gdscript_enabled: bool = true
@export var gdscript_static_typing: bool = false

func _ready() -> void:
    # Set up the GDScript
    if gdscript_name:
        name = gdscript_name
    
    if gdscript_path:
        # Load the GDScript
        load_gdscript(gdscript_path)
    
    if gdscript_visible:
        # Show the GDScript
        show()
    
    if gdscript_enabled:
        # Enable the GDScript
        pass
    
    if gdscript_static_typing:
        # Set the GDScript static typing
        pass

func _process(delta: float) -> void:
    # Update the GDScript

func load_gdscript(path: String) -> void:
    # Load a GDScript
    var gdscript = load(path)
    if gdscript:
        # Load the GDScript
        pass

func show_gdscript() -> void:
    # Show the GDScript
    show()

func hide_gdscript() -> void:
    # Hide the GDScript
    hide()

func set_gdscript_visible(visible: bool) -> void:
    # Set the GDScript visible
    if visible:
        show()
    else:
        hide()

func set_gdscript_enabled(enabled: bool) -> void:
    # Set the GDScript enabled
    pass

func set_gdscript_static_typing(static_typing: bool) -> void:
    # Set the GDScript static typing
    pass
```

### File: c_sharp.gd
```gdscript
extends Node

@export_group("C# Properties")
@export var c_sharp_name: String = ""
@export var c_sharp_path: String = ""

@export_group("C# Features")
@export var c_sharp_visible: bool = true
@export var c_sharp_enabled: bool = true
@export var c_sharp_net_version: int = 8

func _ready() -> void:
    # Set up the C#
    if c_sharp_name:
        name = c_sharp_name
    
    if c_sharp_path:
        # Load the C#
        load_c_sharp(c_sharp_path)
    
    if c_sharp_visible:
        # Show the C#
        show()
    
    if c_sharp_enabled:
        # Enable the C#
        pass
    
    if c_sharp_net_version != 8:
        # Set the C# .NET version
        set_c_sharp_net_version(c_sharp_net_version)

func _process(delta: float) -> void:
    # Update the C#

func load_c_sharp(path: String) -> void:
    # Load a C#
    var c_sharp = load(path)
    if c_sharp:
        # Load the C#
        pass

func show_c_sharp() -> void:
    # Show the C#
    show()

func hide_c_sharp() -> void:
    # Hide the C#
    hide()

func set_c_sharp_visible(visible: bool) -> void:
    # Set the C# visible
    if visible:
        show()
    else:
        hide()

func set_c_sharp_enabled(enabled: bool) -> void:
    # Set the C# enabled
    pass

func set_c_sharp_net_version(net_version: int) -> void:
    # Set the C# .NET version
    pass
```

### File: gdextension.gd
```gdscript
extends Node

@export_group("GDExtension Properties")
@export var gdextension_name: String = ""
@export var gdextension_path: String = ""

@export_group("GDExtension Features")
@export var gdextension_visible: bool = true
@export var gdextension_enabled: bool = true
@export var gdextension_language: int = 0

func _ready() -> void:
    # Set up the GDExtension
    if gdextension_name:
        name = gdextension_name
    
    if gdextension_path:
        # Load the GDExtension
        load_gdextension(gdextension_path)
    
    if gdextension_visible:
        # Show the GDExtension
        show()
    
    if gdextension_enabled:
        # Enable the GDExtension
        pass
    
    if gdextension_language != 0:
        # Set the GDExtension language
        set_gdextension_language(gdextension_language)

func _process(delta: float) -> void:
    # Update the GDExtension

func load_gdextension(path: String) -> void:
    # Load a GDExtension
    var gdextension = load(path)
    if gdextension:
        # Load the GDExtension
        pass

func show_gdextension() -> void:
    # Show the GDExtension
    show()

func hide_gdextension() -> void:
    # Hide the GDExtension
    hide()

func set_gdextension_visible(visible: bool) -> void:
    # Set the GDExtension visible
    if visible:
        show()
    else:
        hide()

func set_gdextension_enabled(enabled: bool) -> void:
    # Set the GDExtension enabled
    pass

func set_gdextension_language(language: int) -> void:
    # Set the GDExtension language
    pass
```

## Unusual Things

### GDScript
- **GDScript**: The primary, high-level interpreted language
- **Visible**: Visible for GDScript
- **Enabled**: Enabled for GDScript
- **Static Typing**: Static typing for GDScript

### C#
- **C#**: Full .NET 8 support
- **Visible**: Visible for C#
- **Enabled**: Enabled for C#
- **Net Version**: .NET version for C#

### GDExtension
- **GDExtension**: Low-level C++/Rust/etc. integration for maximum performance
- **Visible**: Visible for GDExtension
- **Enabled**: Enabled for GDExtension
- **Language**: Language for GDExtension

## Recommendations

### For GDScript
- **Use GDScript**: Use GDScript for scripting
- **Set GDScript Visible**: Set GDScript visible
- **Set GDScript Enabled**: Set GDScript enabled
- **Set GDScript Static Typing**: Set GDScript static typing
- **Test in Editor**: Always test in editor

### For C#
- **Use C#**: Use C# for scripting
- **Set C# Visible**: Set C# visible
- **Set C# Enabled**: Set C# enabled
- **Set C# .NET Version**: Set C# .NET version
- **Test in Editor**: Always test in editor

### For GDExtension
- **Use GDExtension**: Use GDExtension for scripting
- **Set GDExtension Visible**: Set GDExtension visible
- **Set GDExtension Enabled**: Set GDExtension enabled
- **Set GDExtension Language**: Set GDExtension language
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many GDScript**: Avoid using too many GDScript without optimization
- **Complex C#**: Avoid using complex C# without optimization
- **Unbounded GDExtension**: Avoid creating unbounded GDExtension

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### GDScript
- **Incorrect Setup**: Incorrect GDScript setup can cause issues
- **Performance Issues**: Complex GDScript features can cause performance issues
- **Complexity**: GDScript features can be complex

### C#
- **Incorrect Setup**: Incorrect C# setup can cause issues
- **Performance Issues**: Complex C# features can cause performance issues
- **Complexity**: C# features can be complex

### GDExtension
- **Incorrect Setup**: Incorrect GDExtension setup can cause issues
- **Performance Issues**: Complex GDExtension features can cause performance issues
- **Complexity**: GDExtension features can be complex

## ELI5: GDScript

Imagine you have a GDScript that you want to use for your game. GDScript is like a system that can provide GDScript for scripting.

### Example: Using GDScript
```gdscript
extends Node

func _ready() -> void:
    # Create a GDScript
    var gdscript = Node.new()
    add_child(gdscript)
    
    # Set the GDScript name
    gdscript.name = "My GDScript"
    
    # Set the GDScript path
    gdscript.gdscript_path = "res://gdscript/gdscript.tscn"
    
    # Set the GDScript visible
    gdscript.gdscript_visible = true
    
    # Set the GDScript enabled
    gdscript.gdscript_enabled = true
    
    # Set the GDScript static typing
    gdscript.gdscript_static_typing = false
    
    # Load the GDScript
    gdscript.load_gdscript("res://gdscript/gdscript.tscn")
```

## ELI5: C#

Imagine you have a C# that you want to use for your game. C# is like a system that can provide C# for scripting.

### Example: Using C#
```gdscript
extends Node

func _ready() -> void:
    # Create a C#
    var c_sharp = Node.new()
    add_child(c_sharp)
    
    # Set the C# name
    c_sharp.name = "My C#"
    
    # Set the C# path
    c_sharp.c_sharp_path = "res://c_sharp/c_sharp.tscn"
    
    # Set the C# visible
    c_sharp.c_sharp_visible = true
    
    # Set the C# enabled
    c_sharp.c_sharp_enabled = true
    
    # Set the C# .NET version
    c_sharp.c_sharp_net_version = 8
    
    # Load the C#
    c_sharp.load_c_sharp("res://c_sharp/c_sharp.tscn")
```

## ELI5: GDExtension

Imagine you have a GDExtension that you want to use for your game. GDExtension is like a system that can provide GDExtension for scripting.

### Example: Using GDExtension
```gdscript
extends Node

func _ready() -> void:
    # Create a GDExtension
    var gdextension = Node.new()
    add_child(gdextension)
    
    # Set the GDExtension name
    gdextension.name = "My GDExtension"
    
    # Set the GDExtension path
    gdextension.gdextension_path = "res://gdextension/gdextension.tscn"
    
    # Set the GDExtension visible
    gdextension.gdextension_visible = true
    
    # Set the GDExtension enabled
    gdextension.gdextension_enabled = true
    
    # Set the GDExtension language
    gdextension.gdextension_language = 0
    
    # Load the GDExtension
    gdextension.load_gdextension("res://gdextension/gdextension.tscn")
```

## Best Practices Summary

1. **Use GDScript** for scripting
2. **Set GDScript Visible** for GDScript
3. **Set GDScript Enabled** for GDScript
4. **Set GDScript Static Typing** for GDScript
5. **Use C#** for scripting
6. **Set C# Visible** for C#
7. **Set C# Enabled** for C#
8. **Set C# .NET Version** for C#
9. **Use GDExtension** for scripting
10. **Set GDExtension Visible** for GDExtension
11. **Set GDExtension Enabled** for GDExtension
12. **Set GDExtension Language** for GDExtension
13. **Test in Editor** for proper setup
14. **Always clean up** unused nodes to prevent memory leaks
