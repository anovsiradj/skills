---
name: godot-networking
description: Godot Engine networking, RPCs, HTTP, and WebSockets.
license: Unlicense
metadata:
  version: 2026.08.07+02
  authors: ["anovsiradj", "gemma-4-31B-it-fp8", "Mistral AI"]
---

# Networking

## Key Insights
- **High-Level Multiplayer**: Built-in ENet support with automatic replication via RPCs (Remote Procedure Calls).
- **Low-Level Options**: TCP, UDP, WebSockets, and WebRTC are all available.
- **HTTP**: `HTTPRequest` node makes it easy to interact with web APIs.

## Major Version Differences (3.x vs 4.x)
- **MultiplayerSpawner & MultiplayerSynchronizer**: Godot 4 introduces these nodes to automate the spawning and synchronization of objects across the network, reducing the amount of manual RPC code.

## Weird/Unusual Things
- **UPnP**: Built-in support to automatically open ports on a router.
- **Headless Servers**: Using `--headless` allows you to run a dedicated server without a GPU.

## Recommendations
- **Fast Paced Games**: Use ENet (High-level API) for low latency.
- **Browser Games**: Use WebSockets or WebRTC.
- **State Sync**: Use `MultiplayerSynchronizer` for continuous values (like position) and `RPCs` for one-time events (like "took damage").

## Prohibitions
- Do not trust the client! Always validate player actions on the server to prevent cheating.

## ELI5: RPC (Remote Procedure Call)
Imagine you are playing a game with a friend. You are the "Client" and your friend's computer is the "Server". 
An RPC is like a magic telephone. When you press the "Jump" button, your computer calls the server and says, "Hey! I'm calling the function `do_jump()` on your end!" The server then tells everyone else, "Player 1 is jumping now!" so they can all see it happen.

### Example: Basic RPC
```gdscript
# This function will run on the server
@rpc("any_peer", "call_remote", "reliable")
func request_jump():
	if is_server():
		# Validate jump here
		print("Player jumped!")
		# Tell all clients to play the animation
		broadcast_jump.rpc()

# This function runs on all clients
@rpc("authority", "call_local", "reliable")
func broadcast_jump():
	$AnimationPlayer.play("jump")
```

