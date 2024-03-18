float sdTorus( vec3 p, vec2 t ){
	vec2 q = vec2(length(p.xz)-t.x,p.y);
	return length(q)-t.y;
}

float sdTorusNode( vec3 point, float radius, float thickness, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdTorus(p, vec2(radius, thickness));
}