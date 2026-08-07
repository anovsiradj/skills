---
name: godot-gui
description: Godot Engine GUI system, Control nodes, Containers, and Theming.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# GUI System

## Overview
Godot Engine's GUI system provides powerful tools for creating user interfaces with features like Control nodes, Containers, and Theming. This skill covers everything you need to know to create efficient and organized user interfaces in Godot 4.7.

## Key Insights

### Control Nodes
- **Control**: Base class for all GUI elements
- **Button**: Interactive button
- **Label**: Text label
- **TextEdit**: Text input field
- **TextureRect**: Texture display
- **Sprite2D**: 2D sprite display
- **AnimationPlayer**: Animation playback

### Containers
- **BoxContainer**: Horizontal or vertical container
- **GridContainer**: Grid-based container
- **MarginContainer**: Container with margins
- **CenterContainer**: Container that centers its children
- **ScrollContainer**: Container with scrollbars
- **TabContainer**: Container with tabs

### Theming
- **Theme**: Theme for styling GUI elements
- **StyleBox**: Style box for styling GUI elements
- **Font**: Font for styling text
- **Icon**: Icon for styling icons

## Major Version Differences (3.x vs 4.x)

### GUI System Changes
- **Control Nodes**: Enhanced control nodes for better GUI creation
- **Containers**: Enhanced containers for better layout
- **Theming**: Enhanced theming for better styling
- **Better Performance**: Improved performance for GUI operations
- **Enhanced Editor**: Better editor support for GUI editing

### GUI Features
- **Control Nodes**: Enhanced control nodes for better GUI creation
- **Containers**: Enhanced containers for better layout
- **Theming**: Enhanced theming for better styling
- **Better Performance**: Improved performance for GUI operations

## New Features in Godot 4.7

### GUI Features
- **Control Nodes**: Enhanced control nodes for better GUI creation
- **Containers**: Enhanced containers for better layout
- **Theming**: Enhanced theming for better styling
- **Better Performance**: Improved performance for GUI operations
- **Enhanced Editor**: Better editor support for GUI editing

### GUI Tools
- **Script Editor**: Enhanced script editor
- **Visual Script**: Enhanced visual script
- **Shader Editor**: Enhanced shader editor
- **Plugin System**: Enhanced plugin system

## Technical Implementation

### File: control.gd
```gdscript
extends Control

@export_group("Control Properties")
@export var control_name: String = ""
@export var control_position: Vector2 = Vector2.ZERO
@export var control_size: Vector2 = Vector2(100, 100)

@export_group("Control Features")
@export var control_anchor: int = 0
@export var control_margin: float = 0.0
@export var control_theme: Theme

func _ready() -> void:
    # Set up the control
    if control_name:
        name = control_name
    
    position = control_position
    size = control_size
    
    if control_anchor != 0:
        anchor_mode = control_anchor
    
    if control_margin != 0.0:
        add_theme_constant_override("margin", control_margin)
    
    if control_theme:
        add_theme_stylebox_override("normal", control_theme.get_stylebox("normal"))

func _process(delta: float) -> void:
    # Update the control

func set_control_name(name: String) -> void:
    # Set the control name
    name = name

func set_control_position(position: Vector2) -> void:
    # Set the control position
    position = position

func set_control_size(size: Vector2) -> void:
    # Set the control size
    size = size

func set_control_anchor(anchor: int) -> void:
    # Set the control anchor
    anchor_mode = anchor

func set_control_margin(margin: float) -> void:
    # Set the control margin
    add_theme_constant_override("margin", margin)

func set_control_theme(theme: Theme) -> void:
    # Set the control theme
    add_theme_stylebox_override("normal", theme.get_stylebox("normal"))
```

### File: button.gd
```gdscript
extends Button

@export_group("Button Properties")
@export var button_text: String = ""
@export var button_icon: Texture2D
@export var button_disabled: bool = false

@export_group("Button Features")
@export var button_pressed: bool = false
@export var button_toggle_mode: bool = false
@export var button_focus_mode: int = 0

func _ready() -> void:
    # Set up the button
    if button_text:
        text = button_text
    
    if button_icon:
        icon = button_icon
    
    disabled = button_disabled
    
    if button_toggle_mode:
        toggle_mode = true
    
    if button_focus_mode != 0:
        focus_mode = button_focus_mode

func _process(delta: float) -> void:
    # Update the button

func set_button_text(text: String) -> void:
    # Set the button text
    text = text

func set_button_icon(icon: Texture2D) -> void:
    # Set the button icon
    icon = icon

func set_button_disabled(disabled: bool) -> void:
    # Set the button disabled
    disabled = disabled

func set_button_toggle_mode(toggle_mode: bool) -> void:
    # Set the button toggle mode
    toggle_mode = toggle_mode

func set_button_focus_mode(focus_mode: int) -> void:
    # Set the button focus mode
    focus_mode = focus_mode

func press_button() -> void:
    # Press the button
    press()
```

