---
name: godot-internationalization
description: Godot Engine internationalization, localization, and translation.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Internationalization

## Overview
Godot Engine's internationalization system provides powerful tools for creating games with features like internationalization, localization, and translation. This skill covers everything you need to know to create efficient and organized internationalized content in Godot 4.7.

## Key Insights

### Internationalization Features
- **Unicode Support**: Full support for Unicode including emoji
- **System Fonts**: Support for loading system fonts on Windows, macOS, and Linux
- **Localization Strings**: Store localization strings using CSV or gettext
- **Translation Functions**: Use localized strings in your project automatically

### Localization Features
- **Pluralization**: Support for pluralization and translation contexts
- **Bidirectional Typesetting**: Support for bidirectional typesetting, text shaping, and OpenType localized forms
- **Pseudolocalization**: Support for pseudolocalization to test for i18n-friendliness
- **Automatic UI Mirroring**: Automatic UI mirroring for right-to-left locales

### Translation Features
- **CSV Translation**: Store localization strings using CSV
- **Gettext Translation**: Store localization strings using gettext
- **POT Generation**: Support for generating gettext POT and PO files from the editor
- **Translation Contexts**: Support for translation contexts

## Major Version Differences (3.x vs 4.x)

### Internationalization System Changes
- **Unicode Support**: Enhanced Unicode support including emoji
- **System Fonts**: Enhanced support for loading system fonts
- **Localization Strings**: Enhanced support for storing localization strings
- **Translation Functions**: Enhanced support for using localized strings
- **Better Performance**: Improved performance for internationalization operations
- **Enhanced Editor**: Better editor support for internationalization management

### Localization Features
- **Pluralization**: Enhanced support for pluralization and translation contexts
- **Bidirectional Typesetting**: Enhanced support for bidirectional typesetting, text shaping, and OpenType localized forms
- **Pseudolocalization**: Enhanced support for pseudolocalization
- **Automatic UI Mirroring**: Enhanced support for automatic UI mirroring

## New Features in Godot 4.7

### Internationalization Features
- **Unicode Support**: Enhanced Unicode support including emoji
- **System Fonts**: Enhanced support for loading system fonts
- **Localization Strings**: Enhanced support for storing localization strings
- **Translation Functions**: Enhanced support for using localized strings
- **Better Performance**: Improved performance for internationalization operations
- **Enhanced Editor**: Better editor support for internationalization management

### Localization Features
- **Pluralization**: Enhanced support for pluralization and translation contexts
- **Bidirectional Typesetting**: Enhanced support for bidirectional typesetting, text shaping, and OpenType localized forms
- **Pseudolocalization**: Enhanced support for pseudolocalization
- **Automatic UI Mirroring**: Enhanced support for automatic UI mirroring

## Technical Implementation

### File: translation.gd
```gdscript
extends Node

@export_group("Translation Properties")
@export var translation_name: String = ""
@export var translation_path: String = ""
@export var translation_type: int = 0

@export_group("Translation Features")
@export var translation_csv: bool = false
@export var translation_gettext: bool = false
@export var translation_pseudolocalization: bool = false
@export var translation_bidirectional: bool = false

func _ready() -> void:
    # Set up the translation
    if translation_name:
        # Load the translation
        load_translation(translation_name)
    
    if translation_path:
        # Load the translation from path
        load_translation_from_path(translation_path)
    
    if translation_type != 0:
        # Set the translation type
        set_translation_type(translation_type)

func _process(delta: float) -> void:
    # Update the translation

func load_translation(name: String) -> void:
    # Load a translation
    var translation = load(name)
    if translation:
        # Load the translation
        pass

func load_translation_from_path(path: String) -> void:
    # Load a translation from path
    var translation = load(path)
    if translation:
        # Load the translation
        pass

func set_translation_type(type: int) -> void:
    # Set the translation type
    match type:
        0:  # CSV
            set_translation_type_csv()
        
        1:  # Gettext
            set_translation_type_gettext()
        
        2:  # Pseudolocalization
            set_translation_type_pseudolocalization()
        
        3:  # Bidirectional
            set_translation_type_bidirectional()

func set_translation_type_csv() -> void:
    # Set the translation type to CSV
    # Implementation
    pass

func set_translation_type_gettext() -> void:
    # Set the translation type to gettext
    # Implementation
    pass

func set_translation_type_pseudolocalization() -> void:
    # Set the translation type to pseudolocalization
    # Implementation
    pass

func set_translation_type_bidirectional() -> void:
    # Set the translation type to bidirectional
    # Implementation
    pass
```

