# Android Plugin Workflow
Integrating native Java/Kotlin code.

### Setup
1. Create an Android library module.
2. Extend the `GodotPlugin` base class.
3. Annotate methods with `@UsedByGodot`.
4. Register the plugin in `AndroidManifest.xml`.

### Exporting
Ensure the **Gradle build process** is enabled in the Android export preset in Godot 4.
