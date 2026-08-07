---
name: godot-3d-tools
description: Godot Engine 3D tools, GridMaps, CSG, procedural geometry, and pathfinding.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# 3D Tools

## Overview
Godot Engine's 3D tools provide powerful utilities for creating 3D content with features like GridMaps for tile-based level design, CSG for constructive solid geometry, procedural geometry generation, and pathfinding. This skill covers everything you need to know to create efficient and organized 3D content in Godot 4.7.

## Key Insights

### GridMap System
- **Tile Layers**: Multiple tile layers for organizing level design
- **Tile Atlases**: Texture atlases for efficient tile rendering
- **Custom Tile Properties**: Export custom properties for each tile type
- **Terrain System**: Terrain system for automatic terrain generation

### CSG System
- **Box CSG**: Box-shaped constructive solid geometry
- **Sphere CSG**: Sphere-shaped constructive solid geometry
- **Cylinder CSG**: Cylinder-shaped constructive solid geometry
- **Cone CSG**: Cone-shaped constructive solid geometry
- **Torus CSG**: Torus-shaped constructive solid geometry
- **Extrusion CSG**: Extrude 2D shapes into 3D

### Procedural Geometry
- **MeshInstance3D**: 3D mesh instances
- **ImmediateGeometry3D**: Immediate geometry for procedural rendering
- **HeightMap**: Heightmap-based terrain generation
- **Noise**: Procedural noise generation

### Pathfinding
- **Path3D**: Node for defining paths in 3D space
- **PathFollow3D**: Node for making other nodes follow a path
- **AStar3D**: A* pathfinding algorithm for intelligent navigation
- **NavigationMesh**: Navigation meshes for complex pathfinding

## Major Version Differences (3.x vs 4.x)

### GridMap Improvements
- **Terrain System**: New terrain system for automatic terrain generation
- **Custom Tile Properties**: Enhanced support for custom tile properties
- **Better Performance**: Improved performance for large GridMaps
- **Enhanced Editor**: Better editor support for GridMap editing

### CSG Improvements
- **More Shapes**: More CSG shapes available
- **Better Performance**: Improved performance for CSG operations
- **Enhanced Editor**: Better editor support for CSG operations

### Procedural Geometry Improvements
- **Noise Enhancement**: Enhanced noise generation
- **Better Performance**: Improved performance for procedural geometry
- **More Operations**: More procedural geometry operations available

## New Features in Godot 4.7

### GridMap Features
- **Terrain System**: Enhanced terrain system for automatic terrain generation
- **Custom Tile Properties**: Enhanced support for custom tile properties
- **Better Performance**: Improved performance for large GridMaps

### CSG Features
- **More Shapes**: More CSG shapes available
- **Better Performance**: Improved performance for CSG operations
- **Enhanced Editor**: Better editor support for CSG operations

### Procedural Geometry Features
- **Noise Enhancement**: Enhanced noise generation
- **Better Performance**: Improved performance for procedural geometry
- **More Operations**: More procedural geometry operations available

## Technical Implementation

### File: grid_map.gd
```gdscript
extends GridMap

@export_group("GridMap Properties")
@export var tile_size: Vector3 = Vector3(32, 32, 32)
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
    # Set up the grid map
    clear()
    
    # Set up tile size
    cell_size = tile_size
    
    # Set up terrain if available
    if terrain != 0:
        terrain_set(0, terrain)
        terrain_z_index(0, terrain_z_index)

func _process(delta: float) -> void:
    if animated:
        # Animate the tiles
        var current_frame = int(Time.get_ticks_msec() / (1000.0 / animation_speed)) % animation_frames
        for x in range(-10, 11):
            for y in range(-10, 11):
                for z in range(-10, 11):
                    var cell = get_cell(0, Vector3i(x, y, z))
                    if cell != -1:
                        set_cell(0, Vector3i(x, y, z), cell, -1, current_frame)
```

