---
name: godot-import
description: Godot Engine import plugins, file formats, and resource management.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Import

## Overview
Godot Engine's import system provides powerful tools for creating games with features like import plugins, file format support, and resource management. This skill covers everything you need to know to create efficient and organized content in Godot 4.7.

## Key Insights

### Import Plugins
- **Custom Import**: Custom import plugins for importing custom file formats
- **Import Options**: Import options for customizing import behavior
- **Import Settings**: Import settings for configuring import behavior
- **Import Resources**: Import resources for managing imported resources

### File Format Support
- **Image Formats**: Support for various image formats
- **Audio Formats**: Support for various audio formats
- **Video Formats**: Support for various video formats
- **3D Formats**: Support for various 3D formats

### Resource Management
- **Resource Paths**: Resource paths for managing resources
- **Resource Loading**: Resource loading for loading resources
- **Resource Saving**: Resource saving for saving resources
- **Resource Unloading**: Resource unloading for unloading resources

## Major Version Differences (3.x vs 4.x)

### Import System Changes
- **Import Plugins**: New import plugin system for importing custom file formats
- **Import Options**: New import options for customizing import behavior
- **Import Settings**: New import settings for configuring import behavior
- **Import Resources**: New import resource system for managing imported resources
- **Better Performance**: Improved performance for import operations
- **Enhanced Editor**: Better editor support for import management

### File Format Support
- **Image Formats**: Enhanced support for various image formats
- **Audio Formats**: Enhanced support for various audio formats
- **Video Formats**: Enhanced support for various video formats
- **3D Formats**: Enhanced support for various 3D formats

## New Features in Godot 4.7

### Import Features
- **Import Plugins**: Enhanced import plugin system
- **Import Options**: Enhanced import options
- **Import Settings**: Enhanced import settings
- **Import Resources**: Enhanced import resource system
- **Better Performance**: Improved performance for import operations
- **Enhanced Editor**: Better editor support for import management

### File Format Support
- **Image Formats**: Enhanced support for various image formats
- **Audio Formats**: Enhanced support for various audio formats
- **Video Formats**: Enhanced support for various video formats
- **3D Formats**: Enhanced support for various 3D formats

## Technical Implementation

### File: import_plugin.gd
```gdscript
extends EditorImportPlugin

@export_group("Import Plugin Properties")
@export var plugin_name: String = ""
@export var plugin_description: String = ""
@export var plugin_author: String = ""
@export var plugin_version: String = ""

@export_group("Import Features")
@export var import_images: bool = false
@export var import_audios: bool = false
@export var import_videos: bool = false
@export var import_3d: bool = false

func _ready() -> void:
    # Set up the import plugin
    if plugin_name:
        add_import_plugin(plugin_name, plugin_description, plugin_author, plugin_version)
    
    if import_images:
        # Import images
        import_image_format("png")
        import_image_format("jpg")
        import_image_format("jpeg")
        import_image_format("bmp")
        import_image_format("tga")
        import_image_format("webp")
    
    if import_audios:
        # Import audios
        import_audio_format("ogg")
        import_audio_format("wav")
        import_audio_format("mp3")
        import_audio_format("flac")
    
    if import_videos:
        # Import videos
        import_video_format("mp4")
        import_video_format("webm")
    
    if import_3d:
        # Import 3D
        import_3d_format("gltf")
        import_3d_format("glb")
        import_3d_format("obj")
        import_3d_format("fbx")

func _process(delta: float) -> void:
    # Update the import plugin

func add_import_plugin(name: String, description: String, author: String, version: String) -> void:
    # Add an import plugin
    add_import_plugin(name, description, author, version)

func import_image_format(format: String) -> void:
    # Import an image format
    add_import_format(format, "Image", "image", "ImageImport")

func import_audio_format(format: String) -> void:
    # Import an audio format
    add_import_format(format, "Audio", "audio", "AudioImport")

func import_video_format(format: String) -> void:
    # Import a video format
    add_import_format(format, "Video", "video", "VideoImport")

func import_3d_format(format: String) -> void:
    # Import a 3D format
    add_import_format(format, "3D", "3d", "3DImport")
```

### File: import_options.gd
```gdscript
extends EditorImportOptions

@export_group("Import Options Properties")
@export var option_name: String = ""
@export var option_description: String = ""
@export var option_type: int = 0

@export_group("Import Options Features")
@export var option_default: Variant = null
@export var option_min: Variant = null
@export var option_max: Variant = null
@export var option_step: Variant = null

func _ready() -> void:
    # Set up the import options
    if option_name:
        add_option(option_name, option_description, option_type, option_default, option_min, option_max, option_step)

func _process(delta: float) -> void:
    # Update the import options

func add_option(name: String, description: String, type: int, default: Variant, min: Variant, max: Variant, step: Variant) -> void:
    # Add an option
    add_option(name, description, type, default, min, max, step)
```

