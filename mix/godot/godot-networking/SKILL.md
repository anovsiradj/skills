---
name: godot-networking
description: Godot Engine networking, TCP, UDP, HTTP, and multiplayer.
license: Unlicense
metadata:
  version: 2026.08.07+03
  authors: ["anovsiradj", "deepseek-v4-flash", "gemma-4-31D-it-fp8", "Mistral AI"]
---

# Networking

## Overview
Godot 4 networking: **high-level multiplayer** with `ENetMultiplayerPeer` + `MultiplayerSynchronizer` + `@rpc`, and low-level sockets (`PacketPeerUDP`, `StreamPeerTCP`, `HTTPRequest`).

## Key Version Differences (3.x vs 4.x)
- `NetworkedMultiplayerENet` → `ENetMultiplayerPeer` (`create_server()`, `create_client()`).
- `MultiplayerSynchronizer` node replaces manual `rpc()` spam for synced properties.
- `@rpc(...)` annotations replace `remote`/`master`/`puppet` keywords.
- **Never trust the client**: validate all requests server-side.

## File Map
| File | Purpose |
|------|---------|
| [classes/basics.md](classes/basics.md) | Server/client architecture |
| [tips/security.md](tips/security.md) | Anti-cheat and sync rules |
| [usage/rpcs.md](usage/rpcs.md) | RPC annotations and calling |
| [examples/multiplayer.gd](examples/multiplayer.gd) | Host/join + RPC score sync |

## Quick Start
```gdscript
var peer := ENetMultiplayerPeer.new()
peer.create_server(1234)
multiplayer.multiplayer_peer = peer
# Client:
# peer.create_client("127.0.0.1", 1234)
```
