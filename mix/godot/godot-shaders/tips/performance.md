# Shader Performance Tips

### The Cost of `light()`
The `light()` function is the most expensive because it runs for **every single light** affecting a pixel. Keep the math here as simple as possible.

### Vertex vs Fragment
- **Vertex Shaders**: Run once per vertex. Use for calculations that apply to the entire vertex.
- **Fragment Shaders**: Run once per pixel. Avoid complex calculations here.
- **Tip**: Move calculations from `fragment()` to `vertex()` when possible.

### Parallelism
- **Stateless**: Shaders are stateless. A pixel cannot know what the pixel next to it is doing.
- **No Persistent Variables**: You cannot store a variable in a shader and expect it to persist across frames or pixels.
- **Tip**: Use texture memory or shared resources for stateful operations.

### Compute Shaders
- **Description**: Use compute shaders for GPU-based calculations.
- **Tip**:
  - **Use for Heavy Computations**: Offload CPU-intensive tasks to the GPU.
  - **Limit Dispatch Size**: Avoid dispatching too many threads, which can cause performance drops.
  - **Synchronization**: Ensure proper synchronization between compute shaders and rendering.

### Vertex and Fragment Shaders
- **Description**: Use vertex and fragment shaders for custom rendering effects.
- **Tip**:
  - **Minimize Complexity**: Avoid overly complex shaders that can slow down rendering.
  - **Use Uniforms**: Use uniforms for properties that change infrequently.
  - **Avoid Unnecessary Draw Calls**: Batch draw calls to reduce overhead.

### Shader Material3D
- **Description**: Use ShaderMaterial3D for custom materials.
- **Tip**:
  - **Optimize Shader Code**: Keep shader code as efficient as possible.
  - **Use Texture Atlases**: Combine textures into atlases to reduce draw calls.
  - **Limit Shader Parameters**: Avoid passing too many parameters to the shader.

### Shader Processor Functions
- **Description**: Use shader processor functions for reusable shader logic.
- **Tip**:
  - **Reuse Code**: Define reusable functions to avoid code duplication.
  - **Optimize Function Calls**: Minimize function calls within shaders.

### GLSL Optimizations
- **Description**: Optimize GLSL code for better performance.
- **Tip**:
  - **Use `const`**: Declare constants where possible.
  - **Avoid Unnecessary Calculations**: Minimize redundant calculations.
  - **Use `discard`**: Discard fragments early to save GPU cycles.

### Shader Compilation
- **Description**: Compile shaders efficiently.
- **Tip**:
  - **Precompile Shaders**: Precompile shaders during development to catch errors early.
  - **Use Shader Library**: Reuse shader libraries to maintain consistency.
  - **Profile Shaders**: Use Godot's profiler to identify performance bottlenecks.

### Dynamic Properties
- **Description**: Use dynamic properties to modify shader properties at runtime.
- **Tip**:
  - **Limit Dynamic Changes**: Avoid changing shader properties too frequently.
  - **Use Animation Trees**: Use AnimationTree for smooth transitions of dynamic properties.

### Shader Debugging
- **Description**: Debug shaders using Godot's built-in tools.
- **Tip**:
  - **Use Shader Debugger**: Enable shader debugging to inspect shader values.
  - **Check Shader Logs**: Monitor shader compilation logs for errors.
  - **Test on Different Devices**: Ensure shaders perform well across different hardware.