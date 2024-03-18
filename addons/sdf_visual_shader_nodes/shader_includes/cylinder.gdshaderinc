float sdCappedCylinder( vec3 p, float h, float r ){
	vec2 d = abs(vec2(length(p.xz),p.y)) - vec2(r,h);
	return min(max(d.x,d.y),0.0) + length(max(d,0.0));
}


float sdCylinderNode(vec3 point, float radius, float height, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdCappedCylinder(p, height/2.0, radius);
}