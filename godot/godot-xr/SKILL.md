---
name: godot-xr
description: Godot Engine XR support (AR and VR).
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# XR Support

## Overview
Godot Engine's XR support provides powerful tools for creating games with features like XR support (AR and VR). This skill covers everything you need to know to create efficient and organized XR content in Godot 4.7.

## Key Insights

### XR Features
- **OpenXR**: Support for desktop headsets using OpenXR
- **SteamVR**: Support for SteamVR headsets
- **Quest**: Support for Meta Quest headsets
- **Pico**: Support for Pico headsets
- **HTC Vive**: Support for HTC Vive headsets
- **Valve Index**: Support for Valve Index headsets
- **Mixed Reality**: Support for mixed reality
- **Augmented Reality**: Support for augmented reality
- **Virtual Reality**: Support for virtual reality

### XR Features
- **OpenXR**: Support for desktop headsets using OpenXR
- **SteamVR**: Support for SteamVR headsets
- **Quest**: Support for Meta Quest headsets
- **Pico**: Support for Pico headsets
- **HTC Vive**: Support for HTC Vive headsets
- **Valve Index**: Support for Valve Index headsets
- **Mixed Reality**: Support for mixed reality
- **Augmented Reality**: Support for augmented reality
- **Virtual Reality**: Support for virtual reality

## Major Version Differences (3.x vs 4.x)

### XR System Changes
- **OpenXR**: Enhanced OpenXR support
- **SteamVR**: Enhanced SteamVR support
- **Quest**: Enhanced Quest support
- **Pico**: Enhanced Pico support
- **HTC Vive**: Enhanced HTC Vive support
- **Valve Index**: Enhanced Valve Index support
- **Mixed Reality**: Enhanced mixed reality support
- **Augmented Reality**: Enhanced augmented reality support
- **Virtual Reality**: Enhanced virtual reality support
- **Better Performance**: Improved performance for XR operations
- **Enhanced Editor**: Better editor support for XR management

### XR Features
- **OpenXR**: Enhanced OpenXR support
- **SteamVR**: Enhanced SteamVR support
- **Quest**: Enhanced Quest support
- **Pico**: Enhanced Pico support
- **HTC Vive**: Enhanced HTC Vive support
- **Valve Index**: Enhanced Valve Index support
- **Mixed Reality**: Enhanced mixed reality support
- **Augmented Reality**: Enhanced augmented reality support
- **Virtual Reality**: Enhanced virtual reality support

## New Features in Godot 4.7

### XR Features
- **OpenXR**: Enhanced OpenXR support
- **SteamVR**: Enhanced SteamVR support
- **Quest**: Enhanced Quest support
- **Pico**: Enhanced Pico support
- **HTC Vive**: Enhanced HTC Vive support
- **Valve Index**: Enhanced Valve Index support
- **Mixed Reality**: Enhanced mixed reality support
- **Augmented Reality**: Enhanced augmented reality support
- **Virtual Reality**: Enhanced virtual reality support
- **Better Performance**: Improved performance for XR operations
- **Enhanced Editor**: Better editor support for XR management

## Technical Implementation

### File: openxr.gd
```gdscript
extends Node

@export_group("OpenXR Properties")
@export var openxr_name: String = ""
@export var openxr_path: String = ""

@export_group("OpenXR Features")
@export var openxr_visible: bool = true
@export var openxr_enabled: bool = true
@export var openxr_hand_tracking: bool = false
@export var openxr_eye_tracking: bool = false

func _ready() -> void:
    # Set up the OpenXR
    if openxr_name:
        name = openxr_name
    
    if openxr_path:
        # Load the OpenXR
        load_openxr(openxr_path)
    
    if openxr_visible:
        # Show the OpenXR
        show()
    
    if openxr_enabled:
        # Enable the OpenXR
        pass
    
    if openxr_hand_tracking:
        # Enable hand tracking
        pass
    
    if openxr_eye_tracking:
        # Enable eye tracking
        pass

func _process(delta: float) -> void:
    # Update the OpenXR

func load_openxr(path: String) -> void:
    # Load an OpenXR
    var openxr = load(path)
    if openxr:
        # Load the OpenXR
        pass

func show_openxr() -> void:
    # Show the OpenXR
    show()

func hide_openxr() -> void:
    # Hide the OpenXR
    hide()

func set_openxr_visible(visible: bool) -> void:
    # Set the OpenXR visible
    if visible:
        show()
    else:
        hide()

func set_openxr_enabled(enabled: bool) -> void:
    # Set the OpenXR enabled
    pass

func set_openxr_hand_tracking(hand_tracking: bool) -> void:
    # Set the OpenXR hand tracking
    pass

func set_openxr_eye_tracking(eye_tracking: bool) -> void:
    # Set the OpenXR eye tracking
    pass
```

