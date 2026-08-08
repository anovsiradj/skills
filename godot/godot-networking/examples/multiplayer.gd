extends Node
## Minimal host/join + server-validated RPC score.

var score := 0

func host() -> void:
	var peer := ENetMultiplayerPeer.new()
	peer.create_server(1234)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	print("Hosting on port 1234")

func join(address: String) -> void:
	var peer := ENetMultiplayerPeer.new()
	peer.create_client(address, 1234)
	multiplayer.multiplayer_peer = peer

@rpc("any_peer", "call_remote", "reliable")
func request_add_score(amount: int) -> void:
	# Server validates, then broadcasts the accepted value.
	if not multiplayer.is_server():
		return
	score += amount
	sync_score.rpc(score)

@rpc("authority", "call_remote", "reliable")
func sync_score(new_score: int) -> void:
	score = new_score
	$Label.text = "Score: %d" % score

func _on_peer_connected(id: int) -> void:
	print("Player ", id, " connected")
