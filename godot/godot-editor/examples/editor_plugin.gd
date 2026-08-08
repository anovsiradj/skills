@tool
extends EditorPlugin
## Registers a tool menu item and a dock with the editor.

func _enter_tree() -> void:
	add_tool_menu_item("My Custom Tool", _on_tool_clicked)

	var dock := PanelContainer.new()
	dock.add_child(Label.new())
	add_control_to_dock(DOCK_SLOT_LEFT_BR, dock)

func _exit_tree() -> void:
	remove_tool_menu_item("My Custom Tool")
	# Remove any controls added to docks here too.

func _on_tool_clicked() -> void:
	print("Custom Tool Clicked!")
