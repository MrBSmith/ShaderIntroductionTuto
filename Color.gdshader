shader_type canvas_item;

uniform vec4 color: source_color;
uniform float mix_amount: hint_range(0.0, 1.0, 0.01);

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	COLOR = mix(texture_color, color, mix_amount);
}
