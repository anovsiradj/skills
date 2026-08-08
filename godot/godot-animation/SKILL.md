---
name: godot-animation
description: Godot Engine animation system, animation trees, and animation players.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Animation

## Overview
The animation system: `AnimationPlayer` for keyframed timelines, `AnimationTree` for blending and state machines, `AnimationLibrary` for reusable animation sets, and `Tween` for simple scripted transitions.

## Key Version Differences (3.x vs 4.x)
- `AnimationPlayer.play()` takes an animation name; playback is non-blocking and continues automatically.
- `AnimationTree` is driven by `AnimationNodeStateMachine` or `AnimationNodeBlendTree` resources assigned to `tree_root`.
- `Tween` API replaces the old `Tween.interpolate_property()` style with chained `tween_property()` calls.
- Always keep a `RESET` animation so the editor can restore default values.

## File Map
| File | Purpose |
|------|---------|
| [classes/tools.md](classes/tools.md) | AnimationPlayer, AnimationTree, libraries |
| [tips/tips.md](tips/tips.md) | Pitfalls: transforms, snap-back, onion skinning |
| [usage/workflow.md](usage/workflow.md) | Keyframing and scripted tweens |
| [examples/tween.gd](examples/tween.gd) | Tween transitions |
| [examples/animation_tree_blend.gd](examples/animation_tree_blend.gd) | Driving a blend tree |

## Quick Start
```gdscript
# Play a named animation on a child AnimationPlayer.
$AnimationPlayer.play("run")

# Simple tween.
var tween := create_tween()
tween.tween_property(self, "modulate:a", 0.0, 1.0)
```