### File: import_settings.gd
```gdscript
extends EditorImportSettings

@export_group("Import Settings Properties")
@export var settings_name: String = ""
@export var settings_description: String = ""

@export_group("Import Settings Features")
@export var settings_option: bool = false
@export var settings_value: Variant = null

func _ready() -> void:
    # Set up the import settings
    if settings_name:
        add_settings(settings_name, settings_description)
    
    if settings_option:
        # Add a setting option
        add_setting_option(settings_option, settings_value)

func _process(delta: float) -> void:
    # Update the import settings

func add_settings(name: String, description: String) -> void:
    # Add settings
    add_settings(name, description)

func add_setting_option(option: bool, value: Variant) -> void:
    # Add a setting option
    add_setting_option(option, value)
```

### File: import_resource.gd
```gdscript
extends EditorImportResource

@export_group("Import Resource Properties")
@export var resource_name: String = ""
@export var resource_path: String = ""
@export var resource_type: int = 0

@export_group("Import Resource Features")
@export var resource_import: bool = false
@export var resource_options: Dictionary = {}

func _ready() -> void:
    # Set up the import resource
    if resource_name:
        # Import the resource
        import_resource(resource_name)
    
    if resource_path:
        # Import the resource from path
        import_resource_from_path(resource_path)
    
    if resource_type != 0:
        # Set the resource type
        set_resource_type(resource_type)

func _process(delta: float) -> void:
    # Update the import resource

func import_resource(name: String) -> void:
    # Import a resource
    if resource_import:
        # Import the resource
        pass

func import_resource_from_path(path: String) -> void:
    # Import a resource from path
    var resource = load(path)
    if resource:
        # Import the resource
        import_resource(resource)

func set_resource_type(type: int) -> void:
    # Set the resource type
    match type:
        0:  # Image
            set_resource_type_image()
        
        1:  # Audio
            set_resource_type_audio()
        
        2:  # Video
            set_resource_type_video()
        
        3:  # 3D
            set_resource_type_3d()

func set_resource_type_image() -> void:
    # Set the resource type to image
    # Implementation
    pass

func set_resource_type_audio() -> void:
    # Set the resource type to audio
    # Implementation
    pass

func set_resource_type_video() -> void:
    # Set the resource type to video
    # Implementation
    pass

func set_resource_type_3d() -> void:
    # Set the resource type to 3D
    # Implementation
    pass
```

## Unusual Things

### Import Plugins
- **Custom Import**: Custom import plugins for importing custom file formats
- **Performance Cost**: Import plugins have a performance cost
- **Complexity**: Import plugins can be complex

### Import Options
- **Import Options**: Import options for customizing import behavior
- **Performance Cost**: Import options have a performance cost
- **Complexity**: Import options can be complex

### Import Settings
- **Import Settings**: Import settings for configuring import behavior
- **Performance Cost**: Import settings have a performance cost
- **Complexity**: Import settings can be complex

### Import Resources
- **Import Resources**: Import resources for managing imported resources
- **Performance Cost**: Import resources have a performance cost
- **Complexity**: Import resources can be complex

## Recommendations

### For Import Plugins
- **Use EditorImportPlugin**: Always use `EditorImportPlugin` for creating import plugins
- **Organize Import Plugins**: Organize import plugins in editor
- **Test in Editor**: Always test in editor

### For Import Options
- **Use EditorImportOptions**: Always use `EditorImportOptions` for creating import options
- **Organize Import Options**: Organize import options in editor
- **Test in Editor**: Always test in editor

### For Import Settings
- **Use EditorImportSettings**: Always use `EditorImportSettings` for creating import settings
- **Organize Import Settings**: Organize import settings in editor
- **Test in Editor**: Always test in editor

### For Import Resources
- **Use EditorImportResource**: Always use `EditorImportResource` for creating import resources
- **Organize Import Resources**: Organize import resources in editor
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Import Plugins**: Avoid using too many import plugins without optimization
- **Complex Import Options**: Avoid using complex import options without optimization
- **Unbounded Import Resources**: Avoid creating unbounded import resources

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Import Plugins
- **Incorrect Setup**: Incorrect import plugin setup can cause issues
- **Performance Issues**: Complex import plugins can cause performance issues
- **Complexity**: Import plugins can be complex

### Import Options
- **Incorrect Setup**: Incorrect import option setup can cause issues
- **Performance Issues**: Complex import options can cause performance issues
- **Complexity**: Import options can be complex

### Import Settings
- **Incorrect Setup**: Incorrect import setting setup can cause issues
- **Performance Issues**: Complex import settings can cause performance issues
- **Complexity**: Import settings can be complex

