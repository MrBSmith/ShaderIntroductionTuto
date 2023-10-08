shader_type canvas_item;

uniform sampler2D noise: repeat_enable;
uniform vec2 movement = vec2(1.0);
uniform float mix_amount: hint_range(0.0, 1.0, 0.01); 

void fragment() {
	vec4 noise_color = texture(noise, UV + movement * sin(TIME));
	vec4 texture_color = texture(TEXTURE, UV);
	COLOR = mix(texture_color, noise_color, mix_amount);
}
