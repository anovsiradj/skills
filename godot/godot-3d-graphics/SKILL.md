---
name: godot-3d-graphics
description: Godot Engine 3D graphics, PBR materials, lighting, and post-processing.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# 3D Graphics

## Overview
Godot Engine's 3D graphics system provides powerful tools for creating 3D content with features like physically-based rendering (PBR), advanced lighting, and post-processing effects. This skill covers everything you need to know to create stunning 3D graphics in Godot 4.7.

## Key Insights

### PBR Material System
- **Disney PBR Model**: Follows the Disney PBR model (Roughness-Metallic)
- **ORM Textures**: Uses a packed texture for Occlusion, Roughness, and Metallic in separate channels
- **Material Properties**: Supports diffuse, normal, metallic, roughness, and occlusion maps

### Lighting System
- **Directional Lights**: Sun/moon lights with shadows
- **Omni Lights**: Omnidirectional lights with shadows
- **Spot Lights**: Spotlight lights with adjustable cone angle and attenuation
- **Area Lights**: Rectangular area lights with optional textures
- **Clustered Rendering**: Clustered forward optimizations for Forward+ renderer

### Global Illumination
- **LightmapGI**: Baked, high quality, static global illumination
- **VoxelGI**: Dynamic, local area global illumination
- **SDFGI**: Dynamic, large open world global illumination
- **SSIL**: Screen-space indirect lighting

## Major Version Differences (3.x vs 4.x)

### Rendering Pipeline Changes
- **SDFGI**: A massive addition to Godot 4 for real-time GI in open worlds without baking
- **Vulkan Backend**: Significant visual jump over GLES3, allowing for better materials and lighting
- **Annotations**: Use `@export_flags_3d_render` and `@export_flags_3d_physics` for advanced editor features
- **Renderer Options**: Three renderers: Forward+, Mobile, and Compatibility

### Performance Improvements
- **Clustered Rendering**: Clustered forward optimizations for better performance
- **Distance Fade**: Distance fade system to fade distant lights and decals
- **Shadow Optimization**: Optimized shadow mapping for better performance

## New Features in Godot 4.7

### Global Illumination
- **SDFGI**: Supports real-time global illumination for large environments
- **VoxelGI**: Optimized for localized reflections and lighting
- **SSIL**: Screen-space indirect lighting at half or full resolution

### Rendering Features
- **Variable Rate Shading**: Variable rate shading on supported GPUs
- **Resolution Scaling**: Support for rendering 3D at a lower resolution
- **Texture Filtering**: Nearest, bilinear, trilinear, or anisotropic filtering

### Material Features
- **ORM Textures**: Packed texture for Occlusion, Roughness, and Metallic
- **Normal Mapping**: Normal mapping for detailed surface appearance
- **Parallax Mapping**: Parallax/relief mapping with automatic level of detail

## Technical Implementation

### File: material_3d.gd
```gdscript
extends BaseMaterial3D

@export_group("PBR Properties")
@export var albedo_color: Color = Color.WHITE
@export var albedo_texture: Texture2D
@export var normal_texture: Texture2D
@export var metallic_texture: Texture2D
@export var roughness_texture: Texture2D
@export var occlusion_texture: Texture2D
@export var emission_texture: Texture2D
@export var emission_color: Color = Color.WHITE

@export_group("PBR Parameters")
@export var metallic: float = 0.0
@export var roughness: float = 0.5
@export var occlusion_strength: float = 1.0
@export var emission_energy: float = 1.0

@export_group("Advanced Properties")
@export var clearcoat_enabled: bool = false
@export var clearcoat_roughness: float = 0.0
@export var anisotropy_enabled: bool = false
@export var anisotropy: float = 0.0
@export var height_map_enabled: bool = false
@export var height_map_scale: float = 0.1

func _ready() -> void:
    # Set up the material
    albedo_color = albedo_color
    metallic = metallic
    roughness = roughness
    occlusion_strength = occlusion_strength
    emission_energy = emission_energy
    
    if clearcoat_enabled:
        clearcoat = 1.0
        clearcoat_roughness = clearcoat_roughness
    
    if anisotropy_enabled:
        anisotropy = anisotropy
    
    if height_map_enabled:
        height_map_scale = height_map_scale
```

