extends SceneTree
## Boots a scene headless for a few frames, then exits.
## Usage: godot --headless --path <project> -s res://tools/smoke.gd
## Exit:  0 = scene ran N frames without a script error.

const FRAMES := 10

var _frames := 0


func _initialize() -> void:
	# Change the main scene at runtime.
	change_scene_to_file("res://main.tscn")


func _process(_delta: float) -> bool:
	_frames += 1
	if _frames >= FRAMES:
		print("SMOKE TEST OK: ", FRAMES, " frames")
		quit(0)
	return false  # keep the loop running
