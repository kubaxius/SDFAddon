float opExtrusion( in float d, in float z, in float h ){
	vec2 w = vec2( d, abs(z) - h/2.0 );
	return min(max(w.x,w.y),0.0) + length(max(w,0.0));
}