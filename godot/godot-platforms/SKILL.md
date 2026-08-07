---
name: godot-platforms
description: Godot Engine platform support and compatibility guidelines.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Platforms

## Key Insights
- **Universal Reach**: Supports Windows, macOS, Linux, Android, and Web. iOS is export-only.
- **Web Warning**: Godot 4 web support is still evolving. For critical HTML5 projects, Godot 3.x is often recommended.
- **C# Limitations**: C# projects currently cannot be exported to the Web. Android/iOS C# support is experimental (4.2+).

## Weird/Unusual Things
- **Linux Distribution**: Binaries are statically linked to maximize compatibility across various distros.
- **Headless Mode**: Any binary can be run as a server using `--headless`, bypassing GPU/Display requirements.

## Recommendations
- **Targeting Web**: Use GDScript for maximum compatibility.
- **Mobile C#**: Be cautious with experimental support; test frequently on actual hardware.

## Prohibitions
- Do not attempt to export C# projects to Web platforms in Godot 4; it is not supported.

## ELI5: Headless Mode
Imagine you have a robot that can both "think" and "draw pictures". Usually, it uses a big screen to show you what it's doing. "Headless mode" is like telling the robot, "Stop drawing pictures and just think." This saves a lot of energy (CPU/RAM) and is perfect for servers where no one is actually looking at a screen.

### Example: Running a Dedicated Server
Run your exported project from the command line:
`./my_game.exe --headless`

