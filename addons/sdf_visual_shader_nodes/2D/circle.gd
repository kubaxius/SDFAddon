# circle.gd
@tool
extends VisualShaderNodeCustomSD
class_name VisualShaderNodeSDCircle


func _init():
	## visuals ##
	name = "SDCircle"
	category = "DistanceFields/2D"
	icon_type = VisualShaderNode.PORT_TYPE_SCALAR
	description =\
"""SDF that takes in position in 2D space and returns value based \
on the distance from a defined circle perimeter.

Negative value indicates that the point is inside of a shape, \
and positive indicates that it's outside of it."""
	
	function_name = "sdCircleNode"
	
	## inputs ##
	input_names = [\
	"point",\
	"radius",\
	]
	
	input_types = [\
	VisualShaderNode.PORT_TYPE_VECTOR_2D,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
	
	input_default_values = [\
	Vector2.ZERO,\
	1.0,\
	]
	
	## outputs ##
	output_names = [\
	"distance",\
	]
	
	output_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
