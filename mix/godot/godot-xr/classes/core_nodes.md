# XR Core Nodes
The specialized nodes for VR/AR.

### Essential Nodes
- `XROrigin3D`: The center of the player's physical tracking space.
- `XRCamera3D`: Represents the headset. Position is updated automatically.
- `XRController3D`: Represents the hand controllers.

### XR Server API
- `XRServer.find_interface("OpenXR")`: Finds the driver for the headset.
- `XRInterface.initialize()`: Starts the XR session.
