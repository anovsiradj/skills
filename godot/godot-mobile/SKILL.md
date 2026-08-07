---
name: godot-mobile
description: Godot Engine mobile platforms, virtual joysticks, touch screens, and in-app purchases.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Mobile

## Overview
Godot Engine's mobile features provide powerful tools for creating games with features like virtual joysticks, touch screens, and in-app purchases. This skill covers everything you need to know to create efficient and organized mobile content in Godot 4.7.

## Key Insights

### Mobile Features
- **Virtual Joystick**: Virtual joystick for mobile devices
- **Touch Screen Button**: Touch screen button for mobile devices
- **In-App Purchases**: In-app purchases for mobile devices
- **Picture-in-Picture Mode**: Picture-in-picture mode for mobile devices

### Mobile Platforms
- **Android**: Android platform for mobile devices
- **iOS**: iOS platform for mobile devices
- **Web**: Web platform for mobile devices

### Mobile Features
- **Virtual Joystick**: Virtual joystick for mobile devices
- **Touch Screen Button**: Touch screen button for mobile devices
- **In-App Purchases**: In-app purchases for mobile devices
- **Picture-in-Picture Mode**: Picture-in-picture mode for mobile devices

## Major Version Differences (3.x vs 4.x)

### Mobile Features Changes
- **Virtual Joystick**: Enhanced virtual joystick for mobile devices
- **Touch Screen Button**: Enhanced touch screen button for mobile devices
- **In-App Purchases**: Enhanced in-app purchases for mobile devices
- **Picture-in-Picture Mode**: Enhanced picture-in-picture mode for mobile devices
- **Android**: Enhanced Android platform
- **iOS**: Enhanced iOS platform
- **Web**: Enhanced web platform
- **Better Performance**: Improved performance for mobile operations
- **Enhanced Editor**: Better editor support for mobile management

### Mobile Features
- **Virtual Joystick**: Enhanced virtual joystick
- **Touch Screen Button**: Enhanced touch screen button
- **In-App Purchases**: Enhanced in-app purchases
- **Picture-in-Picture Mode**: Enhanced picture-in-picture mode

## New Features in Godot 4.7

### Mobile Features
- **Virtual Joystick**: Enhanced virtual joystick
- **Touch Screen Button**: Enhanced touch screen button
- **In-App Purchases**: Enhanced in-app purchases
- **Picture-in-Picture Mode**: Enhanced picture-in-picture mode
- **Android**: Enhanced Android platform
- **iOS**: Enhanced iOS platform
- **Web**: Enhanced web platform
- **Better Performance**: Improved performance for mobile operations
- **Enhanced Editor**: Better editor support for mobile management

## Technical Implementation

### File: virtual_joystick.gd
```gdscript
extends Node

@export_group("Virtual Joystick Properties")
@export var virtual_joystick_name: String = ""
@export var virtual_joystick_path: String = ""

@export_group("Virtual Joystick Features")
@export var virtual_joystick_visible: bool = true
@export var virtual_joystick_autohide: bool = true
@export var virtual_joystick_deadzone: float = 0.1
@export var virtual_joystick_sensitivity: float = 1.0

func _ready() -> void:
    # Set up the virtual joystick
    if virtual_joystick_name:
        name = virtual_joystick_name
    
    if virtual_joystick_path:
        # Load the virtual joystick
        load_virtual_joystick(virtual_joystick_path)
    
    if virtual_joystick_visible:
        # Show the virtual joystick
        show()
    
    if virtual_joystick_autohide:
        # Auto-hide the virtual joystick
        pass
    
    if virtual_joystick_deadzone != 0.1:
        # Set the virtual joystick deadzone
        pass
    
    if virtual_joystick_sensitivity != 1.0:
        # Set the virtual joystick sensitivity
        pass

func _process(delta: float) -> void:
    # Update the virtual joystick

func load_virtual_joystick(path: String) -> void:
    # Load a virtual joystick
    var virtual_joystick = load(path)
    if virtual_joystick:
        # Load the virtual joystick
        pass

func show_virtual_joystick() -> void:
    # Show the virtual joystick
    show()

func hide_virtual_joystick() -> void:
    # Hide the virtual joystick
    hide()

func set_virtual_joystick_visible(visible: bool) -> void:
    # Set the virtual joystick visible
    if visible:
        show()
    else:
        hide()

func set_virtual_joystick_autohide(autohide: bool) -> void:
    # Set the virtual joystick autohide
    pass

func set_virtual_joystick_deadzone(deadzone: float) -> void:
    # Set the virtual joystick deadzone
    pass

func set_virtual_joystick_sensitivity(sensitivity: float) -> void:
    # Set the virtual joystick sensitivity
    pass
```

