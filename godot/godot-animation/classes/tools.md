# Animation Tools
Creating movement and transitions.

### Key Classes
- `AnimationPlayer`: The main timeline for keyframing properties.
- `AnimationTree`: Advanced blending (e.g., blending a walk and run cycle).
- `AnimationLibrary`: Groups of animations for reuse.

### Interpolation Modes
- `Linear`: Constant speed.
- `Cubic`: Smooth acceleration/deceleration (natural).
- `Nearest`: Instant jump (best for visibility toggles).

### The RESET Track
Always ensure your `AnimationPlayer` has a `RESET` animation. This stores the default state of all animated properties so the game starts from a known position.
