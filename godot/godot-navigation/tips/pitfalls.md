# Navigation Pitfalls

### The First Frame Bug
NavMesh synchronization happens at the end of a frame.
**Issue**: If you set `target_position` in `_ready()`, the path will be empty.
**Fix**: Use `call_deferred` or wait one physics frame before setting the target.

### Jittering at Target
When an agent reaches the destination, `get_next_path_position()` might return a point slightly behind the agent, causing them to shake.
**Fix**: Always check `is_navigation_finished()` before moving.

### Avoidance Logic
If using `avoidance_enabled`, you cannot use `move_and_slide()` directly.
**Correct Pattern**:
1. `nav_agent.set_velocity(calculated_velocity)`
2. Wait for `velocity_computed` signal.
3. Apply the `safe_velocity` provided by the signal.
