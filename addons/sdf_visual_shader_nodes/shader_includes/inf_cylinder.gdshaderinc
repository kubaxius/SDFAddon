// c.x - position on x coordinate
// c.y - position on y coordinate
// c.z - radius
float sdCylinder( vec3 p, vec3 c ){
	return length(p.xz-c.xy)-c.z;
}


float sdInfCylinderNode(vec3 point, float radius, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdCylinder(p, vec3(0.0, 0.0, radius));
}