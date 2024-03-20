float sdBoxFrame( vec3 p, vec3 b, float e ){
	p = abs(p  )-b;
	vec3 q = abs(p+e)-e;
	return min(min(
		length(max(vec3(p.x,q.y,q.z),0.0))+min(max(p.x,max(q.y,q.z)),0.0),
		length(max(vec3(q.x,p.y,q.z),0.0))+min(max(q.x,max(p.y,q.z)),0.0)),
		length(max(vec3(q.x,q.y,p.z),0.0))+min(max(q.x,max(q.y,p.z)),0.0));
}


float sdBoxFrameNode(vec3 point, vec3 box_dimensions, float frame_thickness, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	return sdBoxFrame(p, box_dimensions/2.0, frame_thickness);
}