### File: label.gd
```gdscript
extends Label

@export_group("Label Properties")
@export var label_text: String = ""
@export var label_font: Font
@export var label_font_size: int = 16
@export var label_font_color: Color = Color.WHITE

@export_group("Label Features")
@export var label_autowrap: bool = false
@export var label_clip_text: bool = false
@export var label_text_overrun_behavior: int = 0

func _ready() -> void:
    # Set up the label
    if label_text:
        text = label_text
    
    if label_font:
        add_theme_font_override("font", label_font)
    
    add_theme_font_size_override("font_size", label_font_size)
    add_theme_color_override("font_color", label_font_color)
    
    if label_autowrap:
        autowrap_mode = TextServer.AUTOWRAP_WORD
    
    if label_clip_text:
        clip_text = true
    
    if label_text_overrun_behavior != 0:
        text_overrun_behavior = label_text_overrun_behavior

func _process(delta: float) -> void:
    # Update the label

func set_label_text(text: String) -> void:
    # Set the label text
    text = text

func set_label_font(font: Font) -> void:
    # Set the label font
    add_theme_font_override("font", font)

func set_label_font_size(font_size: int) -> void:
    # Set the label font size
    add_theme_font_size_override("font_size", font_size)

func set_label_font_color(color: Color) -> void:
    # Set the label font color
    add_theme_color_override("font_color", color)

func set_label_autowrap(autowrap: bool) -> void:
    # Set the label autowrap
    autowrap_mode = TextServer.AUTOWRAP_WORD if autowrap else TextServer.AUTOWRAP_OFF

func set_label_clip_text(clip_text: bool) -> void:
    # Set the label clip text
    clip_text = clip_text

func set_label_text_overrun_behavior(behavior: int) -> void:
    # Set the label text overrun behavior
    text_overrun_behavior = behavior
```

### File: theme.gd
```gdscript
extends Theme

@export_group("Theme Properties")
@export var theme_name: String = ""
@export var theme_author: String = ""
@export var theme_version: String = ""

@export_group("Theme Features")
@export var theme_control: bool = false
@export var theme_container: bool = false
@export var theme_style_box: bool = false
@export var theme_font: bool = false
@export var theme_icon: bool = false

func _ready() -> void:
    # Set up the theme
    if theme_name:
        name = theme_name
    
    if theme_author:
        author = theme_author
    
    if theme_version:
        version = theme_version

func _process(delta: float) -> void:
    # Update the theme

func add_theme_control(control: String) -> void:
    # Add a theme control
    add_theme_control(control)

func add_theme_container(container: String) -> void:
    # Add a theme container
    add_theme_container(container)

func add_theme_style_box(style_box: String, theme: Theme) -> void:
    # Add a theme style box
    add_theme_stylebox_override(style_box, theme.get_stylebox(style_box))

func add_theme_font(font: String, theme: Theme) -> void:
    # Add a theme font
    add_theme_font_override(font, theme.get_font(font))

func add_theme_icon(icon: String, theme: Theme) -> void:
    # Add a theme icon
    add_theme_icon_override(icon, theme.get_icon(icon))
```

## Unusual Things

### Control Nodes
- **Complex Setup**: Control nodes require complex setup
- **Performance Cost**: Control nodes have a performance cost
- **Debugging**: Control nodes can be difficult to debug

### Containers
- **Layout**: Containers provide layout for GUI elements
- **Performance Cost**: Containers have a performance cost
- **Complexity**: Containers can be complex

### Theming
- **Styling**: Theming provides styling for GUI elements
- **Performance Cost**: Theming has a performance cost
- **Complexity**: Theming can be complex

## Recommendations

### For Control Nodes
- **Use Control**: Always use `Control` for GUI elements
- **Use Button**: Use `Button` for interactive buttons
- **Use Label**: Use `Label` for text labels
- **Use TextEdit**: Use `TextEdit` for text input
- **Use TextureRect**: Use `TextureRect` for texture display
- **Use Sprite2D**: Use `Sprite2D` for 2D sprite display
- **Use AnimationPlayer**: Use `AnimationPlayer` for animation playback

### For Containers
- **Use BoxContainer**: Use `BoxContainer` for horizontal or vertical containers
- **Use GridContainer**: Use `GridContainer` for grid-based containers
- **Use MarginContainer**: Use `MarginContainer` for containers with margins
- **Use CenterContainer**: Use `CenterContainer` for containers that center their children
- **Use ScrollContainer**: Use `ScrollContainer` for containers with scrollbars
- **Use TabContainer**: Use `TabContainer` for containers with tabs

