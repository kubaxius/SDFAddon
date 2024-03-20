
float sdBox( vec3 p, vec3 b ){
	vec3 q = abs(p) - b;
	return length(max(q,0.0)) + min(max(q.x,max(q.y,q.z)),0.0);
}


float sdBoxNode(vec3 point, vec3 box_dimensions, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdBox(p, box_dimensions/2.0);
}