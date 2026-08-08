# Setting up Navigation
Creating walkable maps.

### Workflow
1. **Define Geometry**: Create your walls and floors using `StaticBody` nodes.
2. **Add Region**: Add a `NavigationRegion3D` as a parent to your floor.
3. **Bake NavMesh**: 
   - Select the `NavigationRegion3D`.
   - Create a `NavigationMesh` resource.
   - Click **Bake NavMesh** at the top of the viewport.
4. **Runtime Updates**: If you move a wall during the game, call `bake_navigation_mesh()` on the region to update the path.
