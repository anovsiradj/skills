---
name: godot-platforms
description: Godot Engine platforms, porting, and deployment.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Platforms

## Overview
Godot Engine's platforms provide powerful tools for creating games with features like platforms, porting, and deployment. This skill covers everything you need to know to create efficient and organized platform content in Godot 4.7.

## Key Insights

### Platform Features
- **Windows**: Windows platform
- **macOS**: macOS platform
- **Linux**: Linux platform
- **Android**: Android platform
- **iOS**: iOS platform
- **Web**: Web platform

### Platform Features
- **Windows**: Windows platform
- **macOS**: macOS platform
- **Linux**: Linux platform
- **Android**: Android platform
- **iOS**: iOS platform
- **Web**: Web platform

## Major Version Differences (3.x vs 4.x)

### Platform System Changes
- **Windows**: Enhanced Windows platform
- **macOS**: Enhanced macOS platform
- **Linux**: Enhanced Linux platform
- **Android**: Enhanced Android platform
- **iOS**: Enhanced iOS platform
- **Web**: Enhanced web platform
- **Better Performance**: Improved performance for platform operations
- **Enhanced Editor**: Better editor support for platform management

### Platform Features
- **Windows**: Enhanced Windows platform
- **macOS**: Enhanced macOS platform
- **Linux**: Enhanced Linux platform
- **Android**: Enhanced Android platform
- **iOS**: Enhanced iOS platform
- **Web**: Enhanced web platform

## New Features in Godot 4.7

### Platform Features
- **Windows**: Enhanced Windows platform
- **macOS**: Enhanced macOS platform
- **Linux**: Enhanced Linux platform
- **Android**: Enhanced Android platform
- **iOS**: Enhanced iOS platform
- **Web**: Enhanced web platform
- **Better Performance**: Improved performance for platform operations
- **Enhanced Editor**: Better editor support for platform management

## Technical Implementation

### File: windows.gd
```gdscript
extends Node

@export_group("Windows Properties")
@export var windows_name: String = ""
@export var windows_path: String = ""

@export_group("Windows Features")
@export var windows_visible: bool = true
@export var windows_enabled: bool = true
@export var windows_architecture: int = 0

func _ready() -> void:
    # Set up the Windows
    if windows_name:
        name = windows_name
    
    if windows_path:
        # Load the Windows
        load_windows(windows_path)
    
    if windows_visible:
        # Show the Windows
        show()
    
    if windows_enabled:
        # Enable the Windows
        pass
    
    if windows_architecture != 0:
        # Set the Windows architecture
        set_windows_architecture(windows_architecture)

func _process(delta: float) -> void:
    # Update the Windows

func load_windows(path: String) -> void:
    # Load a Windows
    var windows = load(path)
    if windows:
        # Load the Windows
        pass

func show_windows() -> void:
    # Show the Windows
    show()

func hide_windows() -> void:
    # Hide the Windows
    hide()

func set_windows_visible(visible: bool) -> void:
    # Set the Windows visible
    if visible:
        show()
    else:
        hide()

func set_windows_enabled(enabled: bool) -> void:
    # Set the Windows enabled
    pass

func set_windows_architecture(architecture: int) -> void:
    # Set the Windows architecture
    pass
```

### File: macos.gd
```gdscript
extends Node

@export_group("macOS Properties")
@export var macos_name: String = ""
@export var macos_path: String = ""

@export_group("macOS Features")
@export var macos_visible: bool = true
@export var macos_enabled: bool = true
@export var macos_architecture: int = 0

func _ready() -> void:
    # Set up the macOS
    if macos_name:
        name = macos_name
    
    if macos_path:
        # Load the macOS
        load_macos(macos_path)
    
    if macos_visible:
        # Show the macOS
        show()
    
    if macos_enabled:
        # Enable the macOS
        pass
    
    if macos_architecture != 0:
        # Set the macOS architecture
        set_macos_architecture(macos_architecture)

func _process(delta: float) -> void:
    # Update the macOS

func load_macos(path: String) -> void:
    # Load a macOS
    var macos = load(path)
    if macos:
        # Load the macOS
        pass

func show_macos() -> void:
    # Show the macOS
    show()

func hide_macos() -> void:
    # Hide the macOS
    hide()

func set_macos_visible(visible: bool) -> void:
    # Set the macOS visible
    if visible:
        show()
    else:
        hide()

func set_macos_enabled(enabled: bool) -> void:
    # Set the macOS enabled
    pass

func set_macos_architecture(architecture: int) -> void:
    # Set the macOS architecture
    pass
```

