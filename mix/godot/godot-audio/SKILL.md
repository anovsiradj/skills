---
name: godot-audio
description: Godot Engine audio system, sound effects, music, and audio processing.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Audio

## Overview
Playing and routing audio: `AudioStreamPlayer`/`AudioStreamPlayer2D`/`AudioStreamPlayer3D`, the `AudioServer` singleton for buses, and `AudioEffect` resources for processing.

## Key Version Differences (3.x vs 4.x)
- Audio buses are managed through the `AudioServer` singleton: `get_bus_index()`, `set_bus_mute()`, `set_bus_volume_db()`.
- `AudioStreamPlayer.stream` takes an `AudioStream` resource (e.g. `AudioStreamWAV`, `AudioStreamOggVorbis`, `AudioStreamMP3`).
- Web export supports OGG Vorbis; MP3/WAV support is limited or absent in browsers.

## File Map
| File | Purpose |
|------|---------|
| [classes/players.md](classes/players.md) | Player node types and methods |
| [tips/tips.md](tips/tips.md) | Formats, listeners, machine-gun effect |
| [usage/mixing.md](usage/mixing.md) | Buses, routing, volume control |
| [examples/play_sfx.gd](examples/play_sfx.gd) | One-shot SFX with pitch variation |
| [examples/audio_bus.gd](examples/audio_bus.gd) | Bus volume/mute control |

## Quick Start
```gdscript
# Randomized pitch avoids the "machine gun" effect.
$SfxPlayer.pitch_scale = randf_range(0.9, 1.1)
$SfxPlayer.play()
```
