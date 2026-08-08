# Networking Security & Stability

### The Golden Rule: NEVER Trust the Client
**Bad**: Client says `rpc_add_gold(1000)`.
**Good**: Client says `rpc_request_mine_gold()`. The server checks if the player is actually at the gold mine, and then the server adds the gold.

### Path Matching
RPCs only work if the node calling the function has the **exact same name and path** on all computers.
**Tip**: Use the same scene structure for all players.

### Node Syncing
For continuous values (like position), don't use RPCs every frame. Use the `MultiplayerSynchronizer` node to automatically sync properties.