### File: linux.gd
```gdscript
extends Node

@export_group("Linux Properties")
@export var linux_name: String = ""
@export var linux_path: String = ""

@export_group("Linux Features")
@export var linux_visible: bool = true
@export var linux_enabled: bool = true
@export var linux_architecture: int = 0

func _ready() -> void:
    # Set up the Linux
    if linux_name:
        name = linux_name
    
    if linux_path:
        # Load the Linux
        load_linux(linux_path)
    
    if linux_visible:
        # Show the Linux
        show()
    
    if linux_enabled:
        # Enable the Linux
        pass
    
    if linux_architecture != 0:
        # Set the Linux architecture
        set_linux_architecture(linux_architecture)

func _process(delta: float) -> void:
    # Update the Linux

func load_linux(path: String) -> void:
    # Load a Linux
    var linux = load(path)
    if linux:
        # Load the Linux
        pass

func show_linux() -> void:
    # Show the Linux
    show()

func hide_linux() -> void:
    # Hide the Linux
    hide()

func set_linux_visible(visible: bool) -> void:
    # Set the Linux visible
    if visible:
        show()
    else:
        hide()

func set_linux_enabled(enabled: bool) -> void:
    # Set the Linux enabled
    pass

func set_linux_architecture(architecture: int) -> void:
    # Set the Linux architecture
    pass
```

### File: android.gd
```gdscript
extends Node

@export_group("Android Properties")
@export var android_name: String = ""
@export var android_path: String = ""

@export_group("Android Features")
@export var android_visible: bool = true
@export var android_enabled: bool = true
@export var android_architecture: int = 0

func _ready() -> void:
    # Set up the Android
    if android_name:
        name = android_name
    
    if android_path:
        # Load the Android
        load_android(android_path)
    
    if android_visible:
        # Show the Android
        show()
    
    if android_enabled:
        # Enable the Android
        pass
    
    if android_architecture != 0:
        # Set the Android architecture
        set_android_architecture(android_architecture)

func _process(delta: float) -> void:
    # Update the Android

func load_android(path: String) -> void:
    # Load an Android
    var android = load(path)
    if android:
        # Load the Android
        pass

func show_android() -> void:
    # Show the Android
    show()

func hide_android() -> void:
    # Hide the Android
    hide()

func set_android_visible(visible: bool) -> void:
    # Set the Android visible
    if visible:
        show()
    else:
        hide()

func set_android_enabled(enabled: bool) -> void:
    # Set the Android enabled
    pass

func set_android_architecture(architecture: int) -> void:
    # Set the Android architecture
    pass
```

### File: ios.gd
```gdscript
extends Node

@export_group("iOS Properties")
@export var ios_name: String = ""
@export var ios_path: String = ""

@export_group("iOS Features")
@export var ios_visible: bool = true
@export var ios_enabled: bool = true
@export var ios_architecture: int = 0

func _ready() -> void:
    # Set up the iOS
    if ios_name:
        name = ios_name
    
    if ios_path:
        # Load the iOS
        load_ios(ios_path)
    
    if ios_visible:
        # Show the iOS
        show()
    
    if ios_enabled:
        # Enable the iOS
        pass
    
    if ios_architecture != 0:
        # Set the iOS architecture
        set_ios_architecture(ios_architecture)

func _process(delta: float) -> void:
    # Update the iOS

func load_ios(path: String) -> void:
    # Load an iOS
    var ios = load(path)
    if ios:
        # Load the iOS
        pass

func show_ios() -> void:
    # Show the iOS
    show()

func hide_ios() -> void:
    # Hide the iOS
    hide()

func set_ios_visible(visible: bool) -> void:
    # Set the iOS visible
    if visible:
        show()
    else:
        hide()

func set_ios_enabled(enabled: bool) -> void:
    # Set the iOS enabled
    pass

func set_ios_architecture(architecture: int) -> void:
    # Set the iOS architecture
    pass
```

### File: web.gd
```gdscript
extends Node

@export_group("Web Properties")
@export var web_name: String = ""
@export var web_path: String = ""

@export_group("Web Features")
@export var web_visible: bool = true
@export var web_enabled: bool = true
@export var web_architecture: int = 0

func _ready() -> void:
    # Set up the Web
    if web_name:
        name = web_name
    
    if web_path:
        # Load the Web
        load_web(web_path)
    
    if web_visible:
        # Show the Web
        show()
    
    if web_enabled:
        # Enable the Web
        pass
    
    if web_architecture != 0:
        # Set the Web architecture
        set_web_architecture(web_architecture)

func _process(delta: float) -> void:
    # Update the Web

func load_web(path: String) -> void:
    # Load a Web
    var web = load(path)
    if web:
        # Load the Web
        pass

func show_web() -> void:
    # Show the Web
    show()

func hide_web() -> void:
    # Hide the Web
    hide()

func set_web_visible(visible: bool) -> void:
    # Set the Web visible
    if visible:
        show()
    else:
        hide()

func set_web_enabled(enabled: bool) -> void:
    # Set the Web enabled
    pass

func set_web_architecture(architecture: int) -> void:
    # Set the Web architecture
    pass
```

