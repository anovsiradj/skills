# Localization Workflow
Creating a multilingual game.

### Steps
1. **Create CSV**: Make a spreadsheet with columns: `id`, `en`, `es`, `fr`.
   - Example: `KEY_START,Start,Comenzar,Commencer`
2. **Import**: Save as CSV and place in `res://`. Godot generates `.translation` files.
3. **Assign**: Add these files to `Project Settings` -> `Localization`.
4. **Implement**: Replace all hardcoded text with `tr("KEY")`.

### Using Placeholders
To handle dynamic text in different languages:
CSV: `KEY_GREETING,Hello %s!,Hola %s!`
Code: `tr("KEY_GREETING").format(["Player1"])`
