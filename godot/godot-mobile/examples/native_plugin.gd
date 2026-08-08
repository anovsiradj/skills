extends Node
## Accessing a native Android/iOS plugin.

const PLUGIN_NAME := "MyCustomPlugin"

func call_native(method: String, arg: Variant = null) -> Variant:
	if not Engine.has_singleton(PLUGIN_NAME):
		push_warning("Plugin %s not available" % PLUGIN_NAME)
		return null

	var plugin := Engine.get_singleton(PLUGIN_NAME)
	return plugin.call(method, arg)
