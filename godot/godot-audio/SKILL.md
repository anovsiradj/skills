---
name: godot-audio
description: Godot Engine audio system, sound effects, music, and audio processing.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Audio

## Overview
Godot Engine's audio system provides powerful tools for creating audio with features like sound effects, music, audio buses, and audio processing. This skill covers everything you need to know to create efficient and organized audio in Godot 4.7.

## Key Insights

### Audio Nodes
- **AudioStreamPlayer**: Node for playing audio streams
- **AudioStreamPlayer2D**: Node for playing 2D audio streams
- **AudioStreamPlayer3D**: Node for playing 3D audio streams
- **AudioStreamMixer**: Node for mixing audio streams
- **AudioBus**: Node for audio bus processing

### Audio Formats
- **Ogg Vorbis**: Compressed audio format
- **WAV**: Uncompressed audio format
- **MP3**: Compressed audio format
- **QOA**: Quite OK Audio format
- **FLAC**: Free Lossless Audio Codec format

### Audio Features
- **Buses**: Audio buses for organizing audio
- **Effects**: Audio effects for processing audio
- **Mixers**: Audio mixers for mixing audio
- **Playback**: Audio playback for playing audio

## Major Version Differences (3.x vs 4.x)

### Audio System Changes
- **Audio Buses**: New audio bus system for organizing audio
- **Audio Effects**: New audio effects for processing audio
- **Audio Mixers**: New audio mixers for mixing audio
- **Better Performance**: Improved performance for audio playback
- **Enhanced Editor**: Better editor support for audio editing

### Audio Features
- **Buses**: Enhanced audio buses for organizing audio
- **Effects**: Enhanced audio effects for processing audio
- **Mixers**: Enhanced audio mixers for mixing audio
- **Playback**: Enhanced audio playback for playing audio

## New Features in Godot 4.7

### Audio Features
- **Audio Buses**: Enhanced audio bus system
- **Audio Effects**: Enhanced audio effects
- **Audio Mixers**: Enhanced audio mixers
- **Better Performance**: Improved performance for audio playback
- **Enhanced Editor**: Better editor support for audio editing

### Audio Formats
- **Ogg Vorbis**: Enhanced Ogg Vorbis support
- **WAV**: Enhanced WAV support
- **MP3**: Enhanced MP3 support
- **QOA**: Enhanced QOA support
- **FLAC**: Enhanced FLAC support

## Technical Implementation

### File: audio_stream_player.gd
```gdscript
extends AudioStreamPlayer

@export_group("Audio Stream Properties")
@export var stream: AudioStream
@export var autoplay: bool = false
@export var loop: bool = false
@export var volume: float = 0.0
@export var pitch_scale: float = 1.0

@export_group("Playback Properties")
@export var playback_position: float = 0.0
@export var playback_speed: float = 1.0
@export var playback_paused: bool = false

@export_group("Effect Properties")
@export var filter_enabled: bool = false
@export var filter_cutoff: float = 22050.0
@export var filter_resonance: float = 1.0

func _ready() -> void:
    # Set up the audio stream player
    if stream:
        stream = stream
    
    if autoplay:
        play()
    
    volume_db = volume
    pitch_scale = pitch_scale

func _process(delta: float) -> void:
    # Update playback position
    if !playback_paused:
        playback_position += playback_speed * delta
        seek(playback_position)

func play_audio() -> void:
    # Play the audio
    play()

func pause_audio() -> void:
    # Pause the audio
    pause()

func stop_audio() -> void:
    # Stop the audio
    stop()

func set_volume(volume: float) -> void:
    # Set the volume
    volume_db = volume

func set_pitch_scale(pitch_scale: float) -> void:
    # Set the pitch scale
    pitch_scale = pitch_scale

func set_filter(cutoff: float, resonance: float) -> void:
    # Set the filter
    filter_enabled = true
    filter_cutoff = cutoff
    filter_resonance = resonance
```

