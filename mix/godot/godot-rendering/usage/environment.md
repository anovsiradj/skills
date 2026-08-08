# WorldEnvironment
The `WorldEnvironment` node is where you control the overall "look" of your scene.

### Key properties
- **Ambient Light**: Sets the base light level of the scene.
- **Background**: Choose between Sky, Color, or Custom Color.
- **Glow**: Makes bright areas "bleed" light into darker areas.
- **Tonemapping**: Changes how high-dynamic-range colors are mapped to your screen (e.g., ACES is common for cinematic looks).

### Example: Enabling Glow
1. Add `WorldEnvironment`.
2. Create a `New Environment` resource.
3. Set `Background Mode` to `Sky`.
4. Enable `Glow` and set `Intensity` to `1.0`.
5. Ensure your materials have an emission value > 1.0.