### File: touch_screen_button.gd
```gdscript
extends Node

@export_group("Touch Screen Button Properties")
@export var touch_screen_button_name: String = ""
@export var touch_screen_button_path: String = ""

@export_group("Touch Screen Button Features")
@export var touch_screen_button_visible: bool = true
@export var touch_screen_button_pressed: bool = false
@export var touch_screen_button_disabled: bool = false

func _ready() -> void:
    # Set up the touch screen button
    if touch_screen_button_name:
        name = touch_screen_button_name
    
    if touch_screen_button_path:
        # Load the touch screen button
        load_touch_screen_button(touch_screen_button_path)
    
    if touch_screen_button_visible:
        # Show the touch screen button
        show()
    
    if touch_screen_button_disabled:
        # Disable the touch screen button
        disabled = true

func _process(delta: float) -> void:
    # Update the touch screen button

func load_touch_screen_button(path: String) -> void:
    # Load a touch screen button
    var touch_screen_button = load(path)
    if touch_screen_button:
        # Load the touch screen button
        pass

func show_touch_screen_button() -> void:
    # Show the touch screen button
    show()

func hide_touch_screen_button() -> void:
    # Hide the touch screen button
    hide()

func set_touch_screen_button_visible(visible: bool) -> void:
    # Set the touch screen button visible
    if visible:
        show()
    else:
        hide()

func set_touch_screen_button_pressed(pressed: bool) -> void:
    # Set the touch screen button pressed
    pressed = pressed

func set_touch_screen_button_disabled(disabled: bool) -> void:
    # Set the touch screen button disabled
    disabled = disabled
```

### File: in_app_purchases.gd
```gdscript
extends Node

@export_group("In-App Purchase Properties")
@export var in_app_purchase_name: String = ""
@export var in_app_purchase_path: String = ""

@export_group("In-App Purchase Features")
@export var in_app_purchase_visible: bool = true
@export var in_app_purchase_enabled: bool = true
@export var in_app_purchase_test_mode: bool = false

func _ready() -> void:
    # Set up the in-app purchase
    if in_app_purchase_name:
        name = in_app_purchase_name
    
    if in_app_purchase_path:
        # Load the in-app purchase
        load_in_app_purchase(in_app_purchase_path)
    
    if in_app_purchase_visible:
        # Show the in-app purchase
        show()
    
    if in_app_purchase_enabled:
        # Enable the in-app purchase
        pass
    
    if in_app_purchase_test_mode:
        # Enable test mode
        pass

func _process(delta: float) -> void:
    # Update the in-app purchase

func load_in_app_purchase(path: String) -> void:
    # Load an in-app purchase
    var in_app_purchase = load(path)
    if in_app_purchase:
        # Load the in-app purchase
        pass

func show_in_app_purchase() -> void:
    # Show the in-app purchase
    show()

func hide_in_app_purchase() -> void:
    # Hide the in-app purchase
    hide()

func set_in_app_purchase_visible(visible: bool) -> void:
    # Set the in-app purchase visible
    if visible:
        show()
    else:
        hide()

func set_in_app_purchase_enabled(enabled: bool) -> void:
    # Set the in-app purchase enabled
    pass

func set_in_app_purchase_test_mode(test_mode: bool) -> void:
    # Set the in-app purchase test mode
    pass
```

### File: picture_in_picture.gd
```gdscript
extends Node

@export_group("Picture-in-Picture Properties")
@export var picture_in_picture_name: String = ""
@export var picture_in_picture_path: String = ""

@export_group("Picture-in-Picture Features")
@export var picture_in_picture_visible: bool = true
@export var picture_in_picture_autohide: bool = true
@export var picture_in_picture_position: Vector2 = Vector2.ZERO

func _ready() -> void:
    # Set up the picture-in-picture
    if picture_in_picture_name:
        name = picture_in_picture_name
    
    if picture_in_picture_path:
        # Load the picture-in-picture
        load_picture_in_picture(picture_in_picture_path)
    
    if picture_in_picture_visible:
        # Show the picture-in-picture
        show()
    
    if picture_in_picture_autohide:
        # Auto-hide the picture-in-picture
        pass
    
    if picture_in_picture_position != Vector2.ZERO:
        # Set the picture-in-picture position
        position = picture_in_picture_position

func _process(delta: float) -> void:
    # Update the picture-in-picture

func load_picture_in_picture(path: String) -> void:
    # Load a picture-in-picture
    var picture_in_picture = load(path)
    if picture_in_picture:
        # Load the picture-in-picture
        pass

func show_picture_in_picture() -> void:
    # Show the picture-in-picture
    show()

func hide_picture_in_picture() -> void:
    # Hide the picture-in-picture
    hide()

func set_picture_in_picture_visible(visible: bool) -> void:
    # Set the picture-in-picture visible
    if visible:
        show()
    else:
        hide()

func set_picture_in_picture_autohide(autohide: bool) -> void:
    # Set the picture-in-picture autohide
    pass

func set_picture_in_picture_position(position: Vector2) -> void:
    # Set the picture-in-picture position
    position = position
```