### File: csg.gd
```gdscript
extends Node3D

@export_group("CSG Properties")
@export var csg_type: int = 0
@export var size: Vector3 = Vector3(32, 32, 32)
@export var radius: float = 16.0
@export var height: float = 32.0
@export var radius2: float = 8.0

@export_group("Material Properties")
@export var material: Material
@export var use_collision: bool = true
@export var collision_layer: int = 1

func _ready() -> void:
    # Create the appropriate CSG type
    match csg_type:
        0:  # Box
            var csg = CSGBox3D.new()
            csg.size = size
            if material:
                csg.material = material
            if use_collision:
                csg.use_collision = true
                csg.collision_layer = collision_layer
            add_child(csg)
        
        1:  # Sphere
            var csg = CSGSphere3D.new()
            csg.radius = radius
            if material:
                csg.material = material
            if use_collision:
                csg.use_collision = true
                csg.collision_layer = collision_layer
            add_child(csg)
        
        2:  # Cylinder
            var csg = CSGCylinder3D.new()
            csg.height = height
            csg.radius = radius
            if material:
                csg.material = material
            if use_collision:
                csg.use_collision = true
                csg.collision_layer = collision_layer
            add_child(csg)
        
        3:  # Cone
            var csg = CSGCone3D.new()
            csg.height = height
            csg.radius = radius
            if material:
                csg.material = material
            if use_collision:
                csg.use_collision = true
                csg.collision_layer = collision_layer
            add_child(csg)
        
        4:  # Torus
            var csg = CSGTorus3D.new()
            csg.inner_radius = radius
            csg.outer_radius = radius2
            if material:
                csg.material = material
            if use_collision:
                csg.use_collision = true
                csg.collision_layer = collision_layer
            add_child(csg)
        
        5:  # Extrusion
            var csg = CSGCylinder3D.new()
            csg.height = height
            csg.radius = radius
            if material:
                csg.material = material
            if use_collision:
                csg.use_collision = true
                csg.collision_layer = collision_layer
            add_child(csg)
```

### File: procedural_geometry.gd
```gdscript
extends Node3D

@export_group("Procedural Geometry Properties")
@export var geometry_type: int = 0
@export var size: Vector3 = Vector3(32, 32, 32)
@export var resolution: int = 32
@export var height: float = 32.0

@export_group("Noise Properties")
@export var noise_type: int = 0
@export var noise_scale: float = 1.0
@export var noise_offset: Vector3 = Vector3.ZERO

@export_group("Material Properties")
@export var material: Material
@export var use_collision: bool = true

func _ready() -> void:
    # Create the appropriate geometry type
    match geometry_type:
        0:  # Box
            var mesh = BoxMesh.new()
            mesh.size = size
            create_mesh(mesh)
        
        1:  # Sphere
            var mesh = SphereMesh.new()
            mesh.radius = size.x / 2
            mesh.height = size.z
            mesh.radial_segments = resolution
            mesh.rings = resolution / 2
            create_mesh(mesh)
        
        2:  # Cylinder
            var mesh = CylinderMesh.new()
            mesh.top_radius = size.x / 2
            mesh.bottom_radius = size.x / 2
            mesh.height = size.z
            mesh.radial_segments = resolution
            mesh.rings = resolution / 2
            create_mesh(mesh)
        
        3:  # Cone
            var mesh = ConeMesh.new()
            mesh.radius = size.x / 2
            mesh.height = size.z
            mesh.radial_segments = resolution
            mesh.rings = resolution / 2
            create_mesh(mesh)
        
        4:  // Heightmap
            var mesh = HeightMapMesh.new()
            mesh.width = resolution
            mesh.depth = resolution
            mesh.height_map_resolution = resolution
            create_heightmap(mesh)
        
        5:  // Noise
            var mesh = ArrayMesh.new()
            create_noise_mesh(mesh)
            create_mesh(mesh)

func create_mesh(mesh: Mesh) -> void:
    var mesh_instance = MeshInstance3D.new()
    mesh_instance.mesh = mesh
    if material:
        mesh_instance.material_override = material
    add_child(mesh_instance)
    
    if use_collision:
        var collision_shape = CollisionShape3D.new()
        collision_shape.shape = mesh.create_trimesh_shape()
        mesh_instance.add_child(collision_shape)

func create_heightmap(mesh: HeightMapMesh) -> void:
    # Create a heightmap mesh
    var surface_tool = SurfaceTool.new()
    surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
    
    for x in range(resolution + 1):
        for z in range(resolution + 1):
            var height = get_height(x, z)
            surface_tool.add_vertex(Vector3(x * size.x / resolution, height, z * size.z / resolution))
    
    surface_tool.commit(mesh)
    create_mesh(mesh)

func create_noise_mesh(mesh: ArrayMesh) -> void:
    # Create a noise-based mesh
    var surface_tool = SurfaceTool.new()
    surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
    
    for x in range(resolution + 1):
        for z in range(resolution + 1):
            var height = get_noise_height(x, z)
            surface_tool.add_vertex(Vector3(x * size.x / resolution, height, z * size.z / resolution))
    
    surface_tool.commit(mesh)
    create_mesh(mesh)

func get_height(x: int, z: int) -> float:
    # Get height from heightmap
    return height * (sin(float(x) / resolution * PI * 2) + sin(float(z) / resolution * PI * 2)) / 2

func get_noise_height(x: int, z: int) -> float:
    # Get height from noise
    var noise = FastNoiseLite.new()
    noise.noise_type = noise_type
    noise.scale = noise_scale
    noise.offset = noise_offset
    
    var nx = float(x) / resolution
    var nz = float(z) / resolution
    
    var height = noise.get_noise_2d(nx, nz)
    return height * height
```

