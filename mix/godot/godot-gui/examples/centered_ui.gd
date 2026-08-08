extends Control
## Building a centered UI from code with anchors.

func _ready() -> void:
	var panel := PanelContainer.new()
	# Center the panel on the parent (anchors + offsets).
	panel.set_anchors_and_offsets_preset(Control.PRESET_CENTER)

	var label := Label.new()
	label.text = "Hello, UI!"
	panel.add_child(label)
	add_child(panel)

	# Give the container a sensible minimum size (else it is 0x0).
	panel.custom_minimum_size = Vector2(200, 50)
	panel.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
