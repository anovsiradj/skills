# Animation Pitfalls

### Animating the Right Node
An `AnimationPlayer` animates **other** nodes by node path — it does not need to be the parent of the nodes it animates. Keep `AnimationPlayer` as a sibling (e.g. under the character root) and reference children by `%UniqueName` or node path.

### The "Snap Back" Effect
If you animate a property and then change that same property in the editor, the animation will force the value back to the keyed value as soon as it starts playing.
**Fix**: Use the **RESET** animation to store defaults, and key the property where you actually want it.

### Tip: Onion Skinning
Enable the **Onion Skinning** icon in the animation timeline to see previous and future frames while you are keyframing.
