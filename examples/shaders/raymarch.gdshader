shader_type spatial;
render_mode unshaded, depth_test_disabled;
#include "res://addons/sdf_visual_shader_nodes/3D/sphere.gdshaderinc"

uniform int MAX_STEPS = 100;
uniform float MAX_DIST = 100.0;
uniform float SURF_DIST = 0.01;
instance uniform int shape = 1;


float GetDistance(vec3 p, mat4 transform){
	return sdSphereNode(p, 2.0, transform);
}

vec3 GetNormal(vec3 p, mat4 transform){
	float dist = GetDistance(p, transform);
	vec2 dev = vec2(0.01, 0.0);
	vec3 normal = dist - vec3(
		GetDistance(p - dev.xyy, transform),
		GetDistance(p - dev.yxy, transform),
		GetDistance(p - dev.yyx, transform));
	return normal;
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
	
	vec3 normal = GetNormal(ray_origin + ray_direction * dist, trans);
	ALBEDO = normal * 10.0;
}