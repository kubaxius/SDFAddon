
float sdRect( in vec2 p, in vec2 b ){
	vec2 d = abs(p)-b;
	return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}


float sdRectNode(vec2 point, vec2 rect_dimensions){
	return sdRect(point, rect_dimensions/2.0);
}