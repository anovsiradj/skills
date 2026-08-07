---
name: godot-editor
description: Godot Engine editor, plugins, and editor tools.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Editor

## Overview
Godot Engine's editor provides powerful tools for creating games with features like scene editing, asset management, and plugin development. This skill covers everything you need to know to create efficient and organized content in Godot 4.7.

## Key Insights

### Editor Nodes
- **EditorInterface**: Node for accessing editor functionality
- **EditorPlugin**: Node for creating editor plugins
- **EditorScene**: Node for editing scenes
- **EditorResource**: Node for editing resources

### Editor Features
- **Scene Tree**: Scene tree for organizing scenes
- **Inspector**: Inspector for editing node properties
- **Assets**: Assets for managing assets
- **Tools**: Tools for editing content

### Editor Tools
- **Script Editor**: Script editor for editing scripts
- **Visual Script**: Visual script for creating scripts visually
- **Shader Editor**: Shader editor for editing shaders
- **Plugin System**: Plugin system for extending editor functionality

## Major Version Differences (3.x vs 4.x)

### Editor System Changes
- **EditorInterface**: New editor interface system
- **EditorPlugin**: New editor plugin system
- **EditorScene**: New editor scene system
- **EditorResource**: New editor resource system
- **Better Performance**: Improved performance for editor operations
- **Enhanced Editor**: Better editor support for editing content

### Editor Features
- **Scene Tree**: Enhanced scene tree for organizing scenes
- **Inspector**: Enhanced inspector for editing node properties
- **Assets**: Enhanced assets for managing assets
- **Tools**: Enhanced tools for editing content

## New Features in Godot 4.7

### Editor Features
- **EditorInterface**: Enhanced editor interface system
- **EditorPlugin**: Enhanced editor plugin system
- **EditorScene**: Enhanced editor scene system
- **EditorResource**: Enhanced editor resource system
- **Better Performance**: Improved performance for editor operations
- **Enhanced Editor**: Better editor support for editing content

### Editor Tools
- **Script Editor**: Enhanced script editor
- **Visual Script**: Enhanced visual script
- **Shader Editor**: Enhanced shader editor
- **Plugin System**: Enhanced plugin system

## Technical Implementation

### File: editor_interface.gd
```gdscript
extends EditorInterface

@export_group("Editor Interface Properties")
@export var scene_tree: bool = false
@export var inspector: bool = false
@export var assets: bool = false
@export var tools: bool = false

@export_group("Editor Interface Features")
@export var script_editor: bool = false
@export var visual_script: bool = false
@export var shader_editor: bool = false
@export var plugin_system: bool = false

func _ready() -> void:
    # Set up the editor interface
    if scene_tree:
        # Access the scene tree
        var scene_tree = get_scene_tree()
    
    if inspector:
        # Access the inspector
        var inspector = get_inspector()
    
    if assets:
        # Access the assets
        var assets = get_assets()
    
    if tools:
        # Access the tools
        var tools = get_tools()

func _process(delta: float) -> void:
    # Update the editor interface

func open_scene_tree() -> void:
    # Open the scene tree
    scene_tree.show()

func open_inspector() -> void:
    # Open the inspector
    inspector.show()

func open_assets() -> void:
    # Open the assets
    assets.show()

func open_tools() -> void:
    # Open the tools
    tools.show()

func open_script_editor() -> void:
    # Open the script editor
    script_editor.show()

func open_visual_script() -> void:
    # Open the visual script
    visual_script.show()

func open_shader_editor() -> void:
    # Open the shader editor
    shader_editor.show()

func open_plugin_system() -> void:
    # Open the plugin system
    plugin_system.show()
```