### File: audio_stream_player_2d.gd
```gdscript
extends AudioStreamPlayer2D

@export_group("Audio Stream Properties")
@export var stream: AudioStream
@export var autoplay: bool = false
@export var loop: bool = false
@export var volume: float = 0.0
@export var pitch_scale: float = 1.0

@export_group("Position Properties")
@export var position: Vector2 = Vector2.ZERO
@export var max_distance: float = 1000.0
@export var attenuation: float = 0.5

@export_group("Effect Properties")
@export var filter_enabled: bool = false
@export var filter_cutoff: float = 22050.0
@export var filter_resonance: float = 1.0

func _ready() -> void:
    # Set up the audio stream player
    if stream:
        stream = stream
    
    if autoplay:
        play()
    
    volume_db = volume
    pitch_scale = pitch_scale
    position = position
    max_distance = max_distance
    attenuation = attenuation

func _process(delta: float) -> void:
    # Update position
    position = position

func play_audio() -> void:
    # Play the audio
    play()

func pause_audio() -> void:
    # Pause the audio
    pause()

func stop_audio() -> void:
    # Stop the audio
    stop()

func set_volume(volume: float) -> void:
    # Set the volume
    volume_db = volume

func set_pitch_scale(pitch_scale: float) -> void:
    # Set the pitch scale
    pitch_scale = pitch_scale

func set_position(position: Vector2) -> void:
    # Set the position
    position = position

func set_max_distance(max_distance: float) -> void:
    # Set the max distance
    max_distance = max_distance

func set_attenuation(attenuation: float) -> void:
    # Set the attenuation
    attenuation = attenuation
```

### File: audio_stream_player_3d.gd
```gdscript
extends AudioStreamPlayer3D

@export_group("Audio Stream Properties")
@export var stream: AudioStream
@export var autoplay: bool = false
@export var loop: bool = false
@export var volume: float = 0.0
@export var pitch_scale: float = 1.0

@export_group("Position Properties")
@export var position: Vector3 = Vector3.ZERO
@export var max_distance: float = 1000.0
@export var attenuation: float = 0.5
@export var unit_db: float = 0.0

@export_group("Effect Properties")
@export var filter_enabled: bool = false
@export var filter_cutoff: float = 22050.0
@export var filter_resonance: float = 1.0

func _ready() -> void:
    # Set up the audio stream player
    if stream:
        stream = stream
    
    if autoplay:
        play()
    
    volume_db = volume
    pitch_scale = pitch_scale
    position = position
    max_distance = max_distance
    attenuation = attenuation
    unit_db = unit_db

func _process(delta: float) -> void:
    # Update position
    position = position

func play_audio() -> void:
    # Play the audio
    play()

func pause_audio() -> void:
    # Pause the audio
    pause()

func stop_audio() -> void:
    # Stop the audio
    stop()

func set_volume(volume: float) -> void:
    # Set the volume
    volume_db = volume

func set_pitch_scale(pitch_scale: float) -> void:
    # Set the pitch scale
    pitch_scale = pitch_scale

func set_position(position: Vector3) -> void:
    # Set the position
    position = position

func set_max_distance(max_distance: float) -> void:
    # Set the max distance
    max_distance = max_distance

func set_attenuation(attenuation: float) -> void:
    # Set the attenuation
    attenuation = attenuation

func set_unit_db(unit_db: float) -> void:
    # Set the unit db
    unit_db = unit_db
```

### File: audio_bus.gd
```gdscript
extends AudioBus

@export_group("Audio Bus Properties")
@export var bus_name: String = "Master"
@export var volume: float = 0.0
@export var solo: bool = false
@export var mute: bool = false

@export_group("Effect Properties")
@export var filter_enabled: bool = false
@export var filter_cutoff: float = 22050.0
@export var filter_resonance: float = 1.0

func _ready() -> void:
    # Set up the audio bus
    volume_db = volume
    solo = solo
    mute = mute

func _process(delta: float) -> void:
    # Update the audio bus

func set_volume(volume: float) -> void:
    # Set the volume
    volume_db = volume

func set_solo(solo: bool) -> void:
    # Set the solo
    solo = solo

func set_mute(mute: bool) -> void:
    # Set the mute
    mute = mute

func set_filter(cutoff: float, resonance: float) -> void:
    # Set the filter
    filter_enabled = true
    filter_cutoff = cutoff
    filter_resonance = resonance
```

## Unusual Things

### Audio Buses
- **Organization**: Audio buses help organize audio
- **Effects**: Audio buses support effects
- **Mixers**: Audio buses support mixers
- **Performance Cost**: Audio buses have a performance cost

### Audio Effects
- **Filter**: Audio effects support filtering
- **Reverb**: Audio effects support reverb
- **Delay**: Audio effects support delay
- **Performance Cost**: Audio effects have a performance cost