### File: path_3d.gd
```gdscript
extends Path3D

@export_group("Path Properties")
@export var path_type: int = 0
@export var closed: bool = false
@export var smooth: bool = false
@export var resolution: float = 0.1

@export_group("Navigation")
@export var use_navigation: bool = false
@export var navigation_agent: NavigationAgent3D

func _ready() -> void:
    # Set up the path
    if closed:
        # Close the path
        var curve = Curve3D.new()
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

### File: astar_3d.gd
```gdscript
extends Node3D

@export_group("AStar Properties")
@export var grid_size: Vector3i = Vector3i(32, 32, 32)
@export var walkable_tiles: Dictionary = {}
@export var obstacle_tiles: Dictionary = {}

@export_group("Pathfinding")
@export var start_position: Vector3 = Vector3.ZERO
@export var target_position: Vector3 = Vector3.ZERO
@export var use_navigation: bool = false
@export var navigation_agent: NavigationAgent3D

@export_group("Performance")
@export var max_steps: int = 100
@export var diagonal_movement: bool = false

func _ready() -> void:
    # Set up AStar3D
    var astar = AStar3D.new()
    
    # Add nodes to AStar3D
    for x in range(-10, 11):
        for y in range(-10, 11):
            for z in range(-10, 11):
                var position = Vector3i(x * grid_size.x, y * grid_size.y, z * grid_size.z)
                if !obstacle_tiles.has(position):
                    astar.add_point(x * 10000 + y * 100 + z, position)
                    
                    # Connect to neighbors
                    if diagonal_movement:
                        connect_neighbors(astar, x, y, z)
                    else:
                        connect_cardinal_neighbors(astar, x, y, z)
    
    # Set up navigation if needed
    if use_navigation and navigation_agent:
        navigation_agent.target_position = target_position

func connect_neighbors(astar: AStar3D, x: int, y: int, z: int) -> void:
    # Connect to all 26 neighbors
    for dx in [-1, 0, 1]:
        for dy in [-1, 0, 1]:
            for dz in [-1, 0, 1]:
                if dx == 0 and dy == 0 and dz == 0:
                    continue
                    
                var nx = x + dx
                var ny = y + dy
                var nz = z + dz
                var position = Vector3i(nx * grid_size.x, ny * grid_size.y, nz * grid_size.z)
                
                if !obstacle_tiles.has(position):
                    var point_id = nx * 10000 + ny * 100 + nz
                    if astar.has_point(point_id):
                        astar.connect_points(x * 10000 + y * 100 + z, point_id, true)