### File: editor_plugin.gd
```gdscript
extends EditorPlugin

@export_group("Editor Plugin Properties")
@export var plugin_name: String = ""
@export var plugin_description: String = ""
@export var plugin_author: String = ""
@export var plugin_version: String = ""

@export_group("Plugin Features")
@export var scene_tree: bool = false
@export var inspector: bool = false
@export var assets: bool = false
@export var tools: bool = false

func _ready() -> void:
    # Set up the editor plugin
    if plugin_name:
        add_custom_type(plugin_name, plugin_description, plugin_author, plugin_version)
    
    if scene_tree:
        # Add scene tree functionality
        add_scene_tree()
    
    if inspector:
        # Add inspector functionality
        add_inspector()
    
    if assets:
        # Add assets functionality
        add_assets()
    
    if tools:
        # Add tools functionality
        add_tools()

func _process(delta: float) -> void:
    # Update the editor plugin

func add_custom_type(name: String, description: String, author: String, version: String) -> void:
    # Add a custom type
    add_custom_type(name, description, author, version)

func add_scene_tree() -> void:
    # Add scene tree functionality
    var scene_tree = EditorSceneTree.new()
    add_child(scene_tree)

func add_inspector() -> void:
    # Add inspector functionality
    var inspector = EditorInspector.new()
    add_child(inspector)

func add_assets() -> void:
    # Add assets functionality
    var assets = EditorAssets.new()
    add_child(assets)

func add_tools() -> void:
    # Add tools functionality
    var tools = EditorTools.new()
    add_child(tools)
```

### File: editor_scene.gd
```gdscript
extends EditorScene

@export_group("Editor Scene Properties")
@export var scene_name: String = ""
@export var scene_path: String = ""
@export var scene_type: int = 0

@export_group("Scene Features")
@export var scene_tree: bool = false
@export var inspector: bool = false
@export var assets: bool = false
@export var tools: bool = false

func _ready() -> void:
    # Set up the editor scene
    if scene_name:
        # Load the scene
        load_scene(scene_name)
    
    if scene_path:
        # Load the scene from path
        load_scene_from_path(scene_path)
    
    if scene_type != 0:
        # Set the scene type
        set_scene_type(scene_type)

func _process(delta: float) -> void:
    # Update the editor scene

func load_scene(name: String) -> void:
    # Load a scene
    var scene = load(name)
    if scene:
        # Open the scene
        open_scene(scene)

func load_scene_from_path(path: String) -> void:
    # Load a scene from path
    var scene = load(path)
    if scene:
        # Open the scene
        open_scene(scene)

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
```

### File: editor_resource.gd
```gdscript
extends EditorResource

@export_group("Editor Resource Properties")
@export var resource_name: String = ""
@export var resource_path: String = ""
@export var resource_type: int = 0

@export_group("Resource Features")
@export var inspector: bool = false
@export var assets: bool = false
@export var tools: bool = false

func _ready() -> void:
    # Set up the editor resource
    if resource_name:
        # Load the resource
        load_resource(resource_name)
    
    if resource_path:
        # Load the resource from path
        load_resource_from_path(resource_path)
    
    if resource_type != 0:
        # Set the resource type
        set_resource_type(resource_type)

func _process(delta: float) -> void:
    # Update the editor resource

func load_resource(name: String) -> void:
    # Load a resource
    var resource = load(name)
    if resource:
        # Open the resource
        open_resource(resource)

func load_resource_from_path(path: String) -> void:
    # Load a resource from path
    var resource = load(path)
    if resource:
        # Open the resource
        open_resource(resource)

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
```

## Unusual Things

### Editor Interface
- **Complex Setup**: Editor interface requires complex setup
- **Performance Cost**: Editor interface has a performance cost
- **Debugging**: Editor interface can be difficult to debug

### Editor Plugins
- **Extension**: Editor plugins extend editor functionality
- **Performance Cost**: Editor plugins have a performance cost
- **Complexity**: Editor plugins can be complex

### Editor Scenes
- **Scene Management**: Editor scenes manage scenes
- **Performance Cost**: Editor scenes have a performance cost
- **Complexity**: Editor scenes can be complex

### Editor Resources
- **Resource Management**: Editor resources manage resources
- **Performance Cost**: Editor resources have a performance cost
- **Complexity**: Editor resources can be complex

## Recommendations

### For Editor Interface
- **Use EditorInterface**: Always use `EditorInterface` for accessing editor functionality
- **Organize Scenes**: Organize scenes in editor interface
- **Organize Resources**: Organize resources in editor interface
- **Test in Editor**: Always test in editor

### For Editor Plugins
- **Use EditorPlugin**: Always use `EditorPlugin` for creating editor plugins
- **Organize Plugins**: Organize plugins in editor
- **Test in Editor**: Always test in editor

### For Editor Scenes
- **Use EditorScene**: Always use `EditorScene` for editing scenes
- **Organize Scenes**: Organize scenes in editor
- **Test in Editor**: Always test in editor