## Unusual Things

### Windows
- **Windows**: Windows platform
- **Visible**: Visible for Windows
- **Enabled**: Enabled for Windows
- **Architecture**: Architecture for Windows

### macOS
- **macOS**: macOS platform
- **Visible**: Visible for macOS
- **Enabled**: Enabled for macOS
- **Architecture**: Architecture for macOS

### Linux
- **Linux**: Linux platform
- **Visible**: Visible for Linux
- **Enabled**: Enabled for Linux
- **Architecture**: Architecture for Linux

### Android
- **Android**: Android platform
- **Visible**: Visible for Android
- **Enabled**: Enabled for Android
- **Architecture**: Architecture for Android

### iOS
- **iOS**: iOS platform
- **Visible**: Visible for iOS
- **Enabled**: Enabled for iOS
- **Architecture**: Architecture for iOS

### Web
- **Web**: Web platform
- **Visible**: Visible for Web
- **Enabled**: Enabled for Web
- **Architecture**: Architecture for Web

## Recommendations

### For Windows
- **Use Windows**: Use Windows platform
- **Set Windows Visible**: Set Windows visible
- **Set Windows Enabled**: Set Windows enabled
- **Set Windows Architecture**: Set Windows architecture
- **Test in Editor**: Always test in editor

### For macOS
- **Use macOS**: Use macOS platform
- **Set macOS Visible**: Set macOS visible
- **Set macOS Enabled**: Set macOS enabled
- **Set macOS Architecture**: Set macOS architecture
- **Test in Editor**: Always test in editor

### For Linux
- **Use Linux**: Use Linux platform
- **Set Linux Visible**: Set Linux visible
- **Set Linux Enabled**: Set Linux enabled
- **Set Linux Architecture**: Set Linux architecture
- **Test in Editor**: Always test in editor

### For Android
- **Use Android**: Use Android platform
- **Set Android Visible**: Set Android visible
- **Set Android Enabled**: Set Android enabled
- **Set Android Architecture**: Set Android architecture
- **Test in Editor**: Always test in editor

### For iOS
- **Use iOS**: Use iOS platform
- **Set iOS Visible**: Set iOS visible
- **Set iOS Enabled**: Set iOS enabled
- **Set iOS Architecture**: Set iOS architecture
- **Test in Editor**: Always test in editor

### For Web
- **Use Web**: Use web platform
- **Set Web Visible**: Set web visible
- **Set Web Enabled**: Set web enabled
- **Set Web Architecture**: Set web architecture
- **Test in Editor**: Always test in editor

## Prohibitions

### Performance Issues
- **Too Many Windows**: Avoid using too many Windows without optimization
- **Complex macOS**: Avoid using complex macOS without optimization
- **Unbounded Linux**: Avoid creating unbounded Linux
- **Unbounded Android**: Avoid creating unbounded Android
- **Unbounded iOS**: Avoid creating unbounded iOS
- **Unbounded Web**: Avoid creating unbounded Web

### Memory Management
- **Lambda Callables**: Avoid storing lambda callables in member variables of `RefCounted`-based classes
- **Circular References**: Avoid creating circular references between nodes
- **Unused Nodes**: Remove unused nodes from the scene tree to prevent memory leaks

## Pitfalls

### Windows
- **Incorrect Setup**: Incorrect Windows setup can cause issues
- **Performance Issues**: Complex Windows features can cause performance issues
- **Complexity**: Windows features can be complex

### macOS
- **Incorrect Setup**: Incorrect macOS setup can cause issues
- **Performance Issues**: Complex macOS features can cause performance issues
- **Complexity**: macOS features can be complex

### Linux
- **Incorrect Setup**: Incorrect Linux setup can cause issues
- **Performance Issues**: Complex Linux features can cause performance issues
- **Complexity**: Linux features can be complex

### Android
- **Incorrect Setup**: Incorrect Android setup can cause issues
- **Performance Issues**: Complex Android features can cause performance issues
- **Complexity**: Android features can be complex

### iOS
- **Incorrect Setup**: Incorrect iOS setup can cause issues
- **Performance Issues**: Complex iOS features can cause performance issues
- **Complexity**: iOS features can be complex

### Web
- **Incorrect Setup**: Incorrect Web setup can cause issues
- **Performance Issues**: Complex Web features can cause performance issues
- **Complexity**: Web features can be complex

## ELI5: Windows

Imagine you have a Windows platform that you want to use for your game. Windows is like a system that can provide Windows platform.

### Example: Using Windows
```gdscript
extends Node

func _ready() -> void:
    # Create a Windows
    var windows = Node.new()
    add_child(windows)
    
    # Set the Windows name
    windows.name = "My Windows"
    
    # Set the Windows path
    windows.windows_path = "res://windows/windows.tscn"
    
    # Set the Windows visible
    windows.windows_visible = true
    
    # Set the Windows enabled
    windows.windows_enabled = true
    
    # Set the Windows architecture
    windows.windows_architecture = 0
    
    # Load the Windows
    windows.load_windows("res://windows/windows.tscn")
```

