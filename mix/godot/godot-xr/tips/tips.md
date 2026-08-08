# XR Performance & Stability

### Motion Sickness & V-Sync
**Critical**: Disable V-Sync. If the frame rate is capped by the monitor instead of the headset's refresh rate, the user will experience severe motion sickness.

### Physics Tick Rate
The default 60Hz physics can feel "choppy" in VR. 
**Fix**: Increase `Engine.physics_ticks_per_second` to match the headset (e.g., 90 or 144).

### Stereoscopic Rendering
Be careful with post-processing effects. Some screen-space effects do not support stereoscopic rendering and will look wrong or "flat" in the headset.