func connect_cardinal_neighbors(astar: AStar3D, x: int, y: int, z: int) -> void:
    # Connect to 6 cardinal neighbors
    for dx in [-1, 0, 1]:
        for dy in [-1, 0, 1]:
            for dz in [-1, 0, 1]:
                if dx == 0 and dy == 0 and dz == 0:
                    continue
                if abs(dx) + abs(dy) + abs(dz) != 1:
                    continue
                    
                var nx = x + dx
                var ny = y + dy
                var nz = z + dz
                var position = Vector3i(nx * grid_size.x, ny * grid_size.y, nz * grid_size.z)
                
                if !obstacle_tiles.has(position):
                    var point_id = nx * 10000 + ny * 100 + nz
                    if astar.has_point(point_id):
                        astar.connect_points(x * 10000 + y * 100 + z, point_id, true)

func _process(delta: float) -> void:
    if use_navigation and navigation_agent:
        # Update navigation
        navigation_agent.target_position = target_position
```

## Unusual Things

### GridMap Terrain System
- **Automatic Terrain**: The terrain system automatically generates terrain based on tile properties
- **Z-Index Control**: Terrain z-index control allows for better layering
- **Performance Cost**: Terrain system has a performance cost for large GridMaps

### CSG Operations
- **Boolean Operations**: CSG supports boolean operations (union, intersection, difference)
- **Performance Cost**: CSG operations have a performance cost
- **Complex Setup**: CSG requires complex setup for complex shapes

### Procedural Geometry
- **Noise Generation**: Procedural geometry relies on noise generation
- **Performance Cost**: Procedural geometry has a performance cost
- **Complex Setup**: Procedural geometry requires complex setup

### Pathfinding
- **NavigationMesh**: Navigation mesh provides more accurate pathfinding for complex environments
- **Performance Cost**: Navigation mesh has a performance cost for large environments
- **Update Required**: Navigation mesh must be updated when the environment changes

## Recommendations

### For GridMap
- **Use Tile Atlases**: Use tile atlases for better performance
- **Organize Layers**: Organize GridMap layers for better organization
- **Use Terrain**: Use terrain system for automatic terrain generation
- **Optimize Tile Size**: Use appropriate tile size for better performance

### For CSG
- **Use Simple Shapes**: Use simple shapes for better performance
- **Optimize Operations**: Optimize CSG operations for better performance
- **Test in Editor**: Always test CSG in the editor for proper setup

### For Procedural Geometry
- **Use Noise**: Use noise for procedural geometry
- **Optimize Resolution**: Optimize resolution for better performance
- **Use Simple Shapes**: Use simple shapes for better performance
- **Test in Editor**: Always test procedural geometry in the editor for proper setup

### For Pathfinding
- **Use NavigationMesh**: Use navigation mesh for complex pathfinding
- **Use AStar3D**: Use AStar3D for simple pathfinding
- **Optimize Grid**: Optimize grid size for better performance
- **Use NavigationAgent3D**: Use NavigationAgent3D for better integration

## Prohibitions

### Performance Issues
- **Huge GridMaps**: Avoid using huge GridMaps without optimization
- **Complex CSG**: Avoid using complex CSG without optimization
- **Unbounded Procedural Geometry**: Avoid creating unbounded procedural geometry
- **Unbounded Pathfinding**: Avoid creating unbounded pathfinding systems

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### GridMap
- **Incorrect Tile Size**: Incorrect tile size can cause rendering issues
- **Performance Issues**: Large GridMaps can cause performance issues
- **Memory Usage**: Large GridMaps can cause memory usage issues

### CSG
- **Incorrect Shape**: Incorrect shape can cause rendering issues
- **Performance Issues**: Complex CSG can cause performance issues
- **Memory Usage**: Complex CSG can cause memory usage issues

### Procedural Geometry
- **Performance Issues**: Procedural geometry can cause performance issues
- **Complex Setup**: Procedural geometry requires complex setup
- **Testing**: Procedural geometry requires extensive testing

### Pathfinding
- **Incorrect Grid**: Incorrect grid size can cause pathfinding issues
- **Performance Issues**: Complex pathfinding can cause performance issues
- **Update Required**: Navigation mesh must be updated when the environment changes

## ELI5: GridMap

Imagine you have a grid of tiles representing a floor. Each tile has properties like "type" (wood, grass, water) and "color". You can organize these properties in the editor using `@export_group` and `@export_subgroup` to keep things organized.

### Example: Using GridMap with Custom Properties
```gdscript
extends GridMap

