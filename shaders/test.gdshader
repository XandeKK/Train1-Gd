shader_type canvas_item;

uniform float whitering : hint_range(0.0, 1.0) = 0;
 
void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
    COLOR = vec4(mix(texture_color.rgb, vec3(1,1,1), whitering), texture_color.a);
}