# Animation Pitfalls

### Transform Inheritance
**Prohibition**: Do not add nodes with transforms (like `Sprite2D`) as direct children of an `AnimationPlayer`. The `AnimationPlayer` is a plain `Node`, not a `Node2D/3D`, so children will not inherit transforms correctly.

### The "Snap Back" Effect
If you animate a property and then change that same property in the editor, the animation will force the value back to the keyed value as soon as it starts playing.

### Tip: Onion Skinning
Enable the **Onion Skinning** icon in the animation timeline to see previous and future frames while you are keyframing.
