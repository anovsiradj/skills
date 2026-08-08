---
name: godot-cli-validation
description: Validating, linting, formatting, and testing GDScript from the command line.
license: Unlicense
metadata:
  version: 2026.08.07+04
  authors: ["anovsiradj", "deepseek-v4-flash"]
---

# CLI Validation

## Overview
Run lint, static analysis, format checks, and unit tests on GDScript **without opening the editor**, using Godot's headless mode (`godot --headless`) plus community tools (gdtoolkit's `gdlint`/`gdformat`, GUT, gdUnit4). Essential for CI/CD pipelines and for validating skill example files before shipping.

## Key Version Differences (3.x vs 4.x)
- `--check-only` (parse-only, use with `--script`) is a Godot 4 flag. In 3.x there is no direct equivalent; run `-s` scripts and read the errors instead.
- `godot --headless --path <project> --import` validates resource imports and exits.
- `-s <script>` runs a standalone script; it must extend `SceneTree` or `MainLoop` (a plain `Node` script fails with "doesn't inherit from SceneTree or MainLoop").
- GUT 9.x / gdUnit4 are the Godot 4 test frameworks (GUT 7.x was for 3.x).

## File Map
| File | Purpose |
|------|---------|
| [classes/headless_cli.md](classes/headless_cli.md) | Godot CLI flags for validation |
| [classes/tooling.md](classes/tooling.md) | gdlint, gdformat, GUT, gdUnit4 |
| [tips/gotchas.md](tips/gotchas.md) | Headless mode pitfalls |
| [usage/workflow.md](usage/workflow.md) | End-to-end validation workflow |
| [examples/check_all_scripts.gd](examples/check_all_scripts.gd) | Parse every .gd file, exit non-zero on failure |
| [examples/ci_validate.sh](examples/ci_validate.sh) | Full CI pipeline (import, parse, lint, format, test) |

## Quick Start
```bash
# Parse-check a single script (exit 1 on errors):
godot --headless --path . --script res://src/player.gd --check-only

# Parse every script in the project:
godot --headless --path . -s res://tools/check_all_scripts.gd

# Lint with gdtoolkit:
gdlint res://src/player.gd
gdformat --check res://src/player.gd
```
