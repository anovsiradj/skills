---
name: godot-internationalization
description: Godot Engine internationalization (i18n), localization, and Unicode support.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Internationalization (i18n)

## Key Insights
- **Localization Table**: Store translations in CSV or gettext formats.
- **Dynamic Translation**: Use the `tr()` function to translate a string on the fly.
- **Bidi Support**: Full support for right-to-left (RTL) languages like Arabic or Hebrew.

## Major Version Differences (3.x vs 4.x)
- **UI Mirroring**: Godot 4 has improved automatic UI mirroring for RTL locales, making it easier to flip the entire layout for different languages.

## Weird/Unusual Things
- **Pseudolocalization**: A special mode that replaces characters with similar-looking ones to test if your UI can handle longer texts before you actually translate it.

## Recommendations
- **Avoid Hardcoding**: Never put user-facing text directly in a label. Use a key like `KEY_START_GAME` and translate it.
- **System Fonts**: Use system font fallbacks to avoid bundling 50 different font files for every language.

## Prohibitions
- Do not assume a fixed text length for buttons; always use containers that can expand.

## ELI5: Localization Keys
Imagine you have a book. Instead of writing "Hello" in every chapter, you write `[GREETING]`. 
Then, you have a "Dictionary" at the back of the book:
- English: `[GREETING]` = "Hello"
- Spanish: `[GREETING]` = "Hola"
- French: `[GREETING]` = "Bonjour"
When a player chooses Spanish, the game just looks at the dictionary and replaces every `[GREETING]` with "Hola".

### Example: Using `tr()`
Instead of:
`label.text = "Hello World"`
Use:
`label.text = tr("KEY_HELLO_WORLD")`
Then add `KEY_HELLO_WORLD, Hello World, Hola Mundo` to your translation CSV.

