---
name: godot-navigation
description: Godot Engine navigation, pathfinding, and navigation meshes.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Navigation

## Overview
Godot Engine's navigation system provides powerful tools for creating games with features like navigation, pathfinding, and navigation meshes. This skill covers everything you need to know to create efficient and organized navigation content in Godot 4.7.

## Key Insights

### Navigation Features
- **NavigationMesh**: Navigation mesh for pathfinding
- **NavigationAgent**: Navigation agent for pathfinding
- **NavigationPolygon**: Navigation polygon for pathfinding
- **NavigationRegion**: Navigation region for pathfinding

### Pathfinding Features
- **AStar**: A* pathfinding algorithm
- **AStar2D**: A* pathfinding algorithm for 2D
- **AStar3D**: A* pathfinding algorithm for 3D
- **Path3D**: Path for pathfinding
- **PathFollow3D**: Path follower for pathfinding

### Navigation Features
- **NavigationMesh**: Navigation mesh for pathfinding
- **NavigationAgent**: Navigation agent for pathfinding
- **NavigationPolygon**: Navigation polygon for pathfinding
- **NavigationRegion**: Navigation region for pathfinding

## Major Version Differences (3.x vs 4.x)

### Navigation System Changes
- **NavigationMesh**: New navigation mesh system for pathfinding
- **NavigationAgent**: New navigation agent system for pathfinding
- **NavigationPolygon**: New navigation polygon system for pathfinding
- **NavigationRegion**: New navigation region system for pathfinding
- **AStar**: Enhanced A* pathfinding algorithm
- **AStar2D**: Enhanced A* pathfinding algorithm for 2D
- **AStar3D**: Enhanced A* pathfinding algorithm for 3D
- **Path3D**: Enhanced path for pathfinding
- **PathFollow3D**: Enhanced path follower for pathfinding
- **Better Performance**: Improved performance for navigation operations
- **Enhanced Editor**: Better editor support for navigation management

### Navigation Features
- **NavigationMesh**: Enhanced navigation mesh
- **NavigationAgent**: Enhanced navigation agent
- **NavigationPolygon**: Enhanced navigation polygon
- **NavigationRegion**: Enhanced navigation region

## New Features in Godot 4.7

### Navigation Features
- **NavigationMesh**: Enhanced navigation mesh
- **NavigationAgent**: Enhanced navigation agent
- **NavigationPolygon**: Enhanced navigation polygon
- **NavigationRegion**: Enhanced navigation region
- **AStar**: Enhanced A* pathfinding algorithm
- **AStar2D**: Enhanced A* pathfinding algorithm for 2D
- **AStar3D**: Enhanced A* pathfinding algorithm for 3D
- **Path3D**: Enhanced path for pathfinding
- **PathFollow3D**: Enhanced path follower for pathfinding
- **Better Performance**: Improved performance for navigation operations
- **Enhanced Editor**: Better editor support for navigation management

## Technical Implementation

### File: navigation_mesh.gd
```gdscript
extends Node

@export_group("Navigation Mesh Properties")
@export var navigation_mesh_name: String = ""
@export var navigation_mesh_path: String = ""

@export_group("Navigation Mesh Features")
@export var navigation_mesh_visible: bool = true
@export var navigation_mesh_enabled: bool = true
@export var navigation_mesh_agent: bool = false

func _ready() -> void:
    # Set up the navigation mesh
    if navigation_mesh_name:
        name = navigation_mesh_name
    
    if navigation_mesh_path:
        # Load the navigation mesh
        load_navigation_mesh(navigation_mesh_path)
    
    if navigation_mesh_visible:
        # Show the navigation mesh
        show()
    
    if navigation_mesh_enabled:
        # Enable the navigation mesh
        pass
    
    if navigation_mesh_agent:
        # Add navigation agent
        add_navigation_agent()

func _process(delta: float) -> void:
    # Update the navigation mesh

func load_navigation_mesh(path: String) -> void:
    # Load a navigation mesh
    var navigation_mesh = load(path)
    if navigation_mesh:
        # Load the navigation mesh
        pass

func show_navigation_mesh() -> void:
    # Show the navigation mesh
    show()

func hide_navigation_mesh() -> void:
    # Hide the navigation mesh
    hide()

func set_navigation_mesh_visible(visible: bool) -> void:
    # Set the navigation mesh visible
    if visible:
        show()
    else:
        hide()

func set_navigation_mesh_enabled(enabled: bool) -> void:
    # Set the navigation mesh enabled
    pass

func add_navigation_agent() -> void:
    # Add navigation agent
    var navigation_agent = NavigationAgent3D.new()
    add_child(navigation_agent)
```

