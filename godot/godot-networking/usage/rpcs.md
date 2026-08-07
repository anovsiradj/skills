# Remote Procedure Calls (RPCs)
Telling other computers to run a function.

### RPC Annotations
- `@rpc("any_peer")`: Anyone can call this function.
- `@rpc("authority")`: Only the server (or owner) can call this.
- `@rpc("reliable")`: Guaranteed to arrive (TCP-like).
- `@rpc("unreliable")`: Fast, but might be lost (UDP-like).

### Calling an RPC
Use `.rpc()` to send the call.
`update_score.rpc(10)` $\rightarrow$ runs `update_score(10)` on all connected peers.

### Example: Syncing a Score
```gdscript
@rpc("any_peer", "call_remote", "reliable")
func request_score_add(amount):
	if multiplayer.is_server():
		global_score += amount
		sync_score.rpc(global_score)

@rpc("authority", "call_local", "reliable")
func sync_score(new_score):
	$Label.text = "Score: " + str(new_score)
```
