---
name: godot-audio
description: Godot Engine audio systems, buses, and procedural audio.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Audio

## Key Insights
- **Audio Buses**: A flexible routing system. You can send all "SFX" to one bus and "Music" to another, then put a Reverb effect on the SFX bus.
- **Positional Audio**: `AudioStreamPlayer2D` and `3D` handle panning and volume based on distance from the listener.
- **Polyphony**: A single player node can play multiple copies of the same sound simultaneously.

## Major Version Differences (3.x vs 4.x)
- **Audio Backend**: Significant improvements in the audio driver stability and performance across platforms.

## Weird/Unusual Things
- **Procedural Audio**: `AudioStreamGenerator` allows you to create sounds from raw math (sine waves, noise) in real-time.
- **TTS**: Built-in support for platform-native Text-to-Speech.

## Recommendations
- **Organization**: Always use Audio Buses to manage volume levels (e.g., separate Master, Music, SFX, UI buses).
- **Variation**: Use random pitch and volume scaling for repetitive sounds (like footsteps) to avoid the "machine gun" effect.

## Prohibitions
- Do not load massive uncompressed WAV files for long background music; use Ogg Vorbis for music to save memory.

## ELI5: Audio Buses
Imagine your game's sound is like water flowing through pipes.
- Every sound starts in its own small pipe.
- These small pipes all flow into a bigger pipe called "SFX".
- The "SFX" pipe then flows into the "Master" pipe.
If you want to make all sound effects quieter, you just put a valve (volume slider) on the "SFX" pipe, and everything flowing through it gets quieter at once.

### Example: Playing a Sound with Random Pitch
```gdscript
func play_footstep():
	var player = $AudioStreamPlayer2D
	player.pitch_scale = randf_range(0.9, 1.1) # Slight variation
	player.play()
```

