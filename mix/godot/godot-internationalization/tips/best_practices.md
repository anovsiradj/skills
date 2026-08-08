# i18n Best Practices

### UI Overflow
Different languages have different lengths (e.g., German words are often longer than English).
**Prohibition**: Never use fixed-width buttons for text. Use **Containers** (HBox, VBox) so the UI can expand automatically.

### Font Support
Ensure your chosen font supports all target languages.
**Tip**: Use a Unicode font or load a specific `.ttf` file for CJK (Chinese, Japanese, Korean) languages.

### Right-to-Left (RTL)
For languages like Arabic or Hebrew, use the built-in UI mirroring features in Godot 4 to flip the entire layout.