### File: lighting_3d.gd
```gdscript
extends Node3D

@export_group("Light Properties")
@export var light_type: int = 0
@export var light_color: Color = Color.WHITE
@export var light_energy: float = 1.0
@export var light_intensity: float = 1.0
@export var light_size: float = 1.0

@export_group("Shadow Properties")
@export var cast_shadows: bool = true
@export var shadow_color: Color = Color.BLACK
@export var shadow_bias: float = 0.001
@export var shadow_blur: float = 0.0

@export_group("Attenuation Properties")
@export var attenuation_mode: int = 0
@export var attenuation_start: float = 0.0
@export var attenuation_distance: float = 10.0

@export_group("Cone Properties (Spot Lights)")
@export var spot_angle: float = 45.0
@export var spot_attenuation: float = 1.0

func _ready() -> void:
    # Create the appropriate light type
    match light_type:
        0:  # DirectionalLight3D
            var light = DirectionalLight3D.new()
            light.color = light_color
            light.energy = light_energy
            light.intensity = light_intensity
            light.size = light_size
            light.cast_shadows = cast_shadows
            light.shadow_color = shadow_color
            light.shadow_bias = shadow_bias
            light.shadow_blur = shadow_blur
            add_child(light)
        
        1:  # OmniLight3D
            var light = OmniLight3D.new()
            light.color = light_color
            light.energy = light_energy
            light.intensity = light_intensity
            light.size = light_size
            light.cast_shadows = cast_shadows
            light.shadow_color = shadow_color
            light.shadow_bias = shadow_bias
            light.shadow_blur = shadow_blur
            light.attenuation = attenuation_mode
            add_child(light)
        
        2:  # SpotLight3D
            var light = SpotLight3D.new()
            light.color = light_color
            light.energy = light_energy
            light.intensity = light_intensity
            light.size = light_size
            light.cast_shadows = cast_shadows
            light.shadow_color = shadow_color
            light.shadow_bias = shadow_bias
            light.shadow_blur = shadow_blur
            light.spot_angle = spot_angle
            light.spot_attenuation = spot_attenuation
            add_child(light)
        
        3:  # AreaLight3D
            var light = AreaLight3D.new()
            light.color = light_color
            light.energy = light_energy
            light.intensity = light_intensity
            light.size = light_size
            light.cast_shadows = cast_shadows
            light.shadow_color = shadow_color
            light.shadow_bias = shadow_bias
            light.shadow_blur = shadow_blur
            add_child(light)
```

### File: gi_system.gd
```gdscript
extends Node3D

@export_group("GI Properties")
@export var gi_type: int = 0
@export var gi_energy: float = 1.0
@export var gi_quality: int = 1

@export_group("Lightmap Properties")
@export var lightmap_size: int = 1024
@export var lightmap_bounces: int = 3
@export var lightmap_max_bounces: int = 3

@export_group("VoxelGI Properties")
@export var voxelgi_size: int = 32
@export var voxelgi_quality: int = 1

@export_group("SDFGI Properties")
@export var sdfgi_size: int = 32
@export var sdfgi_quality: int = 1

@export_group("SSIL Properties")
@export var ssil_radius: float = 1.0
@export var ssil_intensity: float = 1.0

func _ready() -> void:
    # Create the appropriate GI type
    match gi_type:
        0:  # LightmapGI
            var gi = LightmapGI.new()
            gi.energy = gi_energy
            gi.quality = gi_quality
            gi.bounces = lightmap_bounces
            gi.max_bounces = lightmap_max_bounces
            add_child(gi)
        
        1:  # VoxelGI
            var gi = VoxelGI.new()
            gi.energy = gi_energy
            gi.quality = gi_quality
            gi.size = voxelgi_size
            add_child(gi)
        
        2:  # SDFGI
            var gi = SDFGI.new()
            gi.energy = gi_energy
            gi.quality = gi_quality
            gi.size = sdfgi_size
            add_child(gi)
        
        3:  # SSIL
            var gi = SSIL.new()
            gi.radius = ssil_radius
            gi.intensity = ssil_intensity
            add_child(gi)
```