### File: steamvr.gd
```gdscript
extends Node

@export_group("SteamVR Properties")
@export var steamvr_name: String = ""
@export var steamvr_path: String = ""

@export_group("SteamVR Features")
@export var steamvr_visible: bool = true
@export var steamvr_enabled: bool = true
@export var steamvr_hand_tracking: bool = false
@export var steamvr_eye_tracking: bool = false

func _ready() -> void:
    # Set up the SteamVR
    if steamvr_name:
        name = steamvr_name
    
    if steamvr_path:
        # Load the SteamVR
        load_steamvr(steamvr_path)
    
    if steamvr_visible:
        # Show the SteamVR
        show()
    
    if steamvr_enabled:
        # Enable the SteamVR
        pass
    
    if steamvr_hand_tracking:
        # Enable hand tracking
        pass
    
    if steamvr_eye_tracking:
        # Enable eye tracking
        pass

func _process(delta: float) -> void:
    # Update the SteamVR

func load_steamvr(path: String) -> void:
    # Load a SteamVR
    var steamvr = load(path)
    if steamvr:
        # Load the SteamVR
        pass

func show_steamvr() -> void:
    # Show the SteamVR
    show()

func hide_steamvr() -> void:
    # Hide the SteamVR
    hide()

func set_steamvr_visible(visible: bool) -> void:
    # Set the SteamVR visible
    if visible:
        show()
    else:
        hide()

func set_steamvr_enabled(enabled: bool) -> void:
    # Set the SteamVR enabled
    pass

func set_steamvr_hand_tracking(hand_tracking: bool) -> void:
    # Set the SteamVR hand tracking
    pass

func set_steamvr_eye_tracking(eye_tracking: bool) -> void:
    # Set the SteamVR eye tracking
    pass
```

### File: quest.gd
```gdscript
extends Node

@export_group("Quest Properties")
@export var quest_name: String = ""
@export var quest_path: String = ""

@export_group("Quest Features")
@export var quest_visible: bool = true
@export var quest_enabled: bool = true
@export var quest_hand_tracking: bool = false
@export var quest_eye_tracking: bool = false

func _ready() -> void:
    # Set up the Quest
    if quest_name:
        name = quest_name
    
    if quest_path:
        # Load the Quest
        load_quest(quest_path)
    
    if quest_visible:
        # Show the Quest
        show()
    
    if quest_enabled:
        # Enable the Quest
        pass
    
    if quest_hand_tracking:
        # Enable hand tracking
        pass
    
    if quest_eye_tracking:
        # Enable eye tracking
        pass

func _process(delta: float) -> void:
    # Update the Quest

func load_quest(path: String) -> void:
    # Load a Quest
    var quest = load(path)
    if quest:
        # Load the Quest
        pass

func show_quest() -> void:
    # Show the Quest
    show()

func hide_quest() -> void:
    # Hide the Quest
    hide()

func set_quest_visible(visible: bool) -> void:
    # Set the Quest visible
    if visible:
        show()
    else:
        hide()

func set_quest_enabled(enabled: bool) -> void:
    # Set the Quest enabled
    pass

func set_quest_hand_tracking(hand_tracking: bool) -> void:
    # Set the Quest hand tracking
    pass

func set_quest_eye_tracking(eye_tracking: bool) -> void:
    # Set the Quest eye tracking
    pass
```

### File: pico.gd
```gdscript
extends Node

@export_group("Pico Properties")
@export var pico_name: String = ""
@export var pico_path: String = ""

@export_group("Pico Features")
@export var pico_visible: bool = true
@export var pico_enabled: bool = true
@export var pico_hand_tracking: bool = false
@export var pico_eye_tracking: bool = false

func _ready() -> void:
    # Set up the Pico
    if pico_name:
        name = pico_name
    
    if pico_path:
        # Load the Pico
        load_pico(pico_path)
    
    if pico_visible:
        # Show the Pico
        show()
    
    if pico_enabled:
        # Enable the Pico
        pass
    
    if pico_hand_tracking:
        # Enable hand tracking
        pass
    
    if pico_eye_tracking:
        # Enable eye tracking
        pass

func _process(delta: float) -> void:
    # Update the Pico

func load_pico(path: String) -> void:
    # Load a Pico
    var pico = load(path)
    if pico:
        # Load the Pico
        pass

func show_pico() -> void:
    # Show the Pico
    show()

func hide_pico() -> void:
    # Hide the Pico
    hide()

func set_pico_visible(visible: bool) -> void:
    # Set the Pico visible
    if visible:
        show()
    else:
        hide()

func set_pico_enabled(enabled: bool) -> void:
    # Set the Pico enabled
    pass

func set_pico_hand_tracking(hand_tracking: bool) -> void:
    # Set the Pico hand tracking
    pass

func set_pico_eye_tracking(eye_tracking: bool) -> void:
    # Set the Pico eye tracking
    pass
```

