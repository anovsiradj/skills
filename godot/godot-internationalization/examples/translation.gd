extends Control
## Changing locale at runtime and refreshing UI text.

@onready var label: Label = $Label

func _ready() -> void:
	# Locale from OS by default; override for language selection.
	TranslationServer.set_locale("es_ES")
	refresh_text()

func set_language(locale: String) -> void:
	TranslationServer.set_locale(locale)
	refresh_text()

func refresh_text() -> void:
	label.text = tr("KEY_GREETING").format(["Player1"])
	print("Current locale: ", TranslationServer.get_locale())