## Unusual Things

### Virtual Joystick
- **Virtual Joystick**: Virtual joystick for mobile devices
- **Deadzone**: Deadzone for virtual joystick
- **Sensitivity**: Sensitivity for virtual joystick

### Touch Screen Button
- **Touch Screen Button**: Touch screen button for mobile devices
- **Visible**: Visible for touch screen button
- **Pressed**: Pressed for touch screen button
- **Disabled**: Disabled for touch screen button

### In-App Purchases
- **In-App Purchases**: In-app purchases for mobile devices
- **Visible**: Visible for in-app purchases
- **Enabled**: Enabled for in-app purchases
- **Test Mode**: Test mode for in-app purchases

### Picture-in-Picture
- **Picture-in-Picture**: Picture-in-picture mode for mobile devices
- **Visible**: Visible for picture-in-picture
- **Autohide**: Autohide for picture-in-picture
- **Position**: Position for picture-in-picture

## Recommendations

### For Virtual Joystick
- **Use Virtual Joystick**: Use virtual joystick for mobile devices
- **Set Deadzone**: Set virtual joystick deadzone
- **Set Sensitivity**: Set virtual joystick sensitivity
- **Test in Editor**: Always test in editor

### For Touch Screen Button
- **Use Touch Screen Button**: Use touch screen button for mobile devices
- **Set Visible**: Set touch screen button visible
- **Set Pressed**: Set touch screen button pressed
- **Set Disabled**: Set touch screen button disabled
- **Test in Editor**: Always test in editor

### For In-App Purchases
- **Use In-App Purchases**: Use in-app purchases for mobile devices
- **Set Visible**: Set in-app purchases visible
- **Set Enabled**: Set in-app purchases enabled
- **Set Test Mode**: Set in-app purchases test mode
- **Test in Editor**: Always test in editor

### For Picture-in-Picture
- **Use Picture-in-Picture**: Use picture-in-picture mode for mobile devices
- **Set Visible**: Set picture-in-picture visible
- **Set Autohide**: Set picture-in-picture autohide
- **Set Position**: Set picture-in-picture position
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Virtual Joysticks**: Avoid using too many virtual joysticks without optimization
- **Complex Touch Screen Buttons**: Avoid using complex touch screen buttons without optimization
- **Unbounded In-App Purchases**: Avoid creating unbounded in-app purchases
- **Unbounded Picture-in-Picture**: Avoid creating unbounded picture-in-picture

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Virtual Joystick
- **Incorrect Setup**: Incorrect virtual joystick setup can cause issues
- **Performance Issues**: Complex virtual joystick features can cause performance issues
- **Complexity**: Virtual joystick features can be complex

### Touch Screen Button
- **Incorrect Setup**: Incorrect touch screen button setup can cause issues
- **Performance Issues**: Complex touch screen button features can cause performance issues
- **Complexity**: Touch screen button features can be complex

### In-App Purchases
- **Incorrect Setup**: Incorrect in-app purchase setup can cause issues
- **Performance Issues**: Complex in-app purchase features can cause performance issues
- **Complexity**: In-app purchase features can be complex

### Picture-in-Picture
- **Incorrect Setup**: Incorrect picture-in-picture setup can cause issues
- **Performance Issues**: Complex picture-in-picture features can cause performance issues
- **Complexity**: Picture-in-picture features can be complex

## ELI5: Virtual Joystick

Imagine you have a mobile device and you want to control a game with virtual controls. Virtual joystick is like a system that can provide virtual controls for mobile devices.

### Example: Using Virtual Joystick
```gdscript
extends Node

func _ready() -> void:
    # Create a virtual joystick
    var virtual_joystick = Node.new()
    add_child(virtual_joystick)
    
    # Set the virtual joystick name
    virtual_joystick.name = "My Virtual Joystick"
    
    # Set the virtual joystick path
    virtual_joystick.virtual_joystick_path = "res://virtual_joystick/virtual_joystick.tscn"
    
    # Set the virtual joystick visible
    virtual_joystick.virtual_joystick_visible = true
    
    # Set the virtual joystick autohide
    virtual_joystick.virtual_joystick_autohide = true
    
    # Set the virtual joystick deadzone
    virtual_joystick.virtual_joystick_deadzone = 0.1
    
    # Set the virtual joystick sensitivity
    virtual_joystick.virtual_joystick_sensitivity = 1.0
    
    # Load the virtual joystick
    virtual_joystick.load_virtual_joystick("res://virtual_joystick/virtual_joystick.tscn")
```

