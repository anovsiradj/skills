---
name: godot-2d-tools
description: Godot Engine 2D tools, TileMaps, Path2D, and geometry helpers.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# 2D Tools

## Overview
Godot Engine's 2D tools provide powerful utilities for creating 2D content with features like TileMaps for tile-based level design, Path2D for pathfinding, and Geometry2D for geometric operations. This skill covers everything you need to know to create efficient and organized 2D content in Godot 4.7.

## Key Insights

### TileMap System
- **Tile Layers**: Multiple tile layers for organizing level design
- **Tile Atlases**: Texture atlases for efficient tile rendering
- **Custom Tile Properties**: Export custom properties for each tile type
- **Terrain System**: Terrain system for automatic terrain generation

### Pathfinding Tools
- **Path2D**: Node for defining paths in 2D space
- **PathFollow2D**: Node for making other nodes follow a path
- **AStar2D**: A* pathfinding algorithm for intelligent navigation
- **NavigationMesh**: Navigation meshes for complex pathfinding

### Geometry Tools
- **Geometry2D**: Class for 2D geometric operations
- **ConvexPolygon2D**: Convex polygon for collision and rendering
- **ConcavePolygon2D**: Concave polygon for complex shapes
- **Curve**: Curve for smooth paths and animations

## Major Version Differences (3.x vs 4.x)

### TileMap Improvements
- **Terrain System**: New terrain system for automatic terrain generation
- **Custom Tile Properties**: Enhanced support for custom tile properties
- **Better Performance**: Improved performance for large TileMaps
- **Enhanced Editor**: Better editor support for TileMap editing

### Pathfinding Improvements
- **NavigationMesh**: New navigation mesh system for complex pathfinding
- **AStar2D Enhancements**: Enhanced A* pathfinding algorithm
- **Better Performance**: Improved performance for pathfinding

### Geometry Tools
- **Geometry2D Enhancements**: Enhanced Geometry2D class with new operations
- **Better Performance**: Improved performance for geometric operations
- **More Operations**: More geometric operations available

## New Features in Godot 4.7

### TileMap Features
- **Terrain System**: Enhanced terrain system for automatic terrain generation
- **Custom Tile Properties**: Enhanced support for custom tile properties
- **Better Performance**: Improved performance for large TileMaps

### Pathfinding Features
- **NavigationMesh**: Enhanced navigation mesh system
- **AStar2D Improvements**: Improved A* pathfinding algorithm
- **Better Performance**: Improved performance for pathfinding

### Geometry Features
- **Geometry2D Enhancements**: Enhanced Geometry2D class with new operations
- **Better Performance**: Improved performance for geometric operations
- **More Operations**: More geometric operations available

## Technical Implementation

### File: tile_map.gd
```gdscript
extends TileMap

@export_group("Tile Properties")
@export var tile_size: Vector2 = Vector2(32, 32)
@export var tile_color: Color = Color.WHITE
@export var tile_type: String = "Solid"
@export var tile_id: int = 0

@export_group("Terrain")
@export var terrain: int = 0
@export var terrain_z_index: int = 0

@export_group("Animation")
@export var animated: bool = false
@export var animation_speed: float = 1.0
@export var animation_frames: int = 4

func _ready() -> void:
    # Set up the tile map
    clear()
    
    # Set up tile size
    tile_set.cell_size = tile_size
    
    # Set up terrain if available
    if terrain != 0:
        tile_set.terrain_set(0, terrain)
        tile_set.terrain_z_index(0, terrain_z_index)

func _process(delta: float) -> void:
    if animated:
        # Animate the tiles
        var current_frame = int(Time.get_ticks_msec() / (1000.0 / animation_speed)) % animation_frames
        for x in range(-10, 11):
            for y in range(-10, 11):
                var cell = get_cell(0, Vector2i(x, y))
                if cell != -1:
                    set_cell(0, Vector2i(x, y), cell, -1, current_frame)
```

