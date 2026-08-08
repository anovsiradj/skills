# Audio Players
Choosing the right node for the right sound.

### Player Types
- `AudioStreamPlayer`: Global sound. No position. Great for BGM and UI.
- `AudioStreamPlayer2D`: 2D spatial sound. Volume depends on distance to `AudioListener2D`.
- `AudioStreamPlayer3D`: 3D spatial sound. Volume and panning depend on distance to `AudioListener3D`.

### Key Methods
- `.play()`: Starts playback.
- `.stop()`: Stops playback.
- `.pitch_scale = value`: Changes the speed/pitch of the sound.

### Example: Randomizing Pitch
```gdscript
func play_sfx():
	$SfxPlayer.pitch_scale = randf_range(0.9, 1.1)
	$SfxPlayer.play()
```