@export_group("GridMap Properties")
@export var tile_size: Vector3 = Vector3(32, 32, 32)
@export var tile_color: Color = Color.WHITE
@export var tile_type: String = "Solid"

@export_group("Terrain")
@export var terrain: int = 0
@export var terrain_z_index: int = 0

func _ready() -> void:
    # Set up the grid map
    clear()
    
    # Set up tile size
    cell_size = tile_size
    
    # Set up terrain if available
    if terrain != 0:
        terrain_set(0, terrain)
        terrain_z_index(0, terrain_z_index)
```

## ELI5: CSG

Imagine you have a bunch of 3D shapes and you want to combine them or cut them. CSG (Constructive Solid Geometry) is like a toolkit that lets you perform boolean operations on 3D shapes.

### Example: Using CSG
```gdscript
extends Node3D

func _ready() -> void:
    # Create a box
    var box = CSGBox3D.new()
    box.size = Vector3(32, 32, 32)
    add_child(box)
    
    # Create a sphere
    var sphere = CSGSphere3D.new()
    sphere.radius = 16
    add_child(sphere)
    
    # Create a cylinder
    var cylinder = CSGCylinder3D.new()
    cylinder.height = 32
    cylinder.radius = 8
    add_child(cylinder)
```

## ELI5: Procedural Geometry

Imagine you have a piece of clay. You can shape the clay into different forms like a cube, sphere, or cylinder. Procedural geometry is like giving your 3D objects the ability to be created programmatically.

### Example: Using Procedural Geometry
```gdscript
extends Node3D

func _ready() -> void:
    # Create a box
    var box = BoxMesh.new()
    box.size = Vector3(32, 32, 32)
    
    var mesh_instance = MeshInstance3D.new()
    mesh_instance.mesh = box
    add_child(mesh_instance)
    
    # Create a sphere
    var sphere = SphereMesh.new()
    sphere.radius = 16
    sphere.height = 32
    
    var sphere_instance = MeshInstance3D.new()
    sphere_instance.mesh = sphere
    sphere_instance.position = Vector3(64, 0, 0)
    add_child(sphere_instance)
```

## ELI5: Path3D

Imagine you have a path that you want other objects to follow. You can define the path using `Path3D` and make other objects follow it using `PathFollow3D`.

### Example: Using Path3D
```gdscript
extends Path3D

func _ready() -> void:
    # Create a path
    var curve = Curve3D.new()
    curve.add_point(Vector3(0, 0, 0))
    curve.add_point(Vector3(100, 0, 0))
    curve.add_point(Vector3(100, 0, 100))
    curve.add_point(Vector3(0, 0, 100))
    set_curve(curve)
```

## ELI5: AStar3D

Imagine you have a maze and you want to find the shortest path from the start to the end. AStar3D is like a smart algorithm that finds the shortest path through the maze.

### Example: Using AStar3D
```gdscript
extends Node3D

func _ready() -> void:
    # Create an AStar3D node
    var astar = AStar3D.new()
    
    # Add points to AStar3D
    astar.add_point(0, Vector3(0, 0, 0))
    astar.add_point(1, Vector3(100, 0, 0))
    astar.add_point(2, Vector3(100, 0, 100))
    astar.add_point(3, Vector3(0, 0, 100))
    
    # Connect points
    astar.connect_points(0, 1, true)
    astar.connect_points(1, 2, true)
    astar.connect_points(2, 3, true)
    astar.connect_points(3, 0, true)
    
    # Get the shortest path
    var path = astar.get_point_path(0, 2)
    print(path)
```

## Best Practices Summary

1. **Use Tile Atlases** for better performance
2. **Organize GridMap layers** for better organization
3. **Use terrain system** for automatic terrain generation
4. **Use simple shapes** for CSG
5. **Use noise** for procedural geometry
6. **Optimize resolution** for better performance
7. **Use NavigationMesh** for complex pathfinding
8. **Use AStar3D** for simple pathfinding
9. **Use NavigationAgent3D** for better integration
10. **Test in editor** for proper setup
11. **Always clean up** unused nodes to prevent memory leaks
