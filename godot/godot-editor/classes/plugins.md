# Editor Plugins
You can extend the Godot Editor using `EditorPlugin`.

### Key Classes
- `EditorPlugin`: The base class for all plugins.
- `EditorInterface`: Used to modify the editor's UI, add buttons to the inspector, or manage the scene tree.

### Workflow
1. Create a folder in `res://addons/my_plugin/`.
2. Create a script that extends `EditorPlugin`.
3. Enable the plugin in `Project Settings` -> `Plugins`.

### Example: Adding a Custom Button
```gdscript
@tool
extends EditorPlugin

func _enter_tree():
	add_tool_menu_item("My Custom Tool", _on_tool_clicked)

func _exit_tree():
	remove_tool_menu_item("My Custom Tool")

func _on_tool_clicked():
	print("Custom Tool Clicked!")
```
