---
name: godot-file-formats
description: Godot Engine file formats, scene serialization, and resource management.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# File Formats

## Overview
Godot Engine's file formats provide powerful tools for creating games with features like scene serialization, resource management, and file format support. This skill covers everything you need to know to create efficient and organized content in Godot 4.7.

## Key Insights

### Scene Formats
- **Text-based Scenes**: Scenes can be saved in text-based formats for human readability
- **Binary Scenes**: Scenes can be saved in binary formats for faster loading
- **Scene Resources**: Scenes can be saved as resources for better organization
- **Packed Scenes**: Scenes can be packed into a single file for easier distribution

### Resource Formats
- **Texture Resources**: Textures can be saved as resources
- **Material Resources**: Materials can be saved as resources
- **Mesh Resources**: Meshes can be saved as resources
- **Script Resources**: Scripts can be saved as resources

### File Format Features
- **Compression**: Files can be compressed for smaller file sizes
- **Encryption**: Files can be encrypted for security
- **Packaging**: Files can be packaged into a single file
- **Distribution**: Files can be distributed easily

## Major Version Differences (3.x vs 4.x)

### File Format Changes
- **Text-based Scenes**: Scenes can be saved in text-based formats for human readability
- **Binary Scenes**: Scenes can be saved in binary formats for faster loading
- **Scene Resources**: Scenes can be saved as resources for better organization
- **Packed Scenes**: Scenes can be packed into a single file for easier distribution
- **Better Performance**: Improved performance for file operations
- **Enhanced Editor**: Better editor support for file management

### File Format Features
- **Compression**: Enhanced compression for smaller file sizes
- **Encryption**: Enhanced encryption for security
- **Packaging**: Enhanced packaging for easier distribution
- **Distribution**: Enhanced distribution for easier sharing

## New Features in Godot 4.7

### File Format Features
- **Text-based Scenes**: Scenes can be saved in text-based formats for human readability
- **Binary Scenes**: Scenes can be saved in binary formats for faster loading
- **Scene Resources**: Scenes can be saved as resources for better organization
- **Packed Scenes**: Scenes can be packed into a single file for easier distribution
- **Better Performance**: Improved performance for file operations
- **Enhanced Editor**: Better editor support for file management

### File Format Support
- **Texture Formats**: Enhanced texture format support
- **Audio Formats**: Enhanced audio format support
- **Video Formats**: Enhanced video format support
- **Image Formats**: Enhanced image format support

## Technical Implementation

### File: scene.gd
```gdscript
extends Node

@export_group("Scene Properties")
@export var scene_name: String = ""
@export var scene_path: String = ""
@export var scene_type: int = 0

@export_group("Scene Format")
@export var save_as_text: bool = true
@export var save_as_binary: bool = false
@export var save_as_resource: bool = false
@export var save_as_packed: bool = false

@export_group("Compression")
@export var compression_enabled: bool = false
@export var compression_level: int = 5

@export_group("Encryption")
@export var encryption_enabled: bool = false
@export var encryption_key: String = ""

func _ready() -> void:
    # Set up the scene
    if scene_name:
        # Save the scene
        save_scene(scene_name)
    
    if scene_path:
        # Save the scene from path
        save_scene_from_path(scene_path)
    
    if scene_type != 0:
        # Set the scene type
        set_scene_type(scene_type)

func _process(delta: float) -> void:
    # Update the scene

func save_scene(name: String) -> void:
    # Save a scene
    var scene = get_tree().get_current_scene()
    if scene:
        if save_as_text:
            # Save as text
            save_scene_as_text(scene, name)
        elif save_as_binary:
            # Save as binary
            save_scene_as_binary(scene, name)
        elif save_as_resource:
            # Save as resource
            save_scene_as_resource(scene, name)
        elif save_as_packed:
            # Save as packed
            save_scene_as_packed(scene, name)

func save_scene_from_path(path: String) -> void:
    # Save a scene from path
    var scene = load(path)
    if scene:
        # Save the scene
        save_scene(scene)

func set_scene_type(type: int) -> void:
    # Set the scene type
    match type:
        0:  # 2D
            set_scene_type_2d()
        
        1:  # 3D
            set_scene_type_3d()
        
        2:  # UI
            set_scene_type_ui()

func set_scene_type_2d() -> void:
    # Set the scene type to 2D
    # Implementation
    pass

func set_scene_type_3d() -> void:
    # Set the scene type to 3D
    # Implementation
    pass

func set_scene_type_ui() -> void:
    # Set the scene type to UI
    # Implementation
    pass

func save_scene_as_text(scene: Node, path: String) -> void:
    # Save a scene as text
    var scene_tree = scene.get_tree()
    var scene_file = FileAccess.open(path + ".tscn", FileAccess.WRITE)
    if scene_file:
        scene_file.store_line("[gd_scene]")
        scene_file.store_line("[gd_node type=\"" + scene.get_class() + "\" name=\"" + scene.name + "\"]")
        scene_file.store_line("[/gd_node]")
        scene_file.store_line("[gd_scene]")

func save_scene_as_binary(scene: Node, path: String) -> void:
    # Save a scene as binary
    var scene_tree = scene.get_tree()
    var scene_file = FileAccess.open(path + ".tscn", FileAccess.WRITE)
    if scene_file:
        # Save the scene as binary
        pass

func save_scene_as_resource(scene: Node, path: String) -> void:
    # Save a scene as resource
    var scene_tree = scene.get_tree()
    var scene_file = FileAccess.open(path + ".tres", FileAccess.WRITE)
    if scene_file:
        # Save the scene as resource
        pass

func save_scene_as_packed(scene: Node, path: String) -> void:
    # Save a scene as packed
    var scene_tree = scene.get_tree()
    var scene_file = FileAccess.open(path + ".pck", FileAccess.WRITE)
    if scene_file:
        # Save the scene as packed
        pass
```