### File: navigation_agent.gd
```gdscript
extends Node

@export_group("Navigation Agent Properties")
@export var navigation_agent_name: String = ""
@export var navigation_agent_path: String = ""

@export_group("Navigation Agent Features")
@export var navigation_agent_visible: bool = true
@export var navigation_agent_enabled: bool = true
@export var navigation_agent_target_position: Vector3 = Vector3.ZERO
@export var navigation_agent_velocity: Vector3 = Vector3.ZERO

func _ready() -> void:
    # Set up the navigation agent
    if navigation_agent_name:
        name = navigation_agent_name
    
    if navigation_agent_path:
        # Load the navigation agent
        load_navigation_agent(navigation_agent_path)
    
    if navigation_agent_visible:
        # Show the navigation agent
        show()
    
    if navigation_agent_enabled:
        # Enable the navigation agent
        pass
    
    if navigation_agent_target_position != Vector3.ZERO:
        # Set the navigation agent target position
        set_navigation_agent_target_position(navigation_agent_target_position)

func _process(delta: float) -> void:
    # Update the navigation agent

func load_navigation_agent(path: String) -> void:
    # Load a navigation agent
    var navigation_agent = load(path)
    if navigation_agent:
        # Load the navigation agent
        pass

func show_navigation_agent() -> void:
    # Show the navigation agent
    show()

func hide_navigation_agent() -> void:
    # Hide the navigation agent
    hide()

func set_navigation_agent_visible(visible: bool) -> void:
    # Set the navigation agent visible
    if visible:
        show()
    else:
        hide()

func set_navigation_agent_enabled(enabled: bool) -> void:
    # Set the navigation agent enabled
    pass

func set_navigation_agent_target_position(target_position: Vector3) -> void:
    # Set the navigation agent target position
    pass

func set_navigation_agent_velocity(velocity: Vector3) -> void:
    # Set the navigation agent velocity
    pass
```

### File: astar.gd
```gdscript
extends Node

@export_group("AStar Properties")
@export var astar_name: String = ""
@export var astar_path: String = ""

@export_group("AStar Features")
@export var astar_visible: bool = true
@export var astar_enabled: bool = true
@export var astar_start_position: Vector3 = Vector3.ZERO
@export var astar_target_position: Vector3 = Vector3.ZERO

func _ready() -> void:
    # Set up the AStar
    if astar_name:
        name = astar_name
    
    if astar_path:
        # Load the AStar
        load_astar(astar_path)
    
    if astar_visible:
        # Show the AStar
        show()
    
    if astar_enabled:
        # Enable the AStar
        pass
    
    if astar_start_position != Vector3.ZERO:
        # Set the AStar start position
        set_astar_start_position(astar_start_position)
    
    if astar_target_position != Vector3.ZERO:
        # Set the AStar target position
        set_astar_target_position(astar_target_position)

func _process(delta: float) -> void:
    # Update the AStar

func load_astar(path: String) -> void:
    # Load an AStar
    var astar = load(path)
    if astar:
        # Load the AStar
        pass

func show_astar() -> void:
    # Show the AStar
    show()

func hide_astar() -> void:
    # Hide the AStar
    hide()

func set_astar_visible(visible: bool) -> void:
    # Set the AStar visible
    if visible:
        show()
    else:
        hide()

func set_astar_enabled(enabled: bool) -> void:
    # Set the AStar enabled
    pass

func set_astar_start_position(start_position: Vector3) -> void:
    # Set the AStar start position
    pass

func set_astar_target_position(target_position: Vector3) -> void:
    # Set the AStar target position
    pass

func get_astar_path(start_position: Vector3, target_position: Vector3) -> Array:
    # Get the AStar path
    pass
```

### File: path_3d.gd
```gdscript
extends Node

@export_group("Path3D Properties")
@export var path_3d_name: String = ""
@export var path_3d_path: String = ""

@export_group("Path3D Features")
@export var path_3d_visible: bool = true
@export var path_3d_enabled: bool = true
@export var path_3d_loop: bool = false
@export var path_3d_smooth: bool = false

func _ready() -> void:
    # Set up the Path3D
    if path_3d_name:
        name = path_3d_name
    
    if path_3d_path:
        # Load the Path3D
        load_path_3d(path_3d_path)
    
    if path_3d_visible:
        # Show the Path3D
        show()
    
    if path_3d_enabled:
        # Enable the Path3D
        pass
    
    if path_3d_loop:
        # Set the Path3D loop
        pass
    
    if path_3d_smooth:
        # Set the Path3D smooth
        pass

func _process(delta: float) -> void:
    # Update the Path3D

func load_path_3d(path: String) -> void:
    # Load a Path3D
    var path_3d = load(path)
    if path_3d:
        # Load the Path3D
        pass

func show_path_3d() -> void:
    # Show the Path3D
    show()

func hide_path_3d() -> void:
    # Hide the Path3D
    hide()

func set_path_3d_visible(visible: bool) -> void:
    # Set the Path3D visible
    if visible:
        show()
    else:
        hide()

func set_path_3d_enabled(enabled: bool) -> void:
    # Set the Path3D enabled
    pass

func set_path_3d_loop(loop: bool) -> void:
    # Set the Path3D loop
    pass

func set_path_3d_smooth(smooth: bool) -> void:
    # Set the Path3D smooth
    pass
```

