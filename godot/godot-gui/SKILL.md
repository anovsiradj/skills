---
name: godot-gui
description: Godot Engine GUI system, Control nodes, Containers, and Theming.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# GUI System

## Key Insights
- **Control Nodes**: Everything in the UI is a `Control` node.
- **Containers**: The "secret sauce" of Godot UI. Instead of placing buttons manually, you put them in a `VBoxContainer` or `GridContainer` and the container handles the alignment automatically.
- **Anchors & Margins**: used to keep UI elements in specific corners or centered regardless of screen size.

## Major Version Differences (3.x vs 4.x)
- **Theming**: The theme system in Godot 4 is more powerful, allowing for better overrides and easier creation of global styles.

## Weird/Unusual Things
- **BBCode**: `RichTextLabel` supports BBCode for adding bold, italics, colors, and even animations to text inside a single label.
- **Control Rotation**: Unlike many engines, you can rotate and scale UI elements.

## Recommendations
- **Flexibility**: Use Containers (`HBox`, `VBox`, `MarginContainer`) instead of absolute positioning to ensure your UI works on all resolutions.
- **StyleBoxFlat**: Use `StyleBoxFlat` for procedural, vector-like UI elements (rounded corners, shadows) instead of using images.

## Prohibitions
- Do not use `Position` to move UI elements if they are inside a container; the container will just move them back. Use `custom_minimum_size` or container settings.

## ELI5: Containers
Imagine you have a box of toys. 
- **Absolute Position** is like gluing each toy to the floor. If you move the box, the toys stay where they are.
- **Containers** are like magic trays. If you put toys in a "Vertical Tray" (`VBoxContainer`), the tray automatically stacks them in a neat line. If you add a new toy, the tray pushes the others down to make room.

### Example: Centering a Button
1. Add a `CenterContainer` to the scene.
2. Set the `CenterContainer`'s layout to "Full Rect" (anchors to all corners).
3. Add a `Button` as a child of the `CenterContainer`.
4. The button will now always stay perfectly in the middle, no matter how you resize the window.