### File: resource.gd
```gdscript
extends Resource

@export_group("Resource Properties")
@export var resource_name: String = ""
@export var resource_path: String = ""
@export var resource_type: int = 0

@export_group("Resource Format")
@export var save_as_text: bool = true
@export var save_as_binary: bool = false
@export var save_as_resource: bool = false
@export var save_as_packed: bool = false

@export_group("Compression")
@export var compression_enabled: bool = false
@export var compression_level: int = 5

@export_group("Encryption")
@export var encryption_enabled: bool = false
@export var encryption_key: String = ""

func _ready() -> void:
    # Set up the resource
    if resource_name:
        # Save the resource
        save_resource(resource_name)
    
    if resource_path:
        # Save the resource from path
        save_resource_from_path(resource_path)
    
    if resource_type != 0:
        # Set the resource type
        set_resource_type(resource_type)

func _process(delta: float) -> void:
    # Update the resource

func save_resource(name: String) -> void:
    # Save a resource
    if save_as_text:
        # Save as text
        save_resource_as_text(name)
    elif save_as_binary:
        # Save as binary
        save_resource_as_binary(name)
    elif save_as_resource:
        # Save as resource
        save_resource_as_resource(name)
    elif save_as_packed:
        # Save as packed
        save_resource_as_packed(name)

func save_resource_from_path(path: String) -> void:
    # Save a resource from path
    var resource = load(path)
    if resource:
        # Save the resource
        save_resource(resource)

func set_resource_type(type: int) -> void:
    # Set the resource type
    match type:
        0:  # Texture
            set_resource_type_texture()
        
        1:  # Material
            set_resource_type_material()
        
        2:  # Mesh
            set_resource_type_mesh()
        
        3:  # Script
            set_resource_type_script()

func set_resource_type_texture() -> void:
    # Set the resource type to texture
    # Implementation
    pass

func set_resource_type_material() -> void:
    # Set the resource type to material
    # Implementation
    pass

func set_resource_type_mesh() -> void:
    # Set the resource type to mesh
    # Implementation
    pass

func set_resource_type_script() -> void:
    # Set the resource type to script
    # Implementation
    pass

func save_resource_as_text(name: String) -> void:
    # Save a resource as text
    var resource_file = FileAccess.open(name + ".tres", FileAccess.WRITE)
    if resource_file:
        resource_file.store_line("[gd_resource type=\"" + get_class() + "\" load_path=\"" + get_path() + "\"]")
        resource_file.store_line("[/gd_resource]")

func save_resource_as_binary(name: String) -> void:
    # Save a resource as binary
    var resource_file = FileAccess.open(name + ".tres", FileAccess.WRITE)
    if resource_file:
        # Save the resource as binary
        pass

func save_resource_as_resource(name: String) -> void:
    # Save a resource as resource
    var resource_file = FileAccess.open(name + ".tres", FileAccess.WRITE)
    if resource_file:
        # Save the resource as resource
        pass

func save_resource_as_packed(name: String) -> void:
    # Save a resource as packed
    var resource_file = FileAccess.open(name + ".pck", FileAccess.WRITE)
    if resource_file:
        # Save the resource as packed
        pass
```

