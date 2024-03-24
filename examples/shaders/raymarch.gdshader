shader_type spatial;
#include "include_all.gdshaderinc"

uniform int MAX_STEPS = 100;
uniform float MAX_DIST = 100.0;
uniform float SURF_DIST = 0.01;
instance uniform int SHAPE = 1;


float GetDistance(vec3 p, mat4 transform){
	// Don't do this.
	switch(SHAPE){
		default:
			return sdSphereNode(p, 2.0, transform);
		case 2:
			return sdBoxNode(p, vec3(2.0, 2.0, 2.0), transform);
		case 3:
			return sdBoxFrameNode(p, vec3(2.0, 2.0, 2.0), 0.2, transform);
		case 4:
			return sdCappedConeNode(p, 1.0, 0.5, 1.0, transform);
		case 5:
			return sdCylinderNode(p, 1.0, 2.0, transform);
		case 6:
			return sdTorusNode(p, 1.0, 0.3, transform);
		case 7:
			return sdCappedTorusNode(p, 1.0, 0.3, 1.0, transform);
		case 8:
			return sdConeNode(p, 0.5, 2.0, transform);
		case 9:
			return sdRoundBoxNode(p, vec3(2.0, 2.0, 2.0), 0.2, transform);
		case 10:
			return sdLinkNode(p, 1.0, 0.3, 1.0, transform);
		case 11: 
			return sdInfCylinderNode(p, 1.0, transform);
		case 12:
			return opExtrusion(sdRectNode(p.xy, vec2(1.0, 1.0)), p.z, 2.0);
		case 13:
			return opExtrusion(sdCircleNode(p.xy, 1.0), p.z, 2.0);
	}
}

vec3 GetNormal(vec3 p, mat4 transform){
	float dist = GetDistance(p, transform);
	vec2 dev = vec2(0.01, 0.0);
	vec3 normal = dist - vec3(
		GetDistance(p - dev.xyy, transform),
		GetDistance(p - dev.yxy, transform),
		GetDistance(p - dev.yyx, transform));
	return normalize(normal);
}

float RayMarch(vec3 ray_origin, vec3 ray_direction, mat4 transform) {
	float dist = 0.0;
	
	for(int i = 0; i < MAX_STEPS; i++){
		vec3 pos = ray_origin + (ray_direction * dist);
		float current_dist = GetDistance(pos, transform);
		dist += current_dist;
		if(dist > MAX_DIST || current_dist < SURF_DIST) break;
	}
	return dist;
}


void fragment() {
	mat4 trans = inverse(MODEL_MATRIX);
	vec3 ws_pixel_pos = ((INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz);
	vec3 ray_origin = CAMERA_POSITION_WORLD;
	vec3 ray_direction = normalize(ray_origin - ws_pixel_pos);
	
	float dist = RayMarch(ray_origin, ray_direction, trans);
	
	ALPHA = step(dist, MAX_DIST);
	NORMAL = GetNormal(ray_origin + ray_direction * dist, trans);
}