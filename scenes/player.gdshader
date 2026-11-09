shader_type canvas_item;

uniform float bank : hint_range(-1.0, 1.0) = 0.0;

void vertex() {
	// compress wing slightly
	VERTEX.x *= 1.0 - abs(bank) * 0.25;
}


void fragment() {
	vec4 color = texture(TEXTURE, UV);
	
	// darken one wing and brighten other
	float side = (UV.x - 0.5) * 2.0;
	color.rgb *= 1.0 + side * bank * 0.25;
	
	COLOR = color;
}
