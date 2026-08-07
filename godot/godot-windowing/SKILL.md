---
name: godot-windowing
description: Godot Engine window management and OS integration.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Windowing and OS Integration

## Key Insights
- **Multi-Window**: Ability to spawn multiple independent windows in one process.
- **Overlays**: Support for transparent windows and polygon-based mouse passthrough.
- **Headless**: Run as a server using `--headless` to save resources.

## Major Version Differences (3.x vs 4.x)
- **Window Management**: Godot 4 completely overhauled window handling, allowing for much better multi-window support and a new way to handle fullscreen/borderless modes.

## Weird/Unusual Things
- **Attention Request**: Can make the taskbar icon blink to alert the user.
- **Exclusive Fullscreen**: An optional mode on Windows to reduce input lag at the cost of slower Alt-Tabbing.

## Recommendations
- **Performance**: Use borderless fullscreen for the best balance of performance and usability on Windows.
- **Tooling**: Use the `--headless` flag for CI/CD pipelines and dedicated servers.

## Prohibitions
- Do not create too many independent windows; some OS/Drivers handle this poorly and it can lead to crashes.

## ELI5: Transparent Windows
Imagine your game is a ghost. Normally, games are like big rectangular boxes that cover everything. A transparent window is like making the box invisible, but keeping the "ghost" characters visible. This lets you put a game character right on the user's desktop, and when the user clicks "through" the ghost, they are actually clicking the folder on their desktop.

### Example: Making a Window Transparent
In `Project Settings` -> `Display` -> `Window`:
1. Enable `Transparent`
2. Enable `Borderless`
In script:
`get_window().transparent = true`