## Unusual Things

### Scene Formats
- **Text-based Scenes**: Scenes can be saved in text-based formats for human readability
- **Binary Scenes**: Scenes can be saved in binary formats for faster loading
- **Scene Resources**: Scenes can be saved as resources for better organization
- **Packed Scenes**: Scenes can be packed into a single file for easier distribution

### Resource Formats
- **Texture Resources**: Textures can be saved as resources
- **Material Resources**: Materials can be saved as resources
- **Mesh Resources**: Meshes can be saved as resources
- **Script Resources**: Scripts can be saved as resources

### File Format Features
- **Compression**: Files can be compressed for smaller file sizes
- **Encryption**: Files can be encrypted for security
- **Packaging**: Files can be packaged into a single file
- **Distribution**: Files can be distributed easily

## Recommendations

### For Scene Formats
- **Use Text-based Scenes**: Use text-based scenes for human readability
- **Use Binary Scenes**: Use binary scenes for faster loading
- **Use Scene Resources**: Use scene resources for better organization
- **Use Packed Scenes**: Use packed scenes for easier distribution

### For Resource Formats
- **Use Texture Resources**: Use texture resources for textures
- **Use Material Resources**: Use material resources for materials
- **Use Mesh Resources**: Use mesh resources for meshes
- **Use Script Resources**: Use script resources for scripts

### For File Format Features
- **Use Compression**: Use compression for smaller file sizes
- **Use Encryption**: Use encryption for security
- **Use Packaging**: Use packaging for easier distribution
- **Use Distribution**: Use distribution for easier sharing

## Prohibitions

### Performance Issues
- **Too Many Scenes**: Avoid using too many scenes without optimization
- **Complex Resources**: Avoid using complex resources without optimization
- **Unbounded Files**: Avoid creating unbounded files

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Scene Formats
- **Incorrect Format**: Incorrect scene format can cause issues
- **Performance Issues**: Complex scene formats can cause performance issues
- **Memory Issues**: Scene formats can cause memory issues

### Resource Formats
- **Incorrect Format**: Incorrect resource format can cause issues
- **Performance Issues**: Complex resource formats can cause performance issues
- **Memory Issues**: Resource formats can cause memory issues

### File Format Features
- **Compression**: Files can be compressed for smaller file sizes
- **Encryption**: Files can be encrypted for security
- **Packaging**: Files can be packaged into a single file
- **Distribution**: Files can be distributed easily

## ELI5: Scene Formats

Imagine you have a bunch of scenes for editing content. Scene formats are like different ways to save these scenes.

### Example: Using Scene Formats
```gdscript
extends Node

func _ready() -> void:
    # Create a scene
    var scene = Node.new()
    add_child(scene)
    
    # Set the scene name
    scene.name = "My Scene"
    
    # Save the scene as text
    save_scene_as_text(scene, "My Scene")
    
    # Save the scene as binary
    save_scene_as_binary(scene, "My Scene")
    
    # Save the scene as resource
    save_scene_as_resource(scene, "My Scene")
    
    # Save the scene as packed
    save_scene_as_packed(scene, "My Scene")
```

## ELI5: Resource Formats

Imagine you have a bunch of resources for editing content. Resource formats are like different ways to save these resources.

### Example: Using Resource Formats
```gdscript
extends Resource

func _ready() -> void:
    # Create a resource
    var resource = Resource.new()
    add_child(resource)
    
    # Set the resource name
    resource.resource_name = "My Resource"
    
    # Save the resource as text
    save_resource_as_text("My Resource")
    
    # Save the resource as binary
    save_resource_as_binary("My Resource")
    
    # Save the resource as resource
    save_resource_as_resource("My Resource")
    
    # Save the resource as packed
    save_resource_as_packed("My Resource")
```

## Best Practices Summary

1. **Use Text-based Scenes** for human readability
2. **Use Binary Scenes** for faster loading
3. **Use Scene Resources** for better organization
4. **Use Packed Scenes** for easier distribution
5. **Use Texture Resources** for textures
6. **Use Material Resources** for materials
7. **Use Mesh Resources** for meshes
8. **Use Script Resources** for scripts
9. **Use Compression** for smaller file sizes
10. **Use Encryption** for security
11. **Use Packaging** for easier distribution
12. **Use Distribution** for easier sharing
13. **Test in Editor** for proper setup
14. **Always clean up** unused nodes to prevent memory leaks
