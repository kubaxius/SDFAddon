float sdCone( vec3 p, vec2 c, float h ){
	// c is the sin/cos of the angle, h is height
	// Alternatively pass q instead of (c,h),
	// which is the point at the base in 2D
	vec2 q = h*vec2(c.x/c.y,-1.0);

	vec2 w = vec2( length(p.xz), p.y );
	vec2 a = w - q*clamp( dot(w,q)/dot(q,q), 0.0, 1.0 );
	vec2 b = w - q*vec2( clamp( w.x/q.x, 0.0, 1.0 ), 1.0 );
	float k = sign( q.y );
	float d = min(dot( a, a ),dot(b, b));
	float s = max( k*(w.x*q.y-w.y*q.x),k*(w.y-q.y));
	return sqrt(d)*sign(s);
}


float sdConeNode(vec3 point, float angle, float height, mat4 transform){
	vec3 p = (inverse(transform) * vec4(point, 1.0)).xyz;
	vec2 sincos = vec2(sin(angle), cos(angle));
	return sdCone(p, sincos, height);
}