### Audio Mixers
- **Mixing**: Audio mixers allow mixing audio
- **Performance Cost**: Audio mixers have a performance cost
- **Complexity**: Audio mixers can be complex

## Recommendations

### For Audio Players
- **Use AudioStreamPlayer**: Always use `AudioStreamPlayer` for playing audio
- **Use AudioStreamPlayer2D**: Use `AudioStreamPlayer2D` for 2D audio
- **Use AudioStreamPlayer3D**: Use `AudioStreamPlayer3D` for 3D audio
- **Test in Editor**: Always test audio in the editor

### For Audio Buses
- **Organize Audio**: Organize audio in audio buses
- **Use AudioBus**: Use `AudioBus` for audio bus processing
- **Test in Editor**: Always test audio in the editor

### For Audio Effects
- **Use Filter**: Use filter for audio processing
- **Use Reverb**: Use reverb for audio processing
- **Use Delay**: Use delay for audio processing
- **Test in Editor**: Always test audio in the editor

## Prohibitions

### Performance Issues
- **Too Many Audio**: Avoid using too many audio without optimization
- **Complex Buses**: Avoid using complex audio buses without optimization
- **Unbounded Effects**: Avoid creating unbounded audio effects
- **Unbounded Mixers**: Avoid creating unbounded audio mixers

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Audio Players
- **Incorrect Audio**: Incorrect audio can cause audio to sound incorrect
- **Performance Issues**: Too many audio can cause performance issues
- **Memory Usage**: Audio can cause memory usage issues

### Audio Buses
- **Organization**: Audio buses help organize audio
- **Performance Issues**: Complex audio buses can cause performance issues
- **Memory Issues**: Audio buses can cause memory issues

### Audio Effects
- **Filter**: Audio effects support filtering
- **Reverb**: Audio effects support reverb
- **Delay**: Audio effects support delay
- **Performance Issues**: Complex audio effects can cause performance issues

## ELI5: Audio Players

Imagine you have a bunch of recorded sounds. You want to play these sounds at specific times, at specific volumes, and at specific pitches. AudioStreamPlayer is like a sound player that can play these audio streams.

### Example: Using Audio Players
```gdscript
extends AudioStreamPlayer

func _ready() -> void:
    # Create an audio stream player
    var audio_stream_player = AudioStreamPlayer.new()
    add_child(audio_stream_player)
    
    # Load an audio stream
    var stream = load("res://audio/sound.ogg")
    audio_stream_player.stream = stream
    
    # Set the volume
    audio_stream_player.volume_db = 0.0
    
    # Set the pitch scale
    audio_stream_player.pitch_scale = 1.0
    
    # Play the audio
    audio_stream_player.play()
```

## ELI5: Audio Buses

Imagine you have a bunch of recorded sounds and you want to organize them in different groups. AudioBus is like a system that can organize audio in different groups.

### Example: Using Audio Buses
```gdscript
extends AudioBus

func _ready() -> void:
    # Create an audio bus
    var audio_bus = AudioBus.new()
    add_child(audio_bus)
    
    # Set the bus name
    audio_bus.bus_name = "Master"
    
    # Set the volume
    audio_bus.volume_db = 0.0
    
    # Set the solo
    audio_bus.solo = false
    
    # Set the mute
    audio_bus.mute = false
```

## ELI5: Audio Effects

Imagine you have a recorded sound and you want to process it. Audio effects are like tools that can process audio.

### Example: Using Audio Effects
```gdscript
extends AudioStreamPlayer

func _ready() -> void:
    # Create an audio stream player
    var audio_stream_player = AudioStreamPlayer.new()
    add_child(audio_stream_player)
    
    # Load an audio stream
    var stream = load("res://audio/sound.ogg")
    audio_stream_player.stream = stream
    
    # Set the filter
    audio_stream_player.set_filter(22050.0, 1.0)
    
    # Play the audio
    audio_stream_player.play()
```

## Best Practices Summary

1. **Use AudioStreamPlayer** for playing audio
2. **Use AudioStreamPlayer2D** for 2D audio
3. **Use AudioStreamPlayer3D** for 3D audio
4. **Organize Audio** in audio buses
5. **Use AudioBus** for audio bus processing
6. **Use Filter** for audio processing
7. **Use Reverb** for audio processing
8. **Use Delay** for audio processing
9. **Test in Editor** for proper setup
10. **Always clean up** unused nodes to prevent memory leaks
