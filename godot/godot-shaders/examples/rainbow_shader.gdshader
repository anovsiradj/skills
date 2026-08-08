shader_type canvas_item;
// Animated rainbow color shift for 2D sprites.

uniform float speed : hint_range(0.0, 5.0) = 1.0;

void fragment() {
	float shift = UV.x + TIME * speed;
	COLOR = vec4(
		0.5 + 0.5 * cos(shift),
		0.5 + 0.5 * sin(shift),
		0.5 + 0.5 * cos(shift * 0.5),
		1.0
	);
}