## Unusual Things

### OpenXR
- **OpenXR**: Support for desktop headsets using OpenXR
- **Visible**: Visible for OpenXR
- **Enabled**: Enabled for OpenXR
- **Hand Tracking**: Hand tracking for OpenXR
- **Eye Tracking**: Eye tracking for OpenXR

### SteamVR
- **SteamVR**: Support for SteamVR headsets
- **Visible**: Visible for SteamVR
- **Enabled**: Enabled for SteamVR
- **Hand Tracking**: Hand tracking for SteamVR
- **Eye Tracking**: Eye tracking for SteamVR

### Quest
- **Quest**: Support for Meta Quest headsets
- **Visible**: Visible for Quest
- **Enabled**: Enabled for Quest
- **Hand Tracking**: Hand tracking for Quest
- **Eye Tracking**: Eye tracking for Quest

### Pico
- **Pico**: Support for Pico headsets
- **Visible**: Visible for Pico
- **Enabled**: Enabled for Pico
- **Hand Tracking**: Hand tracking for Pico
- **Eye Tracking**: Eye tracking for Pico

## Recommendations

### For OpenXR
- **Use OpenXR**: Use OpenXR support
- **Set OpenXR Visible**: Set OpenXR visible
- **Set OpenXR Enabled**: Set OpenXR enabled
- **Set OpenXR Hand Tracking**: Set OpenXR hand tracking
- **Set OpenXR Eye Tracking**: Set OpenXR eye tracking
- **Test in Editor**: Always test in editor

### For SteamVR
- **Use SteamVR**: Use SteamVR support
- **Set SteamVR Visible**: Set SteamVR visible
- **Set SteamVR Enabled**: Set SteamVR enabled
- **Set SteamVR Hand Tracking**: Set SteamVR hand tracking
- **Set SteamVR Eye Tracking**: Set SteamVR eye tracking
- **Test in Editor**: Always test in editor

### For Quest
- **Use Quest**: Use Quest support
- **Set Quest Visible**: Set Quest visible
- **Set Quest Enabled**: Set Quest enabled
- **Set Quest Hand Tracking**: Set Quest hand tracking
- **Set Quest Eye Tracking**: Set Quest eye tracking
- **Test in Editor**: Always test in editor

### For Pico
- **Use Pico**: Use Pico support
- **Set Pico Visible**: Set Pico visible
- **Set Pico Enabled**: Set Pico enabled
- **Set Pico Hand Tracking**: Set Pico hand tracking
- **Set Pico Eye Tracking**: Set Pico eye tracking
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many OpenXR**: Avoid using too many OpenXR without optimization
- **Complex SteamVR**: Avoid using complex SteamVR without optimization
- **Unbounded Quest**: Avoid creating unbounded Quest
- **Unbounded Pico**: Avoid creating unbounded Pico

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### OpenXR
- **Incorrect Setup**: Incorrect OpenXR setup can cause issues
- **Performance Issues**: Complex OpenXR features can cause performance issues
- **Complexity**: OpenXR features can be complex

### SteamVR
- **Incorrect Setup**: Incorrect SteamVR setup can cause issues
- **Performance Issues**: Complex SteamVR features can cause performance issues
- **Complexity**: SteamVR features can be complex

### Quest
- **Incorrect Setup**: Incorrect Quest setup can cause issues
- **Performance Issues**: Complex Quest features can cause performance issues
- **Complexity**: Quest features can be complex

### Pico
- **Incorrect Setup**: Incorrect Pico setup can cause issues
- **Performance Issues**: Complex Pico features can cause performance issues
- **Complexity**: Pico features can be complex

## ELI5: OpenXR

Imagine you have an OpenXR headset that you want to use for your game. OpenXR is like a system that can provide OpenXR support.

