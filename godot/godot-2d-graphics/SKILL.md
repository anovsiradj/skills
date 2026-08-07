---
name: godot-2d-graphics
description: Godot Engine 2D graphics, sprites, lighting, and font rendering.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Graphics

## Overview
Godot Engine's 2D graphics system provides powerful tools for creating 2D content with features like sprite rendering, lighting, shadows, and advanced font rendering. This skill covers everything you need to know to create stunning 2D graphics in Godot 4.7.

## Key Insights

### Class-based Architecture
- **Sprite2D**: Basic 2D sprite rendering with support for textures and animations
- **Polygon2D**: Advanced 2D polygon rendering with customizable fill and outline
- **Line2D**: 2D line rendering for drawing shapes and paths
- **AnimatedSprite2D**: Helper node for creating animated sprites from sprite sheets
- **LightOccluder2D**: Defines where lights should be blocked to create shadows
- **Light2D**: Point, directional, and omni lights for 2D scenes

### Advanced Rendering Features
- **MSDF Fonts**: Multi-channel Signed Distance Field fonts for sharp text at any scale
- **2D Lighting**: Normal maps, specular maps, and SDF-based global illumination
- **Particle Systems**: GPU-based particles with custom shaders

## Major Version Differences (3.x vs 4.x)

### Rendering Pipeline Changes
- **SDF Lighting**: Godot 4 introduces Signed Distance Fields for 2D lighting, allowing for realistic light occlusion and shadows
- **MSDF Fonts**: Significant upgrade to font handling, including Multi-channel Signed Distance Field fonts for sharp text at any scale
- **TileMap Improvements**: Enhanced performance and features for TileMap nodes
- **ParticleSystem Enhancements**: Improved performance and visual effects

### Performance Optimizations
- **Texture Filtering**: Better texture filtering options for sharper images
- **Memory Management**: Improved memory handling for large scenes
- **Shader Support**: Enhanced shader support for custom rendering effects

## New Features in Godot 4.7

### 2D HDR Rendering
- **Optional HDR**: Optional HDR rendering for better glow and bloom effects
- **DPITexture**: Uses oversampling for SVGs to maintain sharpness at runtime
- **Lighting Improvements**: Better support for normal maps, specular maps, and global illumination

## Technical Implementation

### File: sprite_2d.gd
```gdscript
extends Sprite2D

@export_group("Sprite Properties")
@export var texture: Texture2D:
    set(value):
        texture = value
        if texture:
            region_enabled = false

@export_group("Animation")
@export var playing: bool = false
@export var animation_speed: float = 1.0
@export var frame: int:
    set(value):
        frame = value % get_sprite_frames().get_frame_count("default")

func _process(delta: float) -> void:
    if playing:
        frame += int(animation_speed * delta)
```

### File: lighting_setup.gd
```gdscript
extends Node2D

@export_group("Light Properties")
@export var light_intensity: float = 1.0
@export var light_color: Color = Color.WHITE
@export var light_energy: float = 1.0
@export var light_texture: Texture2D
@export var light_height: float = 0.0

@export_group("Shadow Properties")
@export var cast_shadows: bool = true
@export var shadow_color: Color = Color.BLACK
@export var shadow_filter: int = 0

func _ready() -> void:
    # Create light occluder for shadow casting
    var occluder = LightOccluder2D.new()
    occluder.occluder = _create_occluder_polygon()
    add_child(occluder)

func _create_occluder_polygon() -> ConvexPolygon2D:
    var polygon = ConvexPolygon2D.new()
    polygon.polygon = [
        Vector2(-100, -100),
        Vector2(100, -100),
        Vector2(100, 100),
        Vector2(-100, 100)
    ]
    return polygon
```

