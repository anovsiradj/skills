# Validation Tooling

### gdtoolkit (gdlint + gdformat)
Community Python linter/formatter for GDScript (Godot 4 syntax). Install with pip:

```bash
pip install --user gdtoolkit
# On Windows the binaries land in %APPDATA%\Python\Python3xx\Scripts\
# (add that folder to PATH), or run as modules:
python -m gdlint script.gd
```

- **`gdlint <file.gd>`**: Style/static checks (e.g. unused arguments, max line length). Non-zero exit on findings.
- **`gdformat <file.gd>`**: Auto-format the file in place.
- **`gdformat --check <file.gd>`**: Report whether the file needs reformatting without modifying it — the CI-friendly mode ("would reformat" / "1 file would be reformatted").

### GUT (Godot Unit Test)
Unit testing framework for Godot 4 (v9.x). Install via the Asset Library or GitHub zip into `addons/gut`, then enable the plugin.

Run from the command line at the project root:

```bash
godot -d -s --path "$PWD" addons/gut/gut_cmdln.gd -gdir=res://test -gexit -glog=1
```

Key options:
- `-gdir <dir>`: Directories to search for test scripts (repeatable, comma-separated).
- `-gtest <path>`: Run one specific test script.
- `-gexit`: Exit after running (required for CI; returns 0 pass / 1 fail).
- `-gselect <string>`: Run only scripts whose filename contains the string.
- `-gconfig <file>`: Load options from a JSON config (default `res://.gutconfig.json`).
- `-gjunit_xml_file <path>`: Export results as JUnit XML for CI dashboards.

Test scripts extend `GutTest` and use asserts like `assert_eq()`, `assert_true()`, `assert_signal_emitted()`.

### gdUnit4
Alternative embedded unit testing framework (supports GDScript **and C#**). Install via Asset Library into `addons/gdUnit4`.

Run headless:

```bash
godot --headless -s addons/gdUnit4/bin/GdUnitCmdTool.gd -a --continue
```

- `-a`: run all tests; `--continue`: keep going after failures.
- Flag names can vary by version — check yours with `GdUnitCmdTool.gd --help`.
- Supports mocking/spying, scene testing, fuzzing, HTML and JUnit XML reports.
- Test suites extend `GdUnitTestSuite` and use fluent assertions (`assert_str(...).starts_with(...)`).

### Choosing a Framework
| Need | Tool |
|------|------|
| Parse/static check without deps | `godot --headless --script x.gd --check-only` |
| Style lint + formatting | gdtoolkit (`gdlint` / `gdformat`) |
| Unit tests (GDScript) | GUT |
| Unit tests (GDScript + C#, mocking, scenes) | gdUnit4 |