### File: path_2d.gd
```gdscript
extends Path2D

@export_group("Path Properties")
@export var path_type: int = 0
@export var closed: bool = false
@export var smooth: bool = false
@export var resolution: float = 0.1

@export_group("Navigation")
@export var use_navigation: bool = false
@export var navigation_agent: NavigationAgent2D

func _ready() -> void:
    # Set up the path
    if closed:
        # Close the path
        var curve = Curve2D.new()
        for point in curve.points:
            curve.add_point(point)
        curve.add_point(curve.points[0])
        curve = curve.simplify(resolution)
        set_curve(curve)
    
    # Set up navigation if needed
    if use_navigation and navigation_agent:
        navigation_agent.target_position = to_global(curve.sample(0.5))

func _process(delta: float) -> void:
    if use_navigation and navigation_agent:
        # Update navigation
        navigation_agent.target_position = to_global(curve.sample(0.5))
```

### File: geometry_2d.gd
```gdscript
extends Node2D

@export_group("Geometry Properties")
@export var shape_type: int = 0
@export var points: Array[Vector2] = []
@export var radius: float = 32.0
@export var width: float = 64.0
@export var height: float = 32.0

@export_group("Operations")
@export var operation_type: int = 0
@export var tolerance: float = 0.1

func _ready() -> void:
    # Set up the geometry
    var shape: Shape2D
    match shape_type:
        0:  # Circle
            shape = CircleShape2D.new()
            shape.radius = radius
        
        1:  # Rectangle
            shape = RectangleShape2D.new()
            shape.extents = Vector2(width / 2, height / 2)
        
        2:  # Polygon
            shape = ConvexPolygonShape2D.new()
            shape.points = points
        
        3:  # Capsule
            shape = CapsuleShape2D.new()
            shape.radius = radius
            shape.height = height
    
    # Create collision shape
    var collision_shape = CollisionShape2D.new()
    collision_shape.shape = shape
    add_child(collision_shape)

func _process(delta: float) -> void:
    if operation_type != 0:
        # Perform geometric operation
        match operation_type:
            1:  # Intersect
                intersect_geometry()
            
            2:  # Union
                union_geometry()
            
            3:  # Difference
                difference_geometry()
            
            4:  # Convex Hull
                convex_hull_geometry()

func intersect_geometry() -> void:
    # Intersect geometry
    var result = Geometry2D.intersect_polygons(points, points)
    if result.size() > 0:
        points = result[0]

func union_geometry() -> void:
    # Union geometry
    var result = Geometry2D.union_polygons(points, points)
    if result.size() > 0:
        points = result[0]

func difference_geometry() -> void:
    # Difference geometry
    var result = Geometry2D.difference_polygons(points, points)
    if result.size() > 0:
        points = result[0]

func convex_hull_geometry() -> void:
    # Convex hull
    points = Geometry2D.convex_hull(points)
```

