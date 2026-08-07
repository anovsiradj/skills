# Performance Tips

### Manifold Meshes
- **Description**: Use manifold meshes for better collision detection and physics. Manifold meshes ensure accurate collision responses and avoid floating artifacts.
- **Tip**:
  - Ensure your mesh is manifold (no holes or overlapping faces).
  - Use **Mesh Manifold Checker** in the editor to validate your mesh.
  - For complex meshes, consider **simplifying** them to reduce polygon count.

### CSG (Constructive Solid Geometry)
- **Description**: Use CSG for creating complex shapes from simpler primitives.
- **Tip**:
  - **Prototype, Don't Ship**: CSG is computationally expensive. Always bake CSG results to static meshes for final builds.
  - **Triplanar Mapping**: Enable **Triplanar Mapping** in `StandardMaterial3D` to avoid texture stretching.
  - **Manifold Requirement**: Ensure meshes used in `CSGMesh3D` are manifold (water-tight) to avoid artifacts.

### GridMaps
- **Description**: Use GridMaps for procedural generation, such as terrain or voxel-based worlds.
- **Tip**:
  - **Limit Size**: Large GridMaps can cause performance issues. Use **LOD (Level of Detail)** for distant areas.
  - **Optimize Updates**: Avoid frequent updates to GridMaps during gameplay.
  - **Use Chunks**: Break GridMaps into smaller chunks for better memory management.

### Navigation Meshes
- **Description**: Use NavigationMeshes for pathfinding in 3D environments.
- **Tip**:
  - **Bake Navigation**: Pre-bake navigation meshes for static environments.
  - **Optimize Regions**: Use **NavigationRegions** to limit pathfinding to relevant areas.
  - **Avoid Overlaps**: Ensure navigation regions do not overlap unnecessarily.

### Mesh Instancing
- **Description**: Use MeshInstancer3D for rendering multiple instances of the same mesh.
- **Tip**:
  - **Batch Rendering**: Enable **batch rendering** for better performance.
  - **Limit Instanced Objects**: Avoid rendering too many instanced objects at once.

### Occlusion Culling
- **Description**: Use OcclusionCulling3D to hide objects not visible to the camera.
- **Tip**:
  - **Enable Occlusion Culling**: Turn on occlusion culling in Project Settings.
  - **Use Occlusion Queries**: Manually query occlusion for dynamic objects.

### Lightmap Baking
- **Description**: Pre-bake lighting into lightmaps for static scenes.
- **Tip**:
  - **Bake Lightmaps**: Use the Lightmap Baking tool for static scenes.
  - **Limit Lightmap Resolution**: Higher resolutions increase memory usage.
  - **Use Atlas Textures**: Combine multiple lightmaps into texture atlases.