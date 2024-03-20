float sdCappedTorus( vec3 p, vec2 sc, float ra, float rb)
{
  p.x = abs(p.x);
  float k = (sc.y*p.x>sc.x*p.y) ? dot(p.xy,sc) : length(p.xy);
  return sqrt( dot(p,p) + ra*ra - 2.0*ra*k ) - rb;
}

float sdCappedTorusNode( vec3 point, float radius, float thickness, float angular_length, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	vec2 sincos = vec2(sin(angular_length), cos(angular_length));
	return sdCappedTorus(p, sincos, radius, thickness);
}