### File: font_rendering.gd
```gdscript
extends Label

@export_group("Font Properties")
@export var font_size: int = 32
@export var font_file: String = "res://fonts/default_font.tres"
@export var use_msdf: bool = true
@export var oversampling: float = 1.0

@export_group("Text Properties")
@export var text_content: String = "Hello World"
@export var text_color: Color = Color.WHITE
@export var outline_size: int = 0
@export var outline_color: Color = Color.BLACK

func _ready() -> void:
    var font: Font = load(font_file)
    if use_msdf:
        font = _create_msdf_font(font)
    
    add_theme_font_override("font", font)
    add_theme_font_size_override("font_size", font_size)
    add_theme_color_override("font_color", text_color)

func _create_msdf_font(base_font: Font) -> Font:
    var msdf_font = Font.new()
    msdf_font.font_data = base_font.font_data
    msdf_font.msdf_pixel_range = 8
    msdf_font.msdf_size = 48
    return msdf_font
```

## Unusual Things

### DPITexture Implementation
- **Runtime Oversampling**: DPITexture uses oversampling for SVGs to keep them sharp when scaling at runtime
- **Memory Cost**: This comes with a memory cost, but the visual quality improvement is worth it
- **Performance Impact**: Best used for smaller SVGs or those that are scaled frequently

### 2D HDR Rendering
- **Optional Feature**: 2D HDR is optional and must be enabled in the project settings
- **Memory Usage**: Requires more VRAM for storing high-dynamic-range textures
- **Monitor Support**: Only visible on monitors that support HDR

### MSDF Fonts
- **Conversion Required**: Fonts must be converted to MSDF format before use
- **Quality vs Performance**: Higher MSDF size means better quality but higher memory usage
- **Fallback Support**: Godot falls back to bitmap fonts if MSDF is not available

## Recommendations

### For Sharp Text
- **Use MSDF Fonts**: Always use MSDF fonts for any text that will be scaled dynamically
- **Optimize Size**: Choose an appropriate MSDF size based on your font size and usage
- **Test on Target Devices**: Ensure fonts look good on the target devices

### For Better Lighting
- **Use LightOccluder2D**: Always use `LightOccluder2D` to define where shadows should be cast
- **Optimize Occluders**: Keep occluder polygons simple for better performance
- **Combine Lights**: Use multiple smaller lights instead of one large light for better control

### For Performance
- **Batch Sprites**: Group similar sprites together for better rendering performance
- **Use AnimatedSprite2D**: Use `AnimatedSprite2D` for animated sprites instead of creating multiple Sprite2D nodes
- **Optimize Particles**: Use `ParticleProcessMaterial` for complex particle effects

## Prohibitions

### Performance Issues
- **Huge SVG Files**: Avoid using large SVG files without considering runtime performance costs
- **Complex Occluders**: Avoid using overly complex `LightOccluder2D` polygons
- **Unbounded Particles**: Avoid creating unlimited particle systems without proper cleanup

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### MSDF Fonts
- **Incorrect Conversion**: Ensure fonts are properly converted to MSDF format for optimal performance
- **Size Mismatch**: Using an MSDF size that's too small can result in jagged edges
- **Memory Leaks**: Not properly disposing of MSDF fonts can cause memory leaks

### Lighting
- **Incorrect Occluder Setup**: Incorrect `LightOccluder2D` setup can lead to unexpected shadows
- **Light Bleeding**: Too many lights can cause light bleeding artifacts
- **Performance Issues**: Too many lights can cause performance issues

### Sprite Rendering
- **Texture Atlasing**: Not using texture atlasing can cause performance issues
- **Animation Issues**: Incorrect animation setup can cause frame skipping
- **Memory Usage**: Large textures can cause memory usage issues

## ELI5: MSDF Fonts

Imagine you have a letter 'A' drawn on paper. When you zoom in on the paper, the 'A' becomes blocky (like LEGOs). MSDF is like a magic trick where the computer doesn't store the letter as a picture of dots, but as a "map of distances" to the edge of the letter. No matter how much you zoom in, the computer just follows the map to draw a perfectly smooth line.

