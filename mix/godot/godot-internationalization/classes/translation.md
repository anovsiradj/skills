# TranslationServer
Managing game languages.

### Key Functions
- `TranslationServer.set_locale("en_US")`: Changes the language.
- `tr("KEY")`: Translates the string based on the current locale.

### Dynamic Translation
If you change the locale at runtime, `tr()` will return the new language immediately, but you must manually update existing labels.
`label.text = tr("WELCOME")`