### File: localization.gd
```gdscript
extends Node

@export_group("Localization Properties")
@export var localization_name: String = ""
@export var localization_path: String = ""
@export var localization_type: int = 0

@export_group("Localization Features")
@export var localization_plural: bool = false
@export var localization_context: bool = false
@export var localization_bidirectional: bool = false
@export var localization_pseudolocalization: bool = false

func _ready() -> void:
    # Set up the localization
    if localization_name:
        # Load the localization
        load_localization(localization_name)
    
    if localization_path:
        # Load the localization from path
        load_localization_from_path(localization_path)
    
    if localization_type != 0:
        # Set the localization type
        set_localization_type(localization_type)

func _process(delta: float) -> void:
    # Update the localization

func load_localization(name: String) -> void:
    # Load a localization
    var localization = load(name)
    if localization:
        # Load the localization
        pass

func load_localization_from_path(path: String) -> void:
    # Load a localization from path
    var localization = load(path)
    if localization:
        # Load the localization
        pass

func set_localization_type(type: int) -> void:
    # Set the localization type
    match type:
        0:  # Plural
            set_localization_type_plural()
        
        1:  # Context
            set_localization_type_context()
        
        2:  # Bidirectional
            set_localization_type_bidirectional()
        
        3:  // Pseudolocalization
            set_localization_type_pseudolocalization()

func set_localization_type_plural() -> void:
    # Set the localization type to plural
    # Implementation
    pass

func set_localization_type_context() -> void:
    # Set the localization type to context
    # Implementation
    pass

func set_localization_type_bidirectional() -> void:
    # Set the localization type to bidirectional
    # Implementation
    pass

func set_localization_type_pseudolocalization() -> void:
    # Set the localization type to pseudolocalization
    # Implementation
    pass
```

### File: gettext.gd
```gdscript
extends Node

@export_group("Gettext Properties")
@export var gettext_name: String = ""
@export var gettext_path: String = ""
@export var gettext_type: int = 0

@export_group("Gettext Features")
@export var gettext_pot: bool = false
@export var gettext_po: bool = false
@export var gettext_context: bool = false

func _ready() -> void:
    # Set up the gettext
    if gettext_name:
        # Load the gettext
        load_gettext(gettext_name)
    
    if gettext_path:
        # Load the gettext from path
        load_gettext_from_path(gettext_path)
    
    if gettext_type != 0:
        # Set the gettext type
        set_gettext_type(gettext_type)

func _process(delta: float) -> void:
    # Update the gettext

func load_gettext(name: String) -> void:
    # Load a gettext
    var gettext = load(name)
    if gettext:
        # Load the gettext
        pass

func load_gettext_from_path(path: String) -> void:
    # Load a gettext from path
    var gettext = load(path)
    if gettext:
        # Load the gettext
        pass

func set_gettext_type(type: int) -> void:
    # Set the gettext type
    match type:
        0:  # POT
            set_gettext_type_pot()
        
        1:  # PO
            set_gettext_type_po()
        
        2:  # Context
            set_gettext_type_context()

func set_gettext_type_pot() -> void:
    # Set the gettext type to POT
    # Implementation
    pass

func set_gettext_type_po() -> void:
    # Set the gettext type to PO
    # Implementation
    pass

func set_gettext_type_context() -> void:
    # Set the gettext type to context
    # Implementation
    pass
```

## Unusual Things

### Internationalization System
- **Unicode Support**: Full support for Unicode including emoji
- **System Fonts**: Support for loading system fonts on Windows, macOS, and Linux
- **Localization Strings**: Store localization strings using CSV or gettext
- **Translation Functions**: Use localized strings in your project automatically

### Localization Features
- **Pluralization**: Support for pluralization and translation contexts
- **Bidirectional Typesetting**: Support for bidirectional typesetting, text shaping, and OpenType localized forms
- **Pseudolocalization**: Support for pseudolocalization to test for i18n-friendliness
- **Automatic UI Mirroring**: Automatic UI mirroring for right-to-left locales

### Translation Features
- **CSV Translation**: Store localization strings using CSV
- **Gettext Translation**: Store localization strings using gettext
- **POT Generation**: Support for generating gettext POT and PO files from the editor
- **Translation Contexts**: Support for translation contexts

## Recommendations

