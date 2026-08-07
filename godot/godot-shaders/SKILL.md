---
name: godot-shaders
description: Godot Engine shaders, shader language, and shader programming.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Shaders

## Overview
Godot Engine's shader system provides powerful tools for creating games with features like shaders, shader language, and shader programming. This skill covers everything you need to know to create efficient and organized shader content in Godot 4.7.

## Key Insights

### Shader Features
- **2D Shaders**: Custom vertex, fragment, and light shaders for 2D
- **3D Shaders**: Custom vertex, fragment, light, sky, and fog shaders for 3D
- **Procedural Generation**: Custom shaders can procedurally generate and modify textures in real-time using DrawableTexture2D
- **Shader Language**: Text-based shaders using a shader language inspired by GLSL
- **Syntax Highlighting**: Syntax highlighting is provided on GitHub by using gdshader as the language name in a Markdown code block
- **Visual Shader Editor**: Visual shader editor
- **Visual Shader Plugins**: Support for visual shader plugins

### Shader Features
- **2D Shaders**: Custom vertex, fragment, and light shaders for 2D
- **3D Shaders**: Custom vertex, fragment, light, sky, and fog shaders for 3D
- **Procedural Generation**: Custom shaders can procedurally generate and modify textures in real-time using DrawableTexture2D
- **Shader Language**: Text-based shaders using a shader language inspired by GLSL
- **Syntax Highlighting**: Syntax highlighting is provided on GitHub by using gdshader as the language name in a Markdown code block
- **Visual Shader Editor**: Visual shader editor
- **Visual Shader Plugins**: Support for visual shader plugins

## Major Version Differences (3.x vs 4.x)

### Shader System Changes
- **2D Shaders**: Enhanced 2D shaders
- **3D Shaders**: Enhanced 3D shaders
- **Procedural Generation**: Enhanced procedural generation
- **Shader Language**: Enhanced shader language
- **Syntax Highlighting**: Enhanced syntax highlighting
- **Visual Shader Editor**: Enhanced visual shader editor
- **Visual Shader Plugins**: Enhanced visual shader plugins
- **Better Performance**: Improved performance for shader operations
- **Enhanced Editor**: Better editor support for shader management

### Shader Features
- **2D Shaders**: Enhanced 2D shaders
- **3D Shaders**: Enhanced 3D shaders
- **Procedural Generation**: Enhanced procedural generation
- **Shader Language**: Enhanced shader language
- **Syntax Highlighting**: Enhanced syntax highlighting
- **Visual Shader Editor**: Enhanced visual shader editor
- **Visual Shader Plugins**: Enhanced visual shader plugins

## New Features in Godot 4.7

### Shader Features
- **2D Shaders**: Enhanced 2D shaders
- **3D Shaders**: Enhanced 3D shaders
- **Procedural Generation**: Enhanced procedural generation
- **Shader Language**: Enhanced shader language
- **Syntax Highlighting**: Enhanced syntax highlighting
- **Visual Shader Editor**: Enhanced visual shader editor
- **Visual Shader Plugins**: Enhanced visual shader plugins
- **Better Performance**: Improved performance for shader operations
- **Enhanced Editor**: Better editor support for shader management

## Technical Implementation