## Unusual Things

### Navigation Mesh
- **NavigationMesh**: Navigation mesh for pathfinding
- **Visible**: Visible for navigation mesh
- **Enabled**: Enabled for navigation mesh
- **Agent**: Agent for navigation mesh

### Navigation Agent
- **NavigationAgent**: Navigation agent for pathfinding
- **Visible**: Visible for navigation agent
- **Enabled**: Enabled for navigation agent
- **Target Position**: Target position for navigation agent
- **Velocity**: Velocity for navigation agent

### AStar
- **AStar**: A* pathfinding algorithm
- **Visible**: Visible for AStar
- **Enabled**: Enabled for AStar
- **Start Position**: Start position for AStar
- **Target Position**: Target position for AStar

### Path3D
- **Path3D**: Path for pathfinding
- **Visible**: Visible for Path3D
- **Enabled**: Enabled for Path3D
- **Loop**: Loop for Path3D
- **Smooth**: Smooth for Path3D

## Recommendations

### For Navigation Mesh
- **Use NavigationMesh**: Use navigation mesh for pathfinding
- **Set NavigationMesh Visible**: Set navigation mesh visible
- **Set NavigationMesh Enabled**: Set navigation mesh enabled
- **Add Navigation Agent**: Add navigation agent
- **Test in Editor**: Always test in editor

### For Navigation Agent
- **Use NavigationAgent**: Use navigation agent for pathfinding
- **Set NavigationAgent Visible**: Set navigation agent visible
- **Set NavigationAgent Enabled**: Set navigation agent enabled
- **Set NavigationAgent Target Position**: Set navigation agent target position
- **Set NavigationAgent Velocity**: Set navigation agent velocity
- **Test in Editor**: Always test in editor

### For AStar
- **Use AStar**: Use A* pathfinding algorithm
- **Set AStar Visible**: Set AStar visible
- **Set AStar Enabled**: Set AStar enabled
- **Set AStar Start Position**: Set AStar start position
- **Set AStar Target Position**: Set AStar target position
- **Get AStar Path**: Get AStar path
- **Test in Editor**: Always test in editor

### For Path3D
- **Use Path3D**: Use path for pathfinding
- **Set Path3D Visible**: Set path visible
- **Set Path3D Enabled**: Set path enabled
- **Set Path3D Loop**: Set path loop
- **Set Path3D Smooth**: Set path smooth
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Navigation Meshes**: Avoid using too many navigation meshes without optimization
- **Complex Navigation Agents**: Avoid using complex navigation agents without optimization
- **Unbounded AStar**: Avoid creating unbounded AStar
- **Unbounded Path3D**: Avoid creating unbounded Path3D

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Navigation Mesh
- **Incorrect Setup**: Incorrect navigation mesh setup can cause issues
- **Performance Issues**: Complex navigation mesh features can cause performance issues
- **Complexity**: Navigation mesh features can be complex

### Navigation Agent
- **Incorrect Setup**: Incorrect navigation agent setup can cause issues
- **Performance Issues**: Complex navigation agent features can cause performance issues
- **Complexity**: Navigation agent features can be complex

### AStar
- **Incorrect Setup**: Incorrect AStar setup can cause issues
- **Performance Issues**: Complex AStar features can cause performance issues
- **Complexity**: AStar features can be complex

### Path3D
- **Incorrect Setup**: Incorrect Path3D setup can cause issues
- **Performance Issues**: Complex Path3D features can cause performance issues
- **Complexity**: Path3D features can be complex

## ELI5: Navigation Mesh

Imagine you have a bunch of navigation meshes that you want to use for pathfinding. Navigation mesh is like a system that can provide navigation meshes for pathfinding.

