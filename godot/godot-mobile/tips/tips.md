# Mobile Development Tips

### Naming Convention
In Android plugins, the function names in Java/Kotlin must match the GDScript call **exactly**. Godot does not automatically convert `snake_case` to `camelCase`.

### Plugin Architecture
Godot 4.2+ uses **v2 Architecture**. Avoid tutorials using `.gdap` files (v1), as they are deprecated.

### Testing
Always test on actual hardware. Emulators often fail to correctly simulate mobile-specific GPU drivers or native plugin behavior.
