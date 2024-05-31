shader_type canvas_item;

uniform float VchangeX = -0.115;

void vertex()
{
	float vertPosX = (-VERTEX.y * VchangeX) + VERTEX.x;
	VERTEX.x = vertPosX;
}