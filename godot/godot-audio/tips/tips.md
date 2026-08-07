# Audio Tips

### Web Export Limitations
- **Description**: Web exports have limited audio support.
- **Tip**:
  - Use **OGG Vorbis** format for better compatibility.
  - Avoid **MP3** and **WAV** formats, as they are not supported in browsers.
  - Use **Web Audio API** for advanced audio features.

### File Format Choice
- **WAV**: Uncompressed. Use for short sound effects (low latency).
- **OGG**: Compressed. Use for long background music (saves memory).

### The "Machine Gun" Effect
Playing the exact same sound effect rapidly (like footsteps) sounds unnatural.
**Fix**: Always slightly randomize the `pitch_scale` (e.g., between 0.9 and 1.1) for every playback.

### 3D Audio Listeners
If you can't hear your `AudioStreamPlayer3D`, check if you have an `AudioListener3D` in your scene (usually attached to the Camera). Only one listener can be active at a time.

### Audio Player
- **Description**: Use AudioPlayer for playing audio files.
- **Tip**:
  - **Preload Audio**: Preload audio files to avoid playback delays.
  - **Streaming**: Use streaming for large audio files to reduce memory usage.
  - **Looping**: Enable looping for background music.

### Audio Stream Player
- **Description**: Use AudioStreamPlayer for streaming audio.
- **Tip**:
  - **Buffer Management**: Manage buffer sizes to avoid stuttering.
  - **Seeking**: Use `seek()` to jump to specific points in the audio stream.

### Audio Bus
- **Description**: Use AudioBus to manage audio routing.
- **Tip**:
  - **Routing**: Route audio streams to different buses for better control.
  - **Volume Control**: Adjust volume per bus for balanced audio.

### Audio Effect
- **Description**: Use AudioEffect for audio processing.
- **Tip**:
  - **Reverb**: Use reverb effects for spatial audio.
  - **EQ**: Apply equalization for audio tuning.
  - **Delay**: Use delay effects for echo.

### Audio Stream
- **Description**: Use AudioStream for custom audio processing.
- **Tip**:
  - **Custom Processing**: Implement custom audio processing logic.
  - **Dynamic Loading**: Load audio streams dynamically.

### Audio Stream MP3
- **Description**: Use AudioStreamMP3 for MP3 audio files.
- **Tip**:
  - **Compatibility**: Ensure MP3 files are encoded correctly for compatibility.
  - **Bitrate**: Use appropriate bitrates for quality and size balance.

### Audio Stream OGG
- **Description**: Use AudioStreamOGG for OGG Vorbis audio files.
- **Tip**:
  - **Quality**: Use high-quality OGG Vorbis encoding for better sound.
  - **Size**: Compress OGG files to reduce size without significant quality loss.

### Audio Stream WAV
- **Description**: Use AudioStreamWAV for WAV audio files.
- **Tip**:
  - **Uncompressed**: Use uncompressed WAV for high-quality audio.
  - **Format**: Ensure WAV files are in the correct format for compatibility.

### Audio Stream Sample
- **Description**: Use AudioStreamSample for sample-based audio.
- **Tip**:
  - **Sampling Rate**: Use appropriate sampling rates for different audio needs.
  - **Bit Depth**: Use higher bit depths for better audio quality.

### Audio Stream Mixer
- **Description**: Use AudioStreamMixer for mixing audio streams.
- **Tip**:
  - **Mixing**: Mix multiple audio streams for complex audio scenes.
  - **Volume Automation**: Automate volume changes for dynamic audio.

### Audio Stream Generator
- **Description**: Use AudioStreamGenerator for generating audio dynamically.
- **Tip**:
  - **Synthesis**: Use for synthesizing sounds like music or effects.
  - **Performance**: Optimize generator code for performance.

### Audio Server
- **Description**: Use AudioServer for managing audio globally.
- **Tip**:
  - **Initialization**: Initialize AudioServer early in the game lifecycle.
  - **Error Handling**: Handle audio initialization errors gracefully.

### Audio Stream Player 3D
- **Description**: Use AudioStreamPlayer3D for 3D audio.
- **Tip**:
  - **Positioning**: Use `position` and `velocity` for spatial audio effects.
  - **Distance Model**: Use appropriate distance models for realistic 3D audio.

### Audio Bus 3D
- **Description**: Use AudioBus3D for managing 3D audio buses.
- **Tip**:
  - **Routing**: Route 3D audio streams to appropriate buses.
  - **Doppler Effect**: Enable Doppler effect for realistic sound movement.

### Audio Stream 3D
- **Description**: Use AudioStream3D for custom 3D audio processing.
- **Tip**:
  - **Custom Processing**: Implement custom 3D audio processing logic.
  - **Performance**: Optimize 3D audio processing for performance.

### Audio Stream Spatializer
- **Description**: Use AudioStreamSpatializer for spatial audio processing.
- **Tip**:
  - **Spatialization**: Use for advanced spatial audio effects.
  - **Performance**: Ensure spatialization is optimized for performance.

### Audio Stream Spatializer 3D
- **Description**: Use AudioStreamSpatializer3D for 3D spatial audio processing.
- **Tip**:
  - **3D Spatialization**: Use for realistic 3D spatial audio effects.
  - **Performance**: Optimize 3D spatialization for performance.