### File: post_processing.gd
```gdscript
extends Node3D

@export_group("Post-Processing Properties")
@export var tonemapping: int = 0
@export var exposure: float = 1.0
@export var white: float = 1.0

@export_group("Bloom Properties")
@export var bloom_enabled: bool = false
@export var bloom_intensity: float = 1.0
@export var bloom_threshold: float = 1.0

@export_group("DOF Properties")
@export var dof_enabled: bool = false
@export var dof_distance: float = 10.0
@export var dof_focal_size: float = 5.0

@export_group("SSAO Properties")
@export var ssao_enabled: bool = false
@export var ssao_radius: float = 1.0
@export var ssao_intensity: float = 1.0

func _ready() -> void:
    # Create the post-processing environment
    var environment = Environment.new()
    environment.tonemap_mode = tonemapping
    environment.exposure = exposure
    environment.white = white
    
    if bloom_enabled:
        environment.bloom_intensity = bloom_intensity
        environment.bloom_threshold = bloom_threshold
    
    if dof_enabled:
        environment.dof_blur_far_distance = dof_distance
        environment.dof_blur_far_transition = dof_focal_size
    
    if ssao_enabled:
        environment.ssao_radius = ssao_radius
        environment.ssao_intensity = ssao_intensity
    
    # Set up the world environment
    var world_environment = WorldEnvironment.new()
    world_environment.environment = environment
    add_child(world_environment)
```

## Unusual Things

### ORM Textures
- **Packed Texture**: Godot uses a packed texture for Occlusion, Roughness, and Metallic in separate channels
- **Memory Efficiency**: This reduces the number of texture samples and improves performance
- **UV Space**: All three channels are stored in the same UV space

### Clustered Rendering
- **Performance**: Clustered rendering provides better performance for scenes with many lights
- **Memory Usage**: Requires more memory for storing light data
- **Complexity**: More complex than forward rendering but provides better performance

### SDFGI
- **Real-time GI**: SDFGI provides real-time global illumination for large environments
- **Performance Cost**: Requires significant GPU resources
- **Memory Usage**: Requires significant memory for storing signed distance fields

## Recommendations

### For Materials
- **Use ORM Textures**: Always use ORM textures for PBR materials
- **Optimize Roughness**: Use appropriate roughness values for different materials
- **Use Normal Maps**: Use normal maps for detailed surface appearance
- **Test on Target Devices**: Test materials on target devices for optimal performance

### For Lighting
- **Use Clustered Rendering**: Use clustered rendering for scenes with many lights
- **Optimize Shadows**: Optimize shadow settings for better performance
- **Use Distance Fade**: Use distance fade to hide far-away lights
- **Test Lighting**: Test lighting in the editor for proper setup

### For Global Illumination
- **Use LightmapGI for Static Scenes**: Use LightmapGI for static scenes
- **Use VoxelGI for Indoor Scenes**: Use VoxelGI for indoor scenes
- **Use SDFGI for Open Worlds**: Use SDFGI for open worlds
- **Use SSIL for Dynamic Scenes**: Use SSIL for dynamic scenes

## Prohibitions

### Performance Issues
- **Too Many Lights**: Avoid using too many lights without optimization
- **Complex GI**: Avoid using complex GI systems without optimization
- **High-Quality Settings**: Avoid using high-quality settings without considering performance

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Materials
- **Incorrect Roughness**: Incorrect roughness values can cause materials to look unrealistic
- **Incorrect Metallic**: Incorrect metallic values can cause materials to look unrealistic
- **Texture Issues**: Texture issues can cause materials to look incorrect

### Lighting
- **Incorrect Shadows**: Incorrect shadow settings can cause shadows to look incorrect
- **Performance Issues**: Too many lights can cause performance issues
- **Light Bleeding**: Light bleeding can occur with too many lights

### Global Illumination
- **Incorrect Setup**: Incorrect GI setup can cause GI to look incorrect
- **Performance Issues**: Complex GI systems can cause performance issues
- **Memory Issues**: GI systems can cause memory issues

## ELI5: PBR Materials

Imagine you have a bunch of materials like wood, metal, and plastic. Each material has different properties:
- **Wood**: Rough, matte, not metallic
- **Metal**: Smooth, shiny, metallic
- **Plastic**: Smooth, matte, not metallic

PBR (Physically-Based Rendering) is like a system that understands these properties and renders them realistically based on how light interacts with them in the real world.

