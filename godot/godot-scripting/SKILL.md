---
name: godot-scripting
description: Godot Engine scripting, GDScript, C#, GDExtension, and general scripting patterns.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Scripting

## Overview
The three scripting options — GDScript (default, interpreted), C# (.NET 8), GDExtension (C++/Rust for performance) — plus the GDScript lifecycle (`_init`, `_ready`, `_process`, `_physics_process`) and annotation-driven editor integration.

## Key Version Differences (3.x vs 4.x)
- **GDScript 2.0**: static typing (`var x: int`), typed arrays (`Array[int]`), `match`, lambdas, `Callable` type, `await` replaces `yield`.
- **C#**: full .NET 8 support.
- **GDExtension**: replaces `GDNative` (3.x).
- Annotations: `@export`, `@onready`, `@tool`, `@rpc`, `@export_group`, `@export_enum`.

## File Map
| File | Purpose |
|------|---------|
| [classes/languages.md](classes/languages.md) | GDScript vs C# vs GDExtension |
| [tips/best_practices.md](tips/best_practices.md) | Typing, signals, annotations |
| [usage/lifecycle.md](usage/lifecycle.md) | Node lifecycle callbacks |
| [examples/typed_script.gd](examples/typed_script.gd) | Static typing patterns |
| [examples/signals_await.gd](examples/signals_await.gd) | Signals + await |

## Quick Start
```gdscript
extends Node

@export var health := 100

func _ready() -> void:
	# _ready runs when the node enters the scene tree.
	print("Health: ", health)
```
