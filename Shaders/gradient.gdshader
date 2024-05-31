shader_type canvas_item;

uniform vec4 first_color : source_color = vec4(0.2, 0.44, 0.63, 1.0);
uniform vec4 second_color : source_color = vec4(0.03, 0.01, 0.24, 1.0);
uniform float position : hint_range(-0.5, 0.5) = 0.0;
uniform float gradient_size : hint_range(0.5, 2) = 1;
uniform float angle : hint_range(0.0, 360.0) = 0.0;

void vertex() {
	
}

void fragment() {
	float pivot = position + 0.5;
	vec2 uv = UV - pivot;
	float rotated = uv.y * cos(radians(angle)) - uv.y * sin(radians(angle)); 
	float pos = smoothstep((1.0 - gradient_size) + position, gradient_size + 0.0001 + position, rotated + pivot);
	COLOR = mix(first_color, second_color, pos); 

}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
