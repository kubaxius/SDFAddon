
float sdCircle( vec2 p, float r ){
    return length(p) - r;
}


float sdCircleNode(vec2 point, float radius){
	return sdCircle(point, radius);
}