### File: astar_2d.gd
```gdscript
extends Node2D

@export_group("AStar Properties")
@export var grid_size: Vector2i = Vector2i(32, 32)
@export var walkable_tiles: Dictionary = {}
@export var obstacle_tiles: Dictionary = {}

@export_group("Pathfinding")
@export var start_position: Vector2 = Vector2.ZERO
@export var target_position: Vector2 = Vector2.ZERO
@export var use_navigation: bool = false
@export var navigation_agent: NavigationAgent2D

@export_group("Performance")
@export var max_steps: int = 100
@export var diagonal_movement: bool = false

func _ready() -> void:
    # Set up AStar2D
    var astar = AStar2D.new()
    
    # Add nodes to AStar2D
    for x in range(-10, 11):
        for y in range(-10, 11):
            var position = Vector2i(x * grid_size.x, y * grid_size.y)
            if !obstacle_tiles.has(position):
                astar.add_point(x * 100 + y, position)
                
                # Connect to neighbors
                if diagonal_movement:
                    connect_neighbors(astar, x, y)
                else:
                    connect_cardinal_neighbors(astar, x, y)
    
    # Set up navigation if needed
    if use_navigation and navigation_agent:
        navigation_agent.target_position = target_position

func connect_neighbors(astar: AStar2D, x: int, y: int) -> void:
    # Connect to all 8 neighbors
    for dx in [-1, 0, 1]:
        for dy in [-1, 0, 1]:
            if dx == 0 and dy == 0:
                continue
                
            var nx = x + dx
            var ny = y + dy
            var position = Vector2i(nx * grid_size.x, ny * grid_size.y)
            
            if !obstacle_tiles.has(position):
                var point_id = nx * 100 + ny
                if astar.has_point(point_id):
                    astar.connect_points(x * 100 + y, point_id, true)

func connect_cardinal_neighbors(astar: AStar2D, x: int, y: int) -> void:
    # Connect to 4 cardinal neighbors
    for dx in [-1, 0, 1]:
        for dy in [-1, 0, 1]:
            if dx == 0 and dy == 0:
                continue
            if abs(dx) + abs(dy) != 1:
                continue
                
            var nx = x + dx
            var ny = y + dy
            var position = Vector2i(nx * grid_size.x, ny * grid_size.y)
            
            if !obstacle_tiles.has(position):
                var point_id = nx * 100 + ny
                if astar.has_point(point_id):
                    astar.connect_points(x * 100 + y, point_id, true)

func _process(delta: float) -> void:
    if use_navigation and navigation_agent:
        # Update navigation
        navigation_agent.target_position = target_position
```

## Unusual Things

### TileMap Terrain System
- **Automatic Terrain**: The terrain system automatically generates terrain based on tile properties
- **Z-Index Control**: Terrain z-index control allows for better layering
- **Performance Cost**: Terrain system has a performance cost for large TileMaps

### Path2D Navigation
- **NavigationMesh**: Navigation mesh provides more accurate pathfinding for complex environments
- **Performance Cost**: Navigation mesh has a performance cost for large environments
- **Update Required**: Navigation mesh must be updated when the environment changes

### Geometry2D Operations
- **Complex Operations**: Geometry2D supports complex operations like intersection, union, and difference
- **Performance Cost**: Complex geometric operations have a performance cost
- **Precision Issues**: Geometric operations can have precision issues with floating-point numbers

## Recommendations

### For TileMap
- **Use Tile Atlases**: Use tile atlases for better performance
- **Organize Layers**: Organize TileMap layers for better organization
- **Use Terrain**: Use terrain system for automatic terrain generation
- **Optimize Tile Size**: Use appropriate tile size for better performance

### For Pathfinding
- **Use NavigationMesh**: Use navigation mesh for complex pathfinding
- **Use AStar2D**: Use AStar2D for simple pathfinding
- **Optimize Grid**: Optimize grid size for better performance
- **Use NavigationAgent2D**: Use NavigationAgent2D for better integration

### For Geometry
- **Use Simple Shapes**: Use simple shapes for better performance
- **Optimize Operations**: Optimize geometric operations for better performance
- **Use Convex Shapes**: Use convex shapes for better performance
- **Test Operations**: Test geometric operations thoroughly

## Prohibitions

### Performance Issues
- **Huge TileMaps**: Avoid using huge TileMaps without optimization
- **Complex Navigation**: Avoid using complex navigation systems without optimization
- **Unbounded Geometry**: Avoid creating unbounded geometric operations

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### TileMap
- **Incorrect Tile Size**: Incorrect tile size can cause rendering issues
- **Performance Issues**: Large TileMaps can cause performance issues
- **Memory Usage**: Large TileMaps can cause memory usage issues

### Pathfinding
- **Incorrect Grid**: Incorrect grid size can cause pathfinding issues
- **Performance Issues**: Complex pathfinding can cause performance issues
- **Update Required**: Navigation mesh must be updated when the environment changes

