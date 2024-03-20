
float sdSphere( vec3 p, float radius ){
	return length(p)-radius;
}


float sdSphereNode(vec3 point, float radius, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdSphere(p, radius);
}