shader_type canvas_item;

uniform sampler2D noise: repeat_enable;
uniform float scale = 1.0;
uniform vec2 movement = vec2(1.0);
uniform float amount : hint_range(0.0, 1.0, 0.01);

void fragment() {
	vec4 noise_color = texture(noise, UV * scale + movement * sin(TIME));
	COLOR = texture(TEXTURE, UV + vec2(noise_color.r - 0.5) * amount);
}
