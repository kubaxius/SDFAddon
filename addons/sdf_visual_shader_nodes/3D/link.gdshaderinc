float sdLink( vec3 p, float le, float r1, float r2 ){
	vec3 q = vec3( p.x, max(abs(p.y)-le,0.0), p.z );
	return length(vec2(length(q.xy)-r1,q.z)) - r2;
}

float sdLinkNode( vec3 point, float radius, float thickness, float len, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdLink(p, len, radius, thickness);
}