### Example: Setting Up MSDF Fonts
```gdscript
extends Label

func _ready() -> void:
    # Load a font and convert it to MSDF
    var font = DynamicFont.new()
    font.font_data = load("res://fonts/my_font.ttf")
    font.msdf_pixel_range = 8
    font.msdf_size = 48
    
    # Apply the font to this label
    add_theme_font_override("font", font)
    text = "Hello World!"
```

## ELI5: 2D Lighting

Imagine you have a flashlight in a dark room. The flashlight creates a circle of light, and anything blocking the light gets dark behind it. In Godot 4, you can create this effect with `Light2D` nodes and `LightOccluder2D` nodes that define where objects block the light.

### Example: Setting Up 2D Lighting
```gdscript
extends Node2D

func _ready() -> void:
    # Create a point light
    var light = PointLight2D.new()
    light.position = Vector2(100, 100)
    light.texture = load("res://textures/light.png")
    light.energy = 2.0
    light.color = Color.YELLOW
    add_child(light)
    
    # Create an occluder to cast shadows
    var occluder = LightOccluder2D.new()
    occluder.position = Vector2(200, 200)
    
    # Draw a polygon to block the light
    var polygon = ConvexPolygon2D.new()
    polygon.polygon = [
        Vector2(-50, -50),
        Vector2(50, -50),
        Vector2(50, 50),
        Vector2(-50, 50)
    ]
    occluder.occluder = polygon
    add_child(occluder)
```

## ELI5: TileMap with Custom Properties

Imagine you have a grid of tiles representing a floor. Each tile has properties like "type" (wood, grass, water) and "color". You can organize these properties in the editor using `@export_group` and `@export_subgroup` to keep things organized.

### Example: Using TileMap with Custom Properties
```gdscript
extends TileMap

@export_group("Tile Properties")
@export var tile_size: Vector2 = Vector2(32, 32)
@export var tile_color: Color = Color.WHITE
@export_enum("Solid", "Transparent", "Water") var tile_type: String = "Solid"

@export_group("Animation")
@export var animated: bool = false
@export var animation_speed: float = 1.0

func _ready() -> void:
    # Set up the tile map
    clear()
    
    # Add some tiles
    set_cell(0, Vector2i(0, 0), 0, tile_color.to_argb32())
    set_cell(0, Vector2i(1, 0), 1, tile_color.to_argb32())
```

## ELI5: ParticleSystem with `@export_range`

Imagine you have a bunch of small dots (particles) that move around to create effects like rain or fire. You can control their properties like speed and lifetime using `@export_range` to make them easy to adjust in the editor.

### Example: Using ParticleSystem with `@export_range`
```gdscript
extends GPUParticles2D

@export_range(0, 100) var particle_speed: float = 20.0
@export_range(0, 1000) var particle_lifetime: float = 5.0
@export_range(0, 10) var particle_amount: int = 100
@export_range(0, 1) var particle_spread: float = 0.5

func _ready() -> void:
    # Set up the particle system
    var process_material = ParticleProcessMaterial.new()
    process_material.direction = Vector3(0, -1, 0)
    process_material.spread = particle_spread
    process_material.gravity = Vector3(0, -98, 0)
    
    # Set the material
    process_material.initial_velocity_min = 0.0
    process_material.initial_velocity_max = particle_speed
    process_material.lifetime = particle_lifetime
    
    # Create the particle system
    particle_process_material = process_material
    amount = particle_amount
```

## Best Practices Summary

1. **Always use MSDF fonts** for any text that will be scaled dynamically
2. **Use LightOccluder2D** to define where shadows should be cast
3. **Organize properties** with `@export_group` and `@export_subgroup`
4. **Use static typing** in GDScript for better performance and fewer bugs
5. **Prefer `await` for asynchronous code** over `yield`
6. **Use `AnimatedSprite2D`** for animated sprites instead of multiple Sprite2D nodes
7. **Batch similar sprites** for better rendering performance
8. **Keep occluder polygons simple** for better performance
9. **Test on target devices** to ensure optimal performance
10. **Always clean up** unused nodes and resources to prevent memory leaks