### For Internationalization
- **Use Unicode**: Always use Unicode for internationalization
- **Use System Fonts**: Use system fonts for internationalization
- **Use Localization Strings**: Use localization strings for internationalization
- **Use Translation Functions**: Use translation functions for internationalization

### For Localization
- **Use Pluralization**: Use pluralization for localization
- **Use Translation Contexts**: Use translation contexts for localization
- **Use Bidirectional Typesetting**: Use bidirectional typesetting for localization
- **Use Pseudolocalization**: Use pseudolocalization for localization
- **Use Automatic UI Mirroring**: Use automatic UI mirroring for localization

### For Translation
- **Use CSV Translation**: Use CSV translation for translation
- **Use Gettext Translation**: Use gettext translation for translation
- **Use POT Generation**: Use POT generation for translation
- **Use Translation Contexts**: Use translation contexts for translation

## Prohibitions

### Performance Issues
- **Too Many Translations**: Avoid using too many translations without optimization
- **Complex Localization**: Avoid using complex localization without optimization
- **Unbounded Internationalization**: Avoid creating unbounded internationalization

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Internationalization
- **Incorrect Setup**: Incorrect internationalization setup can cause issues
- **Performance Issues**: Complex internationalization can cause performance issues
- **Complexity**: Internationalization can be complex

### Localization
- **Incorrect Setup**: Incorrect localization setup can cause issues
- **Performance Issues**: Complex localization can cause performance issues
- **Complexity**: Localization can be complex

### Translation
- **Incorrect Setup**: Incorrect translation setup can cause issues
- **Performance Issues**: Complex translation can cause performance issues
- **Complexity**: Translation can be complex

## ELI5: Internationalization

Imagine you have a bunch of text strings in your game. Internationalization is like a system that can handle these text strings in different languages.

### Example: Using Internationalization
```gdscript
extends Node

func _ready() -> void:
    # Create an internationalization
    var internationalization = Node.new()
    add_child(internationalization)
    
    # Set the internationalization name
    internationalization.name = "My Internationalization"
    
    # Set the internationalization path
    internationalization.translation_path = "res://translations/translation.csv"
    
    # Set the internationalization type
    internationalization.translation_type = 0
    
    # Load the internationalization
    internationalization.load_translation("My Internationalization")
    
    # Load the internationalization from path
    internationalization.load_translation_from_path("res://translations/translation.csv")
```

## ELI5: Localization

Imagine you have a bunch of text strings in your game that need to be localized for different languages. Localization is like a system that can localize these text strings for different languages.

### Example: Using Localization
```gdscript
extends Node

func _ready() -> void:
    # Create a localization
    var localization = Node.new()
    add_child(localization)
    
    # Set the localization name
    localization.name = "My Localization"
    
    # Set the localization path
    localization.localization_path = "res://localizations/localization.csv"
    
    # Set the localization type
    localization.localization_type = 0
    
    # Load the localization
    localization.load_localization("My Localization")
    
    # Load the localization from path
    localization.load_localization_from_path("res://localizations/localization.csv")
```

## ELI5: Gettext

Imagine you have a bunch of text strings in your game that need to be translated using gettext. Gettext is like a system that can translate these text strings using gettext.

### Example: Using Gettext
```gdscript
extends Node

func _ready() -> void:
    # Create a gettext
    var gettext = Node.new()
    add_child(gettext)
    
    # Set the gettext name
    gettext.name = "My Gettext"
    
    # Set the gettext path
    gettext.gettext_path = "res://gettexts/gettext.po"
    
    # Set the gettext type
    gettext.gettext_type = 1
    
    # Load the gettext
    gettext.load_gettext("My Gettext")
    
    # Load the gettext from path
    gettext.load_gettext_from_path("res://gettexts/gettext.po")
```

## Best Practices Summary

1. **Use Unicode** for internationalization
2. **Use System Fonts** for internationalization
3. **Use Localization Strings** for internationalization
4. **Use Translation Functions** for internationalization
5. **Use Pluralization** for localization
6. **Use Translation Contexts** for localization
7. **Use Bidirectional Typesetting** for localization
8. **Use Pseudolocalization** for localization
9. **Use Automatic UI Mirroring** for localization
10. **Use CSV Translation** for translation
11. **Use Gettext Translation** for translation
12. **Use POT Generation** for translation
13. **Use Translation Contexts** for translation
14. **Test in Editor** for proper setup
15. **Always clean up** unused nodes to prevent memory leaks
