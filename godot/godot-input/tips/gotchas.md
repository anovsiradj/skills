# Input Gotchas

### Input Priority
Input flows through the engine in this order:
`_input()` $ightarrow$ GUI Nodes $ightarrow$ `_shortcut_input()` $ightarrow$ `_unhandled_input()`.

**Tip**:
- Always put gameplay input (e.g., shooting, jumping) in `_unhandled_input()` to prevent conflicts with UI inputs.
- Use `_input()` for general input handling.
- Use `_shortcut_input()` for keyboard shortcuts.

### Gamepad Deadzones
Gamepad sticks often "drift" due to manufacturing imperfections.

**Fix**:
- Set a deadzone in the Input Map settings to prevent unintended movement.
- Adjust deadzone values in `Project Settings` -> `Input` -> `Gamepad`.
- **Default Values**: Use default deadzone values for most controllers.
- **Custom Deadzones**: Customize deadzones per controller for better precision.

### Physical Keys
Use "Physical" mapping for keyboards to ensure consistent behavior across different keyboard layouts.

**Example**:
- A "W" key on a QWERTY keyboard and a "Z" key on an AZERTY keyboard should both act as "Forward".

### Input Action Mapping
- **Description**: Incorrect input action mapping can lead to unresponsive controls.
- **Tip**:
  - **Double-Check Actions**: Verify input actions in `Project Settings` -> `Input` -> `Actions`.
  - **Action Shortcuts**: Use action shortcuts for quick input testing.
  - **Action Groups**: Organize actions into groups for better management.

### Input Map Conflicts
- **Description**: Conflicting input actions can cause unexpected behavior.
- **Tip**:
  - **Avoid Overlaps**: Ensure no two actions share the same key or button.
  - **Action Priorities**: Set priorities for conflicting actions.
  - **Debugging**: Use `InputEvent` debugging to identify conflicts.

### Input Filtering
- **Description**: Input filtering can unintentionally block valid inputs.
- **Tip**:
  - **Filter Settings**: Configure input filters in `Project Settings` -> `Input` -> `Filters`.
  - **Test Inputs**: Test inputs with and without filters to ensure they work as expected.
  - **Custom Filters**: Implement custom filters for specific input needs.

### Input Polling
- **Description**: Input polling can cause lag if not managed properly.
- **Tip**:
  - **Polling Rate**: Adjust polling rate in `Project Settings` -> `Input` -> `Polling`.
  - **Use `_input`**: Use `_input` event for real-time input handling.
  - **Avoid Over-Polling**: Limit polling frequency to avoid unnecessary CPU usage.

### Input Events
- **Description**: Input events can be missed if not handled correctly.
- **Tip**:
  - **Handle Events**: Ensure all input events are handled in `_input` or `_unhandled_input`.
  - **Event Order**: Handle events in the correct order to avoid conflicts.
  - **Event Debugging**: Use `InputEvent` debugging to identify missed events.

### Input Actions in `_ready`
- **Description**: Accessing input actions in `_ready` can cause issues.
- **Tip**:
  - **Use `_input`**: Access input actions in `_input` or `_physics_process`.
  - **Lazy Initialization**: Initialize input actions lazily to avoid potential errors.
  - **Input Ready**: Ensure input system is ready before accessing actions.

### Input Actions with Multi-Touch
- **Description**: Multi-touch inputs can cause issues if not handled properly.
- **Tip**:
  - **Multi-Touch Settings**: Configure multi-touch settings in `Project Settings` -> `Input` -> `Multi-Touch`.
  - **Touch Events**: Handle touch events in `_input` or `_unhandled_input`.
  - **Touch Debugging**: Use touch debugging tools to identify issues.

### Input Actions with Gamepad
- **Description**: Gamepad inputs can cause issues if not configured correctly.
- **Tip**:
  - **Gamepad Settings**: Configure gamepad settings in `Project Settings` -> `Input` -> `Gamepad`.
  - **Gamepad Debugging**: Use gamepad debugging tools to identify issues.
  - **Gamepad Calibration**: Calibrate gamepads for accurate input.

### Input Actions with Virtual Joysticks
- **Description**: Virtual joystick inputs can cause issues if not configured correctly.
- **Tip**:
  - **Virtual Joystick Settings**: Configure virtual joystick settings in `Project Settings` -> `Input` -> `Virtual Joystick`.
  - **Virtual Joystick Debugging**: Use virtual joystick debugging tools to identify issues.
  - **Virtual Joystick Calibration**: Calibrate virtual joysticks for accurate input.