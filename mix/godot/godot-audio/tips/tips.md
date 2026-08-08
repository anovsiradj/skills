# Audio Tips

### Web Export Limitations
Web exports have limited audio support.
**Tip**:
- Use **OGG Vorbis** format for the best browser compatibility.
- **MP3** and **WAV** are not reliably supported in browsers.

### File Format Choice
- **WAV**: Uncompressed. Use for short sound effects (low latency).
- **OGG**: Compressed. Use for long background music (saves memory).

### The "Machine Gun" Effect
Playing the exact same sound effect rapidly (like footsteps) sounds unnatural.
**Fix**: Always slightly randomize the `pitch_scale` (e.g. between 0.9 and 1.1) on every playback.

### 3D Audio Listeners
If you can't hear your `AudioStreamPlayer3D`, check that you have an `AudioListener3D` in the scene (usually attached to the camera). Only one listener can be active at a time.

### Bus Routing
- Route streams to dedicated buses (Music, SFX, Voice) for independent volume control and effects.
- Use `AudioServer.get_bus_index()` to look up buses by name — always check for `-1`.

### Effects
Use `AudioEffect` resources (reverb, EQ, delay, compressor) assigned to a bus in the Audio tab.
**Tip**: Reverb on a "Voice" bus makes dialogue feel spatial without per-node setup.

### Streaming vs Preload
- **Preload** short sounds with `preload()` or set the stream in the inspector.
- Use **streaming** for long music tracks to keep memory usage low (enable `stream` on the player or use `AudioStreamOggVorbis` with `loop`).