### For Editor Resources
- **Use EditorResource**: Always use `EditorResource` for editing resources
- **Organize Resources**: Organize resources in editor
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Scenes**: Avoid using too many scenes without optimization
- **Complex Plugins**: Avoid using complex editor plugins without optimization
- **Unbounded Resources**: Avoid creating unbounded editor resources

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Editor Interface
- **Incorrect Setup**: Incorrect editor interface setup can cause issues
- **Performance Issues**: Complex editor interface can cause performance issues
- **Debugging**: Editor interface can be difficult to debug

### Editor Plugins
- **Complex Setup**: Editor plugins require complex setup
- **Performance Issues**: Complex editor plugins can cause performance issues
- **Debugging**: Editor plugins can be difficult to debug

### Editor Scenes
- **Incorrect Setup**: Incorrect editor scene setup can cause issues
- **Performance Issues**: Complex editor scenes can cause performance issues
- **Complexity**: Editor scenes can be complex

### Editor Resources
- **Incorrect Setup**: Incorrect editor resource setup can cause issues
- **Performance Issues**: Complex editor resources can cause performance issues
- **Complexity**: Editor resources can be complex

## ELI5: Editor Interface

Imagine you have a bunch of tools for editing content. EditorInterface is like a system that provides access to these tools.

### Example: Using Editor Interface
```gdscript
extends EditorInterface

func _ready() -> void:
    # Create an editor interface
    var editor_interface = EditorInterface.new()
    add_child(editor_interface)
    
    # Open the scene tree
    editor_interface.open_scene_tree()
    
    # Open the inspector
    editor_interface.open_inspector()
    
    # Open the assets
    editor_interface.open_assets()
    
    # Open the tools
    editor_interface.open_tools()
```

## ELI5: Editor Plugins

Imagine you have a bunch of tools for extending editor functionality. EditorPlugin is like a system that can extend editor functionality.

### Example: Using Editor Plugins
```gdscript
extends EditorPlugin

func _ready() -> void:
    # Create an editor plugin
    var editor_plugin = EditorPlugin.new()
    add_child(editor_plugin)
    
    # Set the plugin name
    editor_plugin.plugin_name = "My Plugin"
    
    # Set the plugin description
    editor_plugin.plugin_description = "A plugin for editing content"
    
    # Set the plugin author
    editor_plugin.plugin_author = "John Doe"
    
    # Set the plugin version
    editor_plugin.plugin_version = "1.0.0"
    
    # Add scene tree functionality
    editor_plugin.add_scene_tree()
    
    # Add inspector functionality
    editor_plugin.add_inspector()
    
    # Add assets functionality
    editor_plugin.add_assets()
    
    # Add tools functionality
    editor_plugin.add_tools()
```

## ELI5: Editor Scenes

Imagine you have a bunch of scenes for editing content. EditorScene is like a system that can edit scenes.

### Example: Using Editor Scenes
```gdscript
extends EditorScene

func _ready() -> void:
    # Create an editor scene
    var editor_scene = EditorScene.new()
    add_child(editor_scene)
    
    # Set the scene name
    editor_scene.scene_name = "My Scene"
    
    # Set the scene path
    editor_scene.scene_path = "res://scenes/my_scene.tscn"
    
    # Set the scene type
    editor_scene.scene_type = 0
    
    # Load the scene
    editor_scene.load_scene("My Scene")
    
    # Load the scene from path
    editor_scene.load_scene_from_path("res://scenes/my_scene.tscn")
```

## ELI5: Editor Resources

Imagine you have a bunch of resources for editing content. EditorResource is like a system that can edit resources.

### Example: Using Editor Resources
```gdscript
extends EditorResource

func _ready() -> void:
    # Create an editor resource
    var editor_resource = EditorResource.new()
    add_child(editor_resource)
    
    # Set the resource name
    editor_resource.resource_name = "My Resource"
    
    # Set the resource path
    editor_resource.resource_path = "res://resources/my_resource.tres"
    
    # Set the resource type
    editor_resource.resource_type = 0
    
    # Load the resource
    editor_resource.load_resource("My Resource")
    
    # Load the resource from path
    editor_resource.load_resource_from_path("res://resources/my_resource.tres")
```

## Best Practices Summary

1. **Use EditorInterface** for accessing editor functionality
2. **Use EditorPlugin** for creating editor plugins
3. **Use EditorScene** for editing scenes
4. **Use EditorResource** for editing resources
5. **Organize Scenes** in editor
6. **Organize Resources** in editor
7. **Test in Editor** for proper setup
8. **Always clean up** unused nodes to prevent memory leaks
