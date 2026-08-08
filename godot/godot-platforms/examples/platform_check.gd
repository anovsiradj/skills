extends Node
## Platform detection for feature gating.

func _ready() -> void:
	if OS.has_feature("web"):
		print("Running in a browser")
	elif OS.has_feature("android"):
		print("Running on Android")
	elif OS.has_feature("ios"):
		print("Running on iOS")
	elif OS.get_name() == "Windows":
		print("Running on Windows")
