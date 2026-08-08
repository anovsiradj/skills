# Validation Workflow

The pipeline below runs fully from the CLI — no editor needed. Use it locally before committing, or in CI after every push.

### 1. Import Check
Validates resources, scenes, and autoloads; surfaces missing deps early.
```bash
godot --headless --path . --import
```

### 2. Parse Every Script
Catch syntax errors across the whole project.
```bash
# Option A: one script at a time (exits 1 on error)
godot --headless --path . --script res://src/player.gd --check-only

# Option B: all scripts via the SceneTree validator
godot --headless --path . -s res://tools/check_all_scripts.gd
```

### 3. Lint (gdtoolkit)
Style and static analysis.
```bash
gdlint res://src/player.gd
gdformat --check res://src/player.gd   # CI mode: fails if reformatting needed
# Auto-fix locally: gdformat res://src/player.gd
```

### 4. Unit Tests
Run GUT or gdUnit4 headless.
```bash
# GUT
godot -d -s --path "$PWD" addons/gut/gut_cmdln.gd -gdir=res://test -gexit -glog=1

# gdUnit4
godot --headless -s addons/gdUnit4/bin/GdUnitCmdTool.gd -a --continue
```

### 5. Smoke Test (optional)
Boot the main scene for a few frames headless to catch `_ready()` crashes:
```bash
godot --headless --path . --quit-after 10
```

**Caveat**: a runtime error in `_ready()` prints to stderr but may not change the exit code — CI would silently pass. Either scan the log for `SCRIPT ERROR:`/`ERROR:`, or use `examples/headless_smoke.gd`, which runs a controlled number of frames and lets you `quit(1)` on failure.

### Putting It Together
Copy `examples/ci_validate.sh` into your repo and run it in CI:
```bash
./ci_validate.sh .
```
It runs all five steps and exits non-zero on the first failure.
