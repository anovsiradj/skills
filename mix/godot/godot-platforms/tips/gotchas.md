# Platform Gotchas

### The Web Wall
**Crucial**: Only the **Compatibility** renderer works on the Web. If you use Forward+ or Mobile, your game will not load in a browser. The Web Editor is **not recommended for production** and only supports the Compatibility renderer.

### Mobile Permissions
Android and iOS will crash if you try to use the Camera or Microphone without adding the corresponding permission in the Export preset settings.

### SDK Versions
Always ensure your Android SDK version matches what is required by the Godot Export Templates.

### Web Editor Limitations
The Web Editor is in a preliminary stage and does not support:
- C#/Mono
- GDExtension
- Debugging
- Project exporting
- Lightmap baking

For production use, always export from the native Godot editor.