### Geometry
- **Precision Issues**: Geometric operations can have precision issues
- **Performance Issues**: Complex geometric operations can cause performance issues
- **Testing**: Geometric operations require extensive testing

## ELI5: TileMap

Imagine you have a grid of tiles representing a floor. Each tile has properties like "type" (wood, grass, water) and "color". You can organize these properties in the editor using `@export_group` and `@export_subgroup` to keep things organized.

### Example: Using TileMap with Custom Properties
```gdscript
extends TileMap

@export_group("Tile Properties")
@export var tile_size: Vector2 = Vector2(32, 32)
@export var tile_color: Color = Color.WHITE
@export var tile_type: String = "Solid"

@export_group("Terrain")
@export var terrain: int = 0
@export var terrain_z_index: int = 0

func _ready() -> void:
    # Set up the tile map
    clear()
    
    # Set up tile size
    tile_set.cell_size = tile_size
    
    # Set up terrain if available
    if terrain != 0:
        tile_set.terrain_set(0, terrain)
        tile_set.terrain_z_index(0, terrain_z_index)
```

## ELI5: Path2D

Imagine you have a path that you want other objects to follow. You can define the path using `Path2D` and make other objects follow it using `PathFollow2D`.

### Example: Using Path2D
```gdscript
extends Path2D

func _ready() -> void:
    # Create a path
    var curve = Curve2D.new()
    curve.add_point(Vector2(0, 0))
    curve.add_point(Vector2(100, 0))
    curve.add_point(Vector2(100, 100))
    curve.add_point(Vector2(0, 100))
    set_curve(curve)
```

## ELI5: AStar2D

Imagine you have a maze and you want to find the shortest path from the start to the end. AStar2D is like a smart algorithm that finds the shortest path through the maze.

### Example: Using AStar2D
```gdscript
extends Node2D

func _ready() -> void:
    # Create an AStar2D node
    var astar = AStar2D.new()
    
    # Add points to AStar2D
    astar.add_point(0, Vector2(0, 0))
    astar.add_point(1, Vector2(100, 0))
    astar.add_point(2, Vector2(100, 100))
    astar.add_point(3, Vector2(0, 100))
    
    # Connect points
    astar.connect_points(0, 1, true)
    astar.connect_points(1, 2, true)
    astar.connect_points(2, 3, true)
    astar.connect_points(3, 0, true)
    
    # Get the shortest path
    var path = astar.get_point_path(0, 2)
    print(path)
```

## ELI5: Geometry2D

Imagine you have a bunch of shapes and you want to combine them or cut them. Geometry2D is like a toolkit that lets you perform geometric operations on shapes.

### Example: Using Geometry2D
```gdscript
extends Node2D

func _ready() -> void:
    # Create some polygons
    var polygon1 = [Vector2(0, 0), Vector2(100, 0), Vector2(100, 100), Vector2(0, 100)]
    var polygon2 = [Vector2(50, 50), Vector2(150, 50), Vector2(150, 150), Vector2(50, 150)]
    
    # Intersect the polygons
    var intersection = Geometry2D.intersect_polygons(polygon1, polygon2)
    print(intersection)
    
    # Union the polygons
    var union = Geometry2D.union_polygons(polygon1, polygon2)
    print(union)
    
    # Difference the polygons
    var difference = Geometry2D.difference_polygons(polygon1, polygon2)
    print(difference)
```

## Best Practices Summary

1. **Use Tile Atlases** for better performance
2. **Organize TileMap layers** for better organization
3. **Use terrain system** for automatic terrain generation
4. **Use NavigationMesh** for complex pathfinding
5. **Use AStar2D** for simple pathfinding
6. **Use NavigationAgent2D** for better integration
7. **Use simple shapes** for better performance
8. **Optimize geometric operations** for better performance
9. **Test operations** thoroughly
10. **Always clean up** unused nodes to prevent memory leaks
