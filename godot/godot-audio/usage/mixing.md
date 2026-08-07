# Audio Mixing and Routing
Using the Audio Bus system.

### Workflow
1. Open the **Audio** tab at the bottom of the editor.
2. Create new buses (e.g., "Music", "SFX", "Voice").
3. Assign your `AudioStreamPlayer` to a specific bus in the Inspector.
4. Add effects (like Reverb or Distort) to the bus.

### Controlling Volume via Code
Use the `AudioServer` singleton to change bus volume. Note that volume is measured in **decibels (dB)**.

### Example: Muting SFX
```gdscript
func toggle_sfx_mute(muted: bool):
	var bus_idx = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_mute(bus_idx, muted)
```
