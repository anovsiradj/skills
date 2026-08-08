#!/usr/bin/env bash
# CI validation pipeline for a Godot project.
# Usage: ./ci_validate.sh [path-to-project]   (defaults to current dir)
set -euo pipefail

PROJECT="${1:-.}"
GODOT="${GODOT:-godot}"
GD="gdlint"
GDF="gdformat"

echo "== 1/5 Import project (validates resources, .tscn, .tres)"
"$GODOT" --headless --path "$PROJECT" --import

echo "== 2/5 Parse every GDScript (godot --check-only)"
fail=0
while IFS= read -r f; do
  if ! "$GODOT" --headless --path "$PROJECT" --script "$f" --check-only; then
    echo "PARSE FAIL: $f"
    fail=1
  fi
done < <(find "$PROJECT" -name '*.gd' -not -path '*/.godot/*' -not -path '*/addons/*')
[ "$fail" -eq 0 ] || exit 1

echo "== 3/5 Lint (gdlint from gdtoolkit)"
find "$PROJECT" -name '*.gd' -not -path '*/.godot/*' -not -path '*/addons/*' \
  -exec "$GD" {} +

echo "== 4/5 Format check (gdformat --check)"
find "$PROJECT" -name '*.gd' -not -path '*/.godot/*' -not -path '*/addons/*' \
  -exec "$GDF" --check {} +

echo "== 5/5 Unit tests (GUT)"
if [ ! -f "$PROJECT/addons/gut/gut_cmdln.gd" ]; then
  echo "GUT not installed at addons/gut — install it or skip this step." >&2
  exit 1
fi
"$GODOT" --headless --path "$PROJECT" -s addons/gut/gut_cmdln.gd \
  -gdir=res://test -gexit -glog=1

echo "== ALL CHECKS PASSED"