### Example: Creating PBR Materials
```gdscript
extends BaseMaterial3D

func _ready() -> void:
    # Create a wood material
    var wood_material = StandardMaterial3D.new()
    wood_material.albedo_color = Color(0.5, 0.3, 0.1)  # Brown
    wood_material.roughness = 0.8  # Rough
    wood_material.metallic = 0.0  # Not metallic
    wood_material.normal_scale = 0.5  # Normal map
    
    # Create a metal material
    var metal_material = StandardMaterial3D.new()
    metal_material.albedo_color = Color(0.8, 0.8, 0.8)  # Gray
    metal_material.roughness = 0.2  # Smooth
    metal_material.metallic = 1.0  # Metallic
    metal_material.normal_scale = 0.5  # Normal map
    
    # Create a plastic material
    var plastic_material = StandardMaterial3D.new()
    plastic_material.albedo_color = Color(0.3, 0.3, 0.8)  # Blue
    plastic_material.roughness = 0.3  # Smooth but not too smooth
    plastic_material.metallic = 0.0  # Not metallic
    plastic_material.normal_scale = 0.5  # Normal map
```

## ELI5: Lighting

Imagine you have a room with different light sources:
- **Sunlight**: A big, bright light from above
- **Lamp**: A smaller, directional light
- **Bulb**: A small, omnidirectional light

In Godot, you can create these light sources using different types of lights:
- **DirectionalLight3D**: Like sunlight
- **OmniLight3D**: Like a bulb
- **SpotLight3D**: Like a lamp
- **AreaLight3D**: Like a large panel light

### Example: Setting Up Lighting
```gdscript
extends Node3D

func _ready() -> void:
    # Create a directional light (sun)
    var sun = DirectionalLight3D.new()
    sun.color = Color.WHITE
    sun.energy = 1.0
    sun.intensity = 1.0
    sun.cast_shadows = true
    add_child(sun)
    
    # Create an omni light (bulb)
    var bulb = OmniLight3D.new()
    bulb.color = Color.YELLOW
    bulb.energy = 0.5
    bulb.intensity = 1.0
    bulb.cast_shadows = true
    bulb.position = Vector3(2, 2, 0)
    add_child(bulb)
    
    # Create a spot light (lamp)
    var lamp = SpotLight3D.new()
    lamp.color = Color.WHITE
    lamp.energy = 0.8
    lamp.intensity = 1.0
    lamp.cast_shadows = true
    lamp.spot_angle = 45.0
    lamp.position = Vector3(-2, 2, 0)
    add_child(lamp)
```

## ELI5: Global Illumination

Imagine you have a room with a bright window. The sunlight comes in, hits the walls, and bounces around, making the whole room brighter. This bouncing light is called indirect light. Global Illumination (GI) is like a computer that calculates all this bouncing light so your game looks more realistic.

### Example: Setting Up Global Illumination
```gdscript
extends Node3D

func _ready() -> void:
    # Create a lightmap GI system
    var gi = LightmapGI.new()
    gi.energy = 1.0
    gi.bounces = 3
    gi.max_bounces = 3
    add_child(gi)
    
    # Add some lights
    var sun = DirectionalLight3D.new()
    sun.color = Color.WHITE
    sun.energy = 2.0
    sun.intensity = 1.0
    sun.cast_shadows = true
    add_child(sun)
    
    var bulb = OmniLight3D.new()
    bulb.color = Color.YELLOW
    bulb.energy = 1.0
    bulb.intensity = 1.0
    bulb.position = Vector3(2, 2, 0)
    add_child(bulb)
```

## Best Practices Summary

1. **Use ORM textures** for PBR materials
2. **Use appropriate roughness values** for different materials
3. **Use normal maps** for detailed surface appearance
4. **Use clustered rendering** for scenes with many lights
5. **Optimize shadow settings** for better performance
6. **Use distance fade** to hide far-away lights
7. **Use LightmapGI for static scenes**
8. **Use VoxelGI for indoor scenes**
9. **Use SDFGI for open worlds**
10. **Use SSIL for dynamic scenes**
11. **Test materials on target devices**
12. **Test lighting in the editor**
13. **Always clean up** unused nodes to prevent memory leaks