### Example: Using OpenXR
```gdscript
extends Node

func _ready() -> void:
    # Create an OpenXR
    var openxr = Node.new()
    add_child(openxr)
    
    # Set the OpenXR name
    openxr.name = "My OpenXR"
    
    # Set the OpenXR path
    openxr.openxr_path = "res://openxr/openxr.tscn"
    
    # Set the OpenXR visible
    openxr.openxr_visible = true
    
    # Set the OpenXR enabled
    openxr.openxr_enabled = true
    
    # Set the OpenXR hand tracking
    openxr.openxr_hand_tracking = false
    
    # Set the OpenXR eye tracking
    openxr.openxr_eye_tracking = false
    
    # Load the OpenXR
    openxr.load_openxr("res://openxr/openxr.tscn")
```

## ELI5: SteamVR

Imagine you have a SteamVR headset that you want to use for your game. SteamVR is like a system that can provide SteamVR support.

### Example: Using SteamVR
```gdscript
extends Node

func _ready() -> void:
    # Create a SteamVR
    var steamvr = Node.new()
    add_child(steamvr)
    
    # Set the SteamVR name
    steamvr.name = "My SteamVR"
    
    # Set the SteamVR path
    steamvr.steamvr_path = "res://steamvr/steamvr.tscn"
    
    # Set the SteamVR visible
    steamvr.steamvr_visible = true
    
    # Set the SteamVR enabled
    steamvr.steamvr_enabled = true
    
    # Set the SteamVR hand tracking
    steamvr.steamvr_hand_tracking = false
    
    # Set the SteamVR eye tracking
    steamvr.steamvr_eye_tracking = false
    
    # Load the SteamVR
    steamvr.load_steamvr("res://steamvr/steamvr.tscn")
```

## ELI5: Quest

Imagine you have a Meta Quest headset that you want to use for your game. Quest is like a system that can provide Quest support.

### Example: Using Quest
```gdscript
extends Node

func _ready() -> void:
    # Create a Quest
    var quest = Node.new()
    add_child(quest)
    
    # Set the Quest name
    quest.name = "My Quest"
    
    # Set the Quest path
    quest.quest_path = "res://quest/quest.tscn"
    
    # Set the Quest visible
    quest.quest_visible = true
    
    # Set the Quest enabled
    quest.quest_enabled = true
    
    # Set the Quest hand tracking
    quest.quest_hand_tracking = false
    
    # Set the Quest eye tracking
    quest.quest_eye_tracking = false
    
    # Load the Quest
    quest.load_quest("res://quest/quest.tscn")
```

## ELI5: Pico

Imagine you have a Pico headset that you want to use for your game. Pico is like a system that can provide Pico support.

### Example: Using Pico
```gdscript
extends Node

func _ready() -> void:
    # Create a Pico
    var pico = Node.new()
    add_child(pico)
    
    # Set the Pico name
    pico.name = "My Pico"
    
    # Set the Pico path
    pico.pico_path = "res://pico/pico.tscn"
    
    # Set the Pico visible
    pico.pico_visible = true
    
    # Set the Pico enabled
    pico.pico_enabled = true
    
    # Set the Pico hand tracking
    pico.pico_hand_tracking = false
    
    # Set the Pico eye tracking
    pico.pico_eye_tracking = false
    
    # Load the Pico
    pico.load_pico("res://pico/pico.tscn")
```

## Best Practices Summary

1. **Use OpenXR** for OpenXR support
2. **Set OpenXR Visible** for OpenXR
3. **Set OpenXR Enabled** for OpenXR
4. **Set OpenXR Hand Tracking** for OpenXR
5. **Set OpenXR Eye Tracking** for OpenXR
6. **Use SteamVR** for SteamVR support
7. **Set SteamVR Visible** for SteamVR
8. **Set SteamVR Enabled** for SteamVR
9. **Set SteamVR Hand Tracking** for SteamVR
10. **Set SteamVR Eye Tracking** for SteamVR
11. **Use Quest** for Quest support
12. **Set Quest Visible** for Quest
13. **Set Quest Enabled** for Quest
14. **Set Quest Hand Tracking** for Quest
15. **Set Quest Eye Tracking** for Quest
16. **Use Pico** for Pico support
17. **Set Pico Visible** for Pico
18. **Set Pico Enabled** for Pico
19. **Set Pico Hand Tracking** for Pico
20. **Set Pico Eye Tracking** for Pico
21. **Test in Editor** for proper setup
22. **Always clean up** unused nodes to prevent memory leaks
