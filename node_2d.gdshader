shader_type canvas_item;

uniform int nb_colors : hint_range(0, 100, 1) = 16;
uniform sampler2D palette: repeat_enable;

vec4 find_nearest_color(vec4 c) {
	float smallest_dist = 999.0;
	vec4 result_color = vec4(1.0);
	
	for(int i = 0; i < nb_colors; i++) {
		vec4 current_color = texture(palette, vec2(float(i) / float(nb_colors), 0.5));
		float dist = distance(c, current_color);
		
		if (dist < smallest_dist) {
			smallest_dist = dist;
			result_color = current_color;
		} 
	}
	
	return result_color;
}


void fragment() {
	vec4 t = texture(TEXTURE, UV);
	COLOR = find_nearest_color(t);
}


