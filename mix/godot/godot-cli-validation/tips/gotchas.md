# Headless Validation Gotchas

### `-s` Scripts Must Extend SceneTree or MainLoop
**Issue**: `godot -s my_script.gd` fails with `Can't load the script "x.gd" as it doesn't inherit from SceneTree or MainLoop.`
**Fix**: `extends SceneTree` (use `_init()` to run once) or `extends MainLoop` (use `_process()`). A script extending `Node` cannot be the entry script.

### `load()` Does Not Fail on Parse Errors
**Issue**: `var s: GDScript = load("res://broken.gd")` returns a script object even when the script has a parse error — the error only prints to stderr.
**Fix**: Check `s.can_instantiate()` (false for parse-broken scripts) — see `examples/check_all_scripts.gd`.

### `--check-only` Requires `--script`
Using `--check-only` without a script argument does nothing useful. Always pair them:
`godot --headless --path . --script res://x.gd --check-only`

### preload() of a Missing File Breaks Parsing
If a script `preload()`s a path that doesn't exist, `--check-only` reports a parse error (`Preload file "res://..." does not exist`). This is a real bug in the checked script, not a false positive — fix the path.

### First-Run Startup Can Be Slow
Godot's first headless run may import/scan for several seconds. Give CI commands a generous timeout (30–90s) and reuse a warm `.godot/` cache when possible.

### Exit Codes Get Lost in Pipelines
`set -e` in bash does not catch failures when the failing command is on the left of a pipe.
**Fix**: Use `set -o pipefail`, check `$?` explicitly, or avoid piping validation commands through `grep`/`head`.

### Windows: Binaries Not on PATH
gdtoolkit installs to `%APPDATA%\Python\Python3xx\Scripts\`. On a fresh machine, `gdlint: command not found` is expected until you add that folder to PATH. Godot itself is often installed via winget (`winget install GodotEngine.Godot`).
