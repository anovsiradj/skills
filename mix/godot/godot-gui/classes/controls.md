# GUI Control Nodes
The building blocks of the Godot user interface.

### Core Classes
- `Control`: The base class for all GUI elements.
- `Button`, `Label`, `LineEdit`, `TextEdit`: Basic input and text display.
- `RichTextLabel`: Advanced text with BBCode support for colors, bold, and effects.

### Layout Containers
Containers automate the positioning of children.
- `HBoxContainer` / `VBoxContainer`: Rows and columns.
- `GridContainer`: Grid layouts.
- `MarginContainer`: Adds padding around the contents.
- `ScrollContainer`: Adds scrollbars to large content.
- `CenterContainer`: Keeps children perfectly centered.

### Sizing Flags
Controls inside containers use these flags:
- `Fill`: Occupies the space given by the container.
- `Expand`: Pushes other nodes away to take as much space as possible.
- `Stretch Ratio`: Controls how space is split between multiple "Expand" nodes.
