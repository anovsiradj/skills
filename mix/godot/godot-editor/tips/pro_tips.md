# Editor Pro Tips

### Live Scene Editing
**Pro Tip**: Use Live Scene Editing to preview changes in real-time without saving the scene. This is especially useful for rapid prototyping. However, note that:
- Live Scene Editing **does not** save changes automatically.
- It **does not** support undo/redo.
- It **does not** work with multiplayer scenes.

### External IDEs
**Pro Tip**: Use an external IDE like VS Code or Rider for larger projects. Godot supports external editors via the Editor Plugins API. Ensure your editor is configured with:
- **GDScript Linting**: Install the GDScript extension for syntax highlighting and linting.
- **Debugging**: Configure remote debugging via the `godot_remote_debug` plugin.

### Distraction-Free Mode
Toggle the "Distraction-Free Mode" (top right) to hide all docks and focus purely on the viewport.

### Workspace Settings
**Pro Tip**: Save workspace settings for specific workflows (e.g., UI design, physics testing). This allows you to quickly switch between different editor configurations.

### Scene Template Overrides
**Pro Tip**: Override default scene templates by placing custom `.tscn` files in the `res://templates/` directory. This ensures consistency across projects.