### File: shader.gd
```gdscript
extends Node

@export_group("Shader Properties")
@export var shader_name: String = ""
@export var shader_path: String = ""

@export_group("Shader Features")
@export var shader_visible: bool = true
@export var shader_enabled: bool = true
@export var shader_type: int = 0

func _ready() -> void:
    # Set up the shader
    if shader_name:
        name = shader_name
    
    if shader_path:
        # Load the shader
        load_shader(shader_path)
    
    if shader_visible:
        # Show the shader
        show()
    
    if shader_enabled:
        # Enable the shader
        pass
    
    if shader_type != 0:
        # Set the shader type
        set_shader_type(shader_type)

func _process(delta: float) -> void:
    # Update the shader

func load_shader(path: String) -> void:
    # Load a shader
    var shader = load(path)
    if shader:
        # Load the shader
        pass

func show_shader() -> void:
    # Show the shader
    show()

func hide_shader() -> void:
    # Hide the shader
    hide()

func set_shader_visible(visible: bool) -> void:
    # Set the shader visible
    if visible:
        show()
    else:
        hide()

func set_shader_enabled(enabled: bool) -> void:
    # Set the shader enabled
    pass

func set_shader_type(type: int) -> void:
    # Set the shader type
    match type:
        0:  # Vertex
            set_shader_type_vertex()
        
        1:  # Fragment
            set_shader_type_fragment()
        
        2:  # Light
            set_shader_type_light()
        
        3:  # Sky
            set_shader_type_sky()
        
        4:  # Fog
            set_shader_type_fog()

func set_shader_type_vertex() -> void:
    # Set the shader type to vertex
    # Implementation
    pass

func set_shader_type_fragment() -> void:
    # Set the shader type to fragment
    # Implementation
    pass

func set_shader_type_light() -> void:
    # Set the shader type to light
    # Implementation
    pass

func set_shader_type_sky() -> void:
    # Set the shader type to sky
    # Implementation
    pass

func set_shader_type_fog() -> void:
    # Set the shader type to fog
    # Implementation
    pass
```

### File: visual_shader.gd
```gdscript
extends Node

@export_group("Visual Shader Properties")
@export var visual_shader_name: String = ""
@export var visual_shader_path: String = ""

@export_group("Visual Shader Features")
@export var visual_shader_visible: bool = true
@export var visual_shader_enabled: bool = true
@export var visual_shader_type: int = 0

func _ready() -> void:
    # Set up the visual shader
    if visual_shader_name:
        name = visual_shader_name
    
    if visual_shader_path:
        # Load the visual shader
        load_visual_shader(visual_shader_path)
    
    if visual_shader_visible:
        # Show the visual shader
        show()
    
    if visual_shader_enabled:
        # Enable the visual shader
        pass
    
    if visual_shader_type != 0:
        # Set the visual shader type
        set_visual_shader_type(visual_shader_type)

func _process(delta: float) -> void:
    # Update the visual shader

func load_visual_shader(path: String) -> void:
    # Load a visual shader
    var visual_shader = load(path)
    if visual_shader:
        # Load the visual shader
        pass

func show_visual_shader() -> void:
    # Show the visual shader
    show()

func hide_visual_shader() -> void:
    # Hide the visual shader
    hide()

func set_visual_shader_visible(visible: bool) -> void:
    # Set the visual shader visible
    if visible:
        show()
    else:
        hide()

func set_visual_shader_enabled(enabled: bool) -> void:
    # Set the visual shader enabled
    pass

func set_visual_shader_type(type: int) -> void:
    # Set the visual shader type
    match type:
        0:  # Vertex
            set_visual_shader_type_vertex()
        
        1:  # Fragment
            set_visual_shader_type_fragment()
        
        2:  # Light
            set_visual_shader_type_light()
        
        3:  # Sky
            set_visual_shader_type_sky()
        
        4:  # Fog
            set_visual_shader_type_fog()

func set_visual_shader_type_vertex() -> void:
    # Set the visual shader type to vertex
    # Implementation
    pass

func set_visual_shader_type_fragment() -> void:
    # Set the visual shader type to fragment
    # Implementation
    pass

func set_visual_shader_type_light() -> void:
    # Set the visual shader type to light
    # Implementation
    pass

func set_visual_shader_type_sky() -> void:
    # Set the visual shader type to sky
    # Implementation
    pass

func set_visual_shader_type_fog() -> void:
    # Set the visual shader type to fog
    # Implementation
    pass
```

## Unusual Things

