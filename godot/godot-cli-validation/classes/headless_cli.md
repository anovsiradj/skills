# Godot CLI Flags for Validation

All commands assume a `godot` binary on PATH (editor or export template). On Windows this may be a `.exe` installed via winget or from the Godot website.

### Core Validation Flags
- `--headless`: No window, dummy audio/video drivers. Required for CI.
- `--path <dir>`: Project directory containing `project.godot`.
- `--script <path>` / `-s <path>`: Run a standalone script. The script must extend `SceneTree` or `MainLoop`.
- `--check-only`: Only parse for errors, then quit. **Must be used with `--script`.** Exit code 0 = parse OK, 1 = parse error.
- `--quit`: Quit after the first iteration (useful with `--scene`).
- `--quit-after <int>`: Quit after N iterations (frame-bounded smoke tests).
- `--import`: Start the editor headless, import all resources, then quit. Validates `.tscn`/`.tres`/asset pipelines; exit 0 on success.
- `--export-release <preset> <path>` / `--export-debug`: Build an export from the CLI — catches missing resources and script errors that only appear at export time.

### Debug & Inspection Flags
- `--debug-collisions`, `--debug-paths`, `--debug-navigation`: Visualize physics/paths/navigation while running a scene headless.
- `--profiling`: Enable script profiling.
- `--dap-port <port>`: GDScript Debug Adapter Protocol port (bare port number, e.g. `6007`).
- `--debug-server <uri>`: Debugger server URI (`tcp://127.0.0.1:6007`).
- `--lsp-port <port>`: GDScript Language Server Protocol port (bare port number).
- `--verbose` / `-v`: Verbose stdout (useful for capturing errors in CI logs).
- `--log-file <file>`: Write engine output to a file (better than scraping stdout).

### Exit Codes
- `--check-only`: 0 = parses, 1 = parse error.
- GUT CLI: 0 = all tests pass, 1 = any test fails.
- Validation scripts you write should call `quit(1)` on failure so CI sees the exit code.
