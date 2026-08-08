extends SceneTree
## CI validator: parses every .gd file in the project and exits non-zero on failure.
##
## Usage:  godot --headless --path <project> -s res://tools/check_all_scripts.gd
## Exit:   0 = all scripts parse, 1 = at least one parse error.
##
## Note: load() returns a script object even when parsing fails, so use
## can_instantiate() — it is false for scripts with parse errors.

const SKIP_DIRS := ["addons", "tools", ".godot"]


func _init() -> void:
	var files: PackedStringArray = _collect_gd_files("res://")
	var failures: Array[String] = []

	for path in files:
		var script: GDScript = load(path)
		if script == null or not script.can_instantiate():
			failures.append(path)
			print("FAIL  ", path)
		else:
			print("OK    ", path)

	if failures.is_empty():
		print("\nALL %d SCRIPTS PARSE OK" % files.size())
		quit(0)
	else:
		print("\n%d/%d SCRIPTS FAILED TO PARSE:" % [failures.size(), files.size()])
		for f in failures:
			print("  - ", f)
		quit(1)


func _collect_gd_files(dir: String) -> PackedStringArray:
	var result: PackedStringArray = []
	var d := DirAccess.open(dir)
	if d == null:
		return result

	d.list_dir_begin()
	var name := d.get_next()
	while name != "":
		if d.current_is_dir():
			if not name.begins_with(".") and not SKIP_DIRS.has(name):
				result.append_array(_collect_gd_files(dir.path_join(name)))
		elif name.ends_with(".gd"):
			result.append(dir.path_join(name))
		name = d.get_next()
	d.list_dir_end()
	return result