### For Theming
- **Use Theme**: Use `Theme` for styling GUI elements
- **Use StyleBox**: Use `StyleBox` for styling GUI elements
- **Use Font**: Use `Font` for styling text
- **Use Icon**: Use `Icon` for styling icons

## Prohibitions

### Performance Issues
- **Too Many Controls**: Avoid using too many controls without optimization
- **Complex Containers**: Avoid using complex containers without optimization
- **Unbounded Theming**: Avoid creating unbounded theming

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Control Nodes
- **Incorrect Setup**: Incorrect control node setup can cause issues
- **Performance Issues**: Complex control nodes can cause performance issues
- **Debugging**: Control nodes can be difficult to debug

### Containers
- **Incorrect Layout**: Incorrect container layout can cause issues
- **Performance Issues**: Complex containers can cause performance issues
- **Complexity**: Containers can be complex

### Theming
- **Incorrect Styling**: Incorrect theming can cause issues
- **Performance Issues**: Complex theming can cause performance issues
- **Complexity**: Theming can be complex

## ELI5: Control Nodes

Imagine you have a bunch of tools for creating GUI elements. Control nodes are like the base tools for creating these elements.

### Example: Using Control Nodes
```gdscript
extends Control

func _ready() -> void:
    # Create a control
    var control = Control.new()
    add_child(control)
    
    # Set the control name
    control.name = "My Control"
    
    # Set the control position
    control.position = Vector2(100, 100)
    
    # Set the control size
    control.size = Vector2(200, 200)
```

## ELI5: Button

Imagine you have a bunch of interactive buttons. Button is like a tool for creating interactive buttons.

### Example: Using Button
```gdscript
extends Button

func _ready() -> void:
    # Create a button
    var button = Button.new()
    add_child(button)
    
    # Set the button text
    button.text = "Click Me"
    
    # Set the button icon
    button.icon = load("res://icons/icon.png")
    
    # Set the button disabled
    button.disabled = false
    
    # Set the button toggle mode
    button.toggle_mode = true
    
    # Set the button focus mode
    button.focus_mode = Control.FOCUS_ALL
    
    # Connect the button
    button.pressed.connect(on_button_pressed)

func on_button_pressed() -> void:
    # Handle button press
    print("Button pressed!")
```

## ELI5: Label

Imagine you have a bunch of text labels. Label is like a tool for creating text labels.

### Example: Using Label
```gdscript
extends Label

func _ready() -> void:
    # Create a label
    var label = Label.new()
    add_child(label)
    
    # Set the label text
    label.text = "Hello World"
    
    # Set the label font
    label.add_theme_font_override("font", load("res://fonts/font.ttf"))
    
    # Set the label font size
    label.add_theme_font_size_override("font_size", 16)
    
    # Set the label font color
    label.add_theme_color_override("font_color", Color.WHITE)
    
    # Set the label autowrap
    label.autowrap_mode = TextServer.AUTOWRAP_WORD
    
    # Set the label clip text
    label.clip_text = true
```

## ELI5: Theme

Imagine you have a bunch of themes for styling GUI elements. Theme is like a system for styling GUI elements.

### Example: Using Theme
```gdscript
extends Theme

func _ready() -> void:
    # Create a theme
    var theme = Theme.new()
    add_child(theme)
    
    # Set the theme name
    theme.name = "My Theme"
    
    # Set the theme author
    theme.author = "John Doe"
    
    # Set the theme version
    theme.version = "1.0.0"
    
    # Add a theme control
    theme.add_theme_control("Button")
    
    # Add a theme container
    theme.add_theme_container("BoxContainer")
    
    # Add a theme style box
    var style_box = StyleBoxFlat.new()
    style_box.bg_color = Color.WHITE
    theme.add_theme_style_box("normal", theme)
    
    # Add a theme font
    theme.add_theme_font("font", theme)
    
    # Add a theme icon
    theme.add_theme_icon("icon", theme)
```

## Best Practices Summary

1. **Use Control** for GUI elements
2. **Use Button** for interactive buttons
3. **Use Label** for text labels
4. **Use TextEdit** for text input
5. **Use TextureRect** for texture display
6. **Use Sprite2D** for 2D sprite display
7. **Use AnimationPlayer** for animation playback
8. **Use BoxContainer** for horizontal or vertical containers
9. **Use GridContainer** for grid-based containers
10. **Use MarginContainer** for containers with margins
11. **Use CenterContainer** for containers that center their children
12. **Use ScrollContainer** for containers with scrollbars
13. **Use TabContainer** for containers with tabs
14. **Use Theme** for styling GUI elements
15. **Use StyleBox** for styling GUI elements
16. **Use Font** for styling text
17. **Use Icon** for styling icons
18. **Test in Editor** for proper setup
19. **Always clean up** unused nodes to prevent memory leaks
