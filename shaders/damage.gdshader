shader_type canvas_item;

void vertex() {
	VERTEX.x -= cos(TIME) * 100.0;
	VERTEX.y -= sin(TIME) * 100.0;
}