## ELI5: Touch Screen Button

Imagine you have a mobile device and you want to control a game with touch screen buttons. Touch screen button is like a system that can provide touch screen buttons for mobile devices.

### Example: Using Touch Screen Button
```gdscript
extends Node

func _ready() -> void:
    # Create a touch screen button
    var touch_screen_button = Node.new()
    add_child(touch_screen_button)
    
    # Set the touch screen button name
    touch_screen_button.name = "My Touch Screen Button"
    
    # Set the touch screen button path
    touch_screen_button.touch_screen_button_path = "res://touch_screen_button/touch_screen_button.tscn"
    
    # Set the touch screen button visible
    touch_screen_button.touch_screen_button_visible = true
    
    # Set the touch screen button pressed
    touch_screen_button.touch_screen_button_pressed = false
    
    # Set the touch screen button disabled
    touch_screen_button.touch_screen_button_disabled = false
    
    # Load the touch screen button
    touch_screen_button.load_touch_screen_button("res://touch_screen_button/touch_screen_button.tscn")
```

## ELI5: In-App Purchases

Imagine you have a mobile game and you want to sell in-game items. In-app purchases is like a system that can provide in-app purchases for mobile devices.

### Example: Using In-App Purchases
```gdscript
extends Node

func _ready() -> void:
    # Create an in-app purchase
    var in_app_purchase = Node.new()
    add_child(in_app_purchase)
    
    # Set the in-app purchase name
    in_app_purchase.name = "My In-App Purchase"
    
    # Set the in-app purchase path
    in_app_purchase.in_app_purchase_path = "res://in_app_purchase/in_app_purchase.tscn"
    
    # Set the in-app purchase visible
    in_app_purchase.in_app_purchase_visible = true
    
    # Set the in-app purchase enabled
    in_app_purchase.in_app_purchase_enabled = true
    
    # Set the in-app purchase test mode
    in_app_purchase.in_app_purchase_test_mode = false
    
    # Load the in-app purchase
    in_app_purchase.load_in_app_purchase("res://in_app_purchase/in_app_purchase.tscn")
```

## ELI5: Picture-in-Picture

Imagine you have a mobile device and you want to display a video in a picture-in-picture mode. Picture-in-picture is like a system that can provide picture-in-picture mode for mobile devices.

### Example: Using Picture-in-Picture
```gdscript
extends Node

func _ready() -> void:
    # Create a picture-in-picture
    var picture_in_picture = Node.new()
    add_child(picture_in_picture)
    
    # Set the picture-in-picture name
    picture_in_picture.name = "My Picture-in-Picture"
    
    # Set the picture-in-picture path
    picture_in_picture.picture_in_picture_path = "res://picture_in_picture/picture_in_picture.tscn"
    
    # Set the picture-in-picture visible
    picture_in_picture.picture_in_picture_visible = true
    
    # Set the picture-in-picture autohide
    picture_in_picture.picture_in_picture_autohide = true
    
    # Set the picture-in-picture position
    picture_in_picture.picture_in_picture_position = Vector2(100, 100)
    
    # Load the picture-in-picture
    picture_in_picture.load_picture_in_picture("res://picture_in_picture/picture_in_picture.tscn")
```

## Best Practices Summary

1. **Use Virtual Joystick** for mobile devices
2. **Set Virtual Joystick Deadzone** for virtual joystick
3. **Set Virtual Joystick Sensitivity** for virtual joystick
4. **Use Touch Screen Button** for mobile devices
5. **Set Touch Screen Button Visible** for touch screen button
6. **Set Touch Screen Button Pressed** for touch screen button
7. **Set Touch Screen Button Disabled** for touch screen button
8. **Use In-App Purchases** for mobile devices
9. **Set In-App Purchase Visible** for in-app purchases
10. **Set In-App Purchase Enabled** for in-app purchases
11. **Set In-App Purchase Test Mode** for in-app purchases
12. **Use Picture-in-Picture** for mobile devices
13. **Set Picture-in-Picture Visible** for picture-in-picture
14. **Set Picture-in-Picture Autohide** for picture-in-picture
15. **Set Picture-in-Picture Position** for picture-in-picture
16. **Test in Editor** for proper setup
17. **Always clean up** unused nodes to prevent memory leaks