### Shaders
- **2D Shaders**: Custom vertex, fragment, and light shaders for 2D
- **3D Shaders**: Custom vertex, fragment, light, sky, and fog shaders for 3D
- **Procedural Generation**: Custom shaders can procedurally generate and modify textures in real-time using DrawableTexture2D
- **Shader Language**: Text-based shaders using a shader language inspired by GLSL
- **Syntax Highlighting**: Syntax highlighting is provided on GitHub by using gdshader as the language name in a Markdown code block
- **Visual Shader Editor**: Visual shader editor
- **Visual Shader Plugins**: Support for visual shader plugins

## Recommendations

### For Shaders
- **Use Shaders**: Use shaders for custom rendering effects
- **Set Shader Visible**: Set shader visible
- **Set Shader Enabled**: Set shader enabled
- **Set Shader Type**: Set shader type
- **Test in Editor**: Always test in editor

### For Visual Shaders
- **Use Visual Shaders**: Use visual shaders for visual shader editing
- **Set Visual Shader Visible**: Set visual shader visible
- **Set Visual Shader Enabled**: Set visual shader enabled
- **Set Visual Shader Type**: Set visual shader type
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Shaders**: Avoid using too many shaders without optimization
- **Complex Visual Shaders**: Avoid using complex visual shaders without optimization
- **Unbounded Shaders**: Avoid creating unbounded shaders

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Shaders
- **Incorrect Setup**: Incorrect shader setup can cause issues
- **Performance Issues**: Complex shader features can cause performance issues
- **Complexity**: Shader features can be complex

### Visual Shaders
- **Incorrect Setup**: Incorrect visual shader setup can cause issues
- **Performance Issues**: Complex visual shader features can cause performance issues
- **Complexity**: Visual shader features can be complex

## ELI5: Shaders

Imagine you have a bunch of shaders that you want to use for custom rendering effects. Shaders are like a system that can provide shaders for custom rendering effects.

### Example: Using Shaders
```gdscript
extends Node

func _ready() -> void:
    # Create a shader
    var shader = Node.new()
    add_child(shader)
    
    # Set the shader name
    shader.name = "My Shader"
    
    # Set the shader path
    shader.shader_path = "res://shader/shader.tscn"
    
    # Set the shader visible
    shader.shader_visible = true
    
    # Set the shader enabled
    shader.shader_enabled = true
    
    # Set the shader type
    shader.shader_type = 0
    
    # Load the shader
    shader.load_shader("res://shader/shader.tscn")
```

## ELI5: Visual Shaders

Imagine you have a bunch of visual shaders that you want to use for visual shader editing. Visual shaders are like a system that can provide visual shaders for visual shader editing.

### Example: Using Visual Shaders
```gdscript
extends Node

func _ready() -> void:
    # Create a visual shader
    var visual_shader = Node.new()
    add_child(visual_shader)
    
    # Set the visual shader name
    visual_shader.name = "My Visual Shader"
    
    # Set the visual shader path
    visual_shader.visual_shader_path = "res://visual_shader/visual_shader.tscn"
    
    # Set the visual shader visible
    visual_shader.visual_shader_visible = true
    
    # Set the visual shader enabled
    visual_shader.visual_shader_enabled = true
    
    # Set the visual shader type
    visual_shader.visual_shader_type = 0
    
    # Load the visual shader
    visual_shader.load_visual_shader("res://visual_shader/visual_shader.tscn")
```

## Best Practices Summary

1. **Use Shaders** for custom rendering effects
2. **Set Shader Visible** for shader
3. **Set Shader Enabled** for shader
4. **Set Shader Type** for shader
5. **Use Visual Shaders** for visual shader editing
6. **Set Visual Shader Visible** for visual shader
7. **Set Visual Shader Enabled** for visual shader
8. **Set Visual Shader Type** for visual shader
9. **Test in Editor** for proper setup
10. **Always clean up** unused nodes to prevent memory leaks
