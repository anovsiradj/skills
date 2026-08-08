extends Node
## Rebinding actions at runtime via the InputMap singleton.

func rebind_action(action: StringName, event: InputEvent) -> void:
	# Remove all current bindings for the action, then add the new one.
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, event)

func bind_key(action: StringName, keycode: Key) -> void:
	var key := InputEventKey.new()
	key.keycode = keycode
	rebind_action(action, key)

func bind_gamepad_button(action: StringName, button_index: JoyButton) -> void:
	var joy := InputEventJoypadButton.new()
	joy.button_index = button_index
	rebind_action(action, joy)
