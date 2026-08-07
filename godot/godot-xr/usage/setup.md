# XR Setup Workflow
Getting your project into the headset.

### Configuration
1. **Project Settings**:
   - Enable `XR > OpenXR`.
   - Enable `XR Shaders`.
2. **Rendering**: Use the **Mobile** renderer for standalone headsets (Quest) or **Forward+** for PCVR.

### Initialization Script
```gdscript
extends Node3D
var xr_interface: XRInterface

func _ready():
    xr_interface = XRServer.find_interface("OpenXR")
    if xr_interface and xr_interface.is_initialized():
        # Disable V-Sync to prevent motion sickness
        DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
        get_viewport().use_xr = true
```
