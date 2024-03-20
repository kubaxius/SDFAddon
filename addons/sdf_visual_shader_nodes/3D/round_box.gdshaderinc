
float sdRoundBox( vec3 p, vec3 b, float r ){
	vec3 q = abs(p) - b + r;
	return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0) - r;
}


float sdRoundBoxNode(vec3 point, vec3 box_dimensions, float radius, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdRoundBox(p, box_dimensions/2.0, radius);
}