# Multiplayer Basics
Connecting players and syncing state.

### Networking Architecture
- **Server**: The "Source of Truth". Decides if a hit landed or if a player can move.
- **Client**: Sends "Requests" to the server and renders the result.

### Key Classes
- `ENetMultiplayerPeer`: High-performance UDP connection.
- `MultiplayerAPI`: The engine's networking manager.

### Example: Hosting a Server
```gdscript
func create_game():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(1234)
	multiplayer.multiplayer_peer = peer
	print("Server started on port 1234")
```