## ELI5: macOS

Imagine you have a macOS platform that you want to use for your game. macOS is like a system that can provide macOS platform.

### Example: Using macOS
```gdscript
extends Node

func _ready() -> void:
    # Create a macOS
    var macos = Node.new()
    add_child(macos)
    
    # Set the macOS name
    macos.name = "My macOS"
    
    # Set the macOS path
    macos.macos_path = "res://macos/macos.tscn"
    
    # Set the macOS visible
    macos.macos_visible = true
    
    # Set the macOS enabled
    macos.macos_enabled = true
    
    # Set the macOS architecture
    macos.macos_architecture = 0
    
    # Load the macOS
    macos.load_macos("res://macos/macos.tscn")
```

## ELI5: Linux

Imagine you have a Linux platform that you want to use for your game. Linux is like a system that can provide Linux platform.

### Example: Using Linux
```gdscript
extends Node

func _ready() -> void:
    # Create a Linux
    var linux = Node.new()
    add_child(linux)
    
    # Set the Linux name
    linux.name = "My Linux"
    
    # Set the Linux path
    linux.linux_path = "res://linux/linux.tscn"
    
    # Set the Linux visible
    linux.linux_visible = true
    
    # Set the Linux enabled
    linux.linux_enabled = true
    
    # Set the Linux architecture
    linux.linux_architecture = 0
    
    # Load the Linux
    linux.load_linux("res://linux/linux.tscn")
```

## ELI5: Android

Imagine you have an Android platform that you want to use for your game. Android is like a system that can provide Android platform.

### Example: Using Android
```gdscript
extends Node

func _ready() -> void:
    # Create an Android
    var android = Node.new()
    add_child(android)
    
    # Set the Android name
    android.name = "My Android"
    
    # Set the Android path
    android.android_path = "res://android/android.tscn"
    
    # Set the Android visible
    android.android_visible = true
    
    # Set the Android enabled
    android.android_enabled = true
    
    # Set the Android architecture
    android.android_architecture = 0
    
    # Load the Android
    android.load_android("res://android/android.tscn")
```

## ELI5: iOS

Imagine you have an iOS platform that you want to use for your game. iOS is like a system that can provide iOS platform.

### Example: Using iOS
```gdscript
extends Node

func _ready() -> void:
    # Create an iOS
    var ios = Node.new()
    add_child(ios)
    
    # Set the iOS name
    ios.name = "My iOS"
    
    # Set the iOS path
    ios.ios_path = "res://ios/ios.tscn"
    
    # Set the iOS visible
    ios.ios_visible = true
    
    # Set the iOS enabled
    ios.ios_enabled = true
    
    # Set the iOS architecture
    ios.ios_architecture = 0
    
    # Load the iOS
    ios.load_ios("res://ios/ios.tscn")
```

## ELI5: Web

Imagine you have a web platform that you want to use for your game. Web is like a system that can provide web platform.

### Example: Using Web
```gdscript
extends Node

func _ready() -> void:
    # Create a Web
    var web = Node.new()
    add_child(web)
    
    # Set the Web name
    web.name = "My Web"
    
    # Set the Web path
    web.web_path = "res://web/web.tscn"
    
    # Set the Web visible
    web.web_visible = true
    
    # Set the Web enabled
    web.web_enabled = true
    
    # Set the Web architecture
    web.web_architecture = 0
    
    # Load the Web
    web.load_web("res://web/web.tscn")
```

## Best Practices Summary

1. **Use Windows** for Windows platform
2. **Set Windows Visible** for Windows
3. **Set Windows Enabled** for Windows
4. **Set Windows Architecture** for Windows
5. **Use macOS** for macOS platform
6. **Set macOS Visible** for macOS
7. **Set macOS Enabled** for macOS
8. **Set macOS Architecture** for macOS
9. **Use Linux** for Linux platform
10. **Set Linux Visible** for Linux
11. **Set Linux Enabled** for Linux
12. **Set Linux Architecture** for Linux
13. **Use Android** for Android platform
14. **Set Android Visible** for Android
15. **Set Android Enabled** for Android
16. **Set Android Architecture** for Android
17. **Use iOS** for iOS platform
18. **Set iOS Visible** for iOS
19. **Set iOS Enabled** for iOS
20. **Set iOS Architecture** for iOS
21. **Use Web** for web platform
22. **Set Web Visible** for web
23. **Set Web Enabled** for web
24. **Set Web Architecture** for web
25. **Test in Editor** for proper setup
26. **Always clean up** unused nodes to prevent memory leaks