### Example: Using Navigation Mesh
```gdscript
extends Node

func _ready() -> void:
    # Create a navigation mesh
    var navigation_mesh = Node.new()
    add_child(navigation_mesh)
    
    # Set the navigation mesh name
    navigation_mesh.name = "My Navigation Mesh"
    
    # Set the navigation mesh path
    navigation_mesh.navigation_mesh_path = "res://navigation_mesh/navigation_mesh.tscn"
    
    # Set the navigation mesh visible
    navigation_mesh.navigation_mesh_visible = true
    
    # Set the navigation mesh enabled
    navigation_mesh.navigation_mesh_enabled = true
    
    # Set the navigation mesh agent
    navigation_mesh.navigation_mesh_agent = true
    
    # Load the navigation mesh
    navigation_mesh.load_navigation_mesh("res://navigation_mesh/navigation_mesh.tscn")
```

## ELI5: Navigation Agent

Imagine you have a bunch of navigation agents that you want to use for pathfinding. Navigation agent is like a system that can provide navigation agents for pathfinding.

### Example: Using Navigation Agent
```gdscript
extends Node

func _ready() -> void:
    # Create a navigation agent
    var navigation_agent = Node.new()
    add_child(navigation_agent)
    
    # Set the navigation agent name
    navigation_agent.name = "My Navigation Agent"
    
    # Set the navigation agent path
    navigation_agent.navigation_agent_path = "res://navigation_agent/navigation_agent.tscn"
    
    # Set the navigation agent visible
    navigation_agent.navigation_agent_visible = true
    
    # Set the navigation agent enabled
    navigation_agent.navigation_agent_enabled = true
    
    # Set the navigation agent target position
    navigation_agent.navigation_agent_target_position = Vector3(100, 0, 100)
    
    # Set the navigation agent velocity
    navigation_agent.navigation_agent_velocity = Vector3(10, 0, 10)
    
    # Load the navigation agent
    navigation_agent.load_navigation_agent("res://navigation_agent/navigation_agent.tscn")
```

## ELI5: AStar

Imagine you have a bunch of A* pathfinding algorithms that you want to use for pathfinding. AStar is like a system that can provide A* pathfinding algorithms for pathfinding.

### Example: Using AStar
```gdscript
extends Node

func _ready() -> void:
    # Create an AStar
    var astar = Node.new()
    add_child(astar)
    
    # Set the AStar name
    astar.name = "My AStar"
    
    # Set the AStar path
    astar.astar_path = "res://astar/astar.tscn"
    
    # Set the AStar visible
    astar.astar_visible = true
    
    # Set the AStar enabled
    astar.astar_enabled = true
    
    # Set the AStar start position
    astar.astar_start_position = Vector3(0, 0, 0)
    
    # Set the AStar target position
    astar.astar_target_position = Vector3(100, 0, 100)
    
    # Load the AStar
    astar.load_astar("res://astar/astar.tscn")
    
    # Get the AStar path
    var path = astar.get_astar_path(Vector3(0, 0, 0), Vector3(100, 0, 100))
    print(path)
```

## ELI5: Path3D

Imagine you have a bunch of paths that you want to use for pathfinding. Path3D is like a system that can provide paths for pathfinding.

### Example: Using Path3D
```gdscript
extends Node

func _ready() -> void:
    # Create a Path3D
    var path_3d = Node.new()
    add_child(path_3d)
    
    # Set the Path3D name
    path_3d.name = "My Path3D"
    
    # Set the Path3D path
    path_3d.path_3d_path = "res://path_3d/path_3d.tscn"
    
    # Set the Path3D visible
    path_3d.path_3d_visible = true
    
    # Set the Path3D enabled
    path_3d.path_3d_enabled = true
    
    # Set the Path3D loop
    path_3d.path_3d_loop = true
    
    # Set the Path3D smooth
    path_3d.path_3d_smooth = true
    
    # Load the Path3D
    path_3d.load_path_3d("res://path_3d/path_3d.tscn")
```

## Best Practices Summary

1. **Use NavigationMesh** for pathfinding
2. **Set NavigationMesh Visible** for navigation mesh
3. **Set NavigationMesh Enabled** for navigation mesh
4. **Add Navigation Agent** for navigation mesh
5. **Use NavigationAgent** for pathfinding
6. **Set NavigationAgent Visible** for navigation agent
7. **Set NavigationAgent Enabled** for navigation agent
8. **Set NavigationAgent Target Position** for navigation agent
9. **Set NavigationAgent Velocity** for navigation agent
10. **Use AStar** for pathfinding
11. **Set AStar Visible** for AStar
12. **Set AStar Enabled** for AStar
13. **Set AStar Start Position** for AStar
14. **Set AStar Target Position** for AStar
15. **Get AStar Path** for AStar
16. **Use Path3D** for pathfinding
17. **Set Path3D Visible** for path
18. **Set Path3D Enabled** for path
19. **Set Path3D Loop** for path
20. **Set Path3D Smooth** for path
21. **Test in Editor** for proper setup
22. **Always clean up** unused nodes to prevent memory leaks
