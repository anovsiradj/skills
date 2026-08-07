# Miscellaneous Optimization

### Node Overhead
Nodes are powerful but have overhead. If you need 10,000 items (like a particle system or a massive field of grass), do not use 10,000 `Node2D` nodes. Use the `RenderingServer` or `MultiMeshInstance` to draw them in one call.

### Folder Organization
Use the "Ignore Folders" setting in Project Settings to tell Godot to ignore folders containing raw assets (like `.psd` or `.blend` files) that aren't meant to be imported.

### memory management
Use `queue_free()` instead of `free()` to remove nodes. `queue_free()` waits until the end of the current frame, preventing crashes if other code is still trying to access the node.