### Import Resources
- **Incorrect Setup**: Incorrect import resource setup can cause issues
- **Performance Issues**: Complex import resources can cause performance issues
- **Complexity**: Import resources can be complex

## ELI5: Import Plugins

Imagine you have a bunch of custom file formats that need to be imported. Import plugins are like tools that can import these custom file formats.

### Example: Using Import Plugins
```gdscript
extends EditorImportPlugin

func _ready() -> void:
    # Create an import plugin
    var import_plugin = EditorImportPlugin.new()
    add_child(import_plugin)
    
    # Set the plugin name
    import_plugin.plugin_name = "My Import Plugin"
    
    # Set the plugin description
    import_plugin.plugin_description = "A plugin for importing custom file formats"
    
    # Set the plugin author
    import_plugin.plugin_author = "John Doe"
    
    # Set the plugin version
    import_plugin.plugin_version = "1.0.0"
    
    # Import images
    import_plugin.import_image_format("png")
    import_plugin.import_image_format("jpg")
    import_plugin.import_image_format("jpeg")
    import_plugin.import_image_format("bmp")
    import_plugin.import_image_format("tga")
    import_plugin.import_image_format("webp")
    
    # Import audios
    import_plugin.import_audio_format("ogg")
    import_plugin.import_audio_format("wav")
    import_plugin.import_audio_format("mp3")
    import_plugin.import_audio_format("flac")
    
    # Import videos
    import_plugin.import_video_format("mp4")
    import_plugin.import_video_format("webm")
    
    # Import 3D
    import_plugin.import_3d_format("gltf")
    import_plugin.import_3d_format("glb")
    import_plugin.import_3d_format("obj")
    import_plugin.import_3d_format("fbx")
```

## ELI5: Import Options

Imagine you have a bunch of options for importing custom file formats. Import options are like tools that can customize import behavior.

### Example: Using Import Options
```gdscript
extends EditorImportOptions

func _ready() -> void:
    # Create an import options
    var import_options = EditorImportOptions.new()
    add_child(import_options)
    
    # Set the option name
    import_options.option_name = "My Option"
    
    # Set the option description
    import_options.option_description = "An option for customizing import behavior"
    
    # Set the option type
    import_options.option_type = EditorImportOptions.TYPE_BOOL
    
    # Set the option default
    import_options.option_default = true
    
    # Set the option min
    import_options.option_min = false
    
    # Set the option max
    import_options.option_max = true
    
    # Set the option step
    import_options.option_step = 1
    
    # Add the option
    import_options.add_option("My Option", "An option for customizing import behavior", EditorImportOptions.TYPE_BOOL, true, false, true, 1)
```

## ELI5: Import Settings

Imagine you have a bunch of settings for importing custom file formats. Import settings are like tools that can configure import behavior.

### Example: Using Import Settings
```gdscript
extends EditorImportSettings

func _ready() -> void:
    # Create an import settings
    var import_settings = EditorImportSettings.new()
    add_child(import_settings)
    
    # Set the settings name
    import_settings.settings_name = "My Settings"
    
    # Set the settings description
    import_settings.settings_description = "Settings for configuring import behavior"
    
    # Set the settings option
    import_settings.settings_option = true
    
    # Set the settings value
    import_settings.settings_value = true
    
    # Add the settings
    import_settings.add_settings("My Settings", "Settings for configuring import behavior")
    
    # Add the setting option
    import_settings.add_setting_option(true, true)
```

## ELI5: Import Resources

Imagine you have a bunch of resources for importing custom file formats. Import resources are like tools that can manage imported resources.

### Example: Using Import Resources
```gdscript
extends EditorImportResource

func _ready() -> void:
    # Create an import resource
    var import_resource = EditorImportResource.new()
    add_child(import_resource)
    
    # Set the resource name
    import_resource.resource_name = "My Resource"
    
    # Set the resource path
    import_resource.resource_path = "res://resources/my_resource.tres"
    
    # Set the resource type
    import_resource.resource_type = 0
    
    # Set the resource import
    import_resource.resource_import = true
    
    # Set the resource options
    import_resource.resource_options = {"option1": true, "option2": false}
    
    # Import the resource
    import_resource.import_resource("My Resource")
    
    # Import the resource from path
    import_resource.import_resource_from_path("res://resources/my_resource.tres")
```

## Best Practices Summary

1. **Use EditorImportPlugin** for creating import plugins
2. **Use EditorImportOptions** for creating import options
3. **Use EditorImportSettings** for creating import settings
4. **Use EditorImportResource** for creating import resources
5. **Organize Import Plugins** in editor
6. **Organize Import Options** in editor
7. **Organize Import Settings** in editor
8. **Organize Import Resources** in editor
9. **Test in Editor** for proper setup
10. **Always clean up** unused nodes to prevent memory leaks
