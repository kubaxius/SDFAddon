# rect.gd
@tool
extends VisualShaderNodeCustomSD
class_name VisualShaderNodeSDRectangle


func _init():
	## visuals ##
	name = "SDRectangle"
	category = "DistanceFields/2D"
	icon_type = VisualShaderNode.PORT_TYPE_SCALAR
	description =\
"""SDF that takes in position in 2D space and returns value based \
on the distance from a defined rectangle perimeter.

Negative value indicates that the point is inside of a shape, \
and positive indicates that it's outside of it."""
	
	function_name = "sdRectNode"
	
	## inputs ##
	input_names = [\
	"point",\
	"dimensions",\
	]
	
	input_types = [\
	VisualShaderNode.PORT_TYPE_VECTOR_2D,\
	VisualShaderNode.PORT_TYPE_VECTOR_2D,\
	]
	
	input_default_values = [\
	Vector2.ZERO,\
	Vector2.ONE,\
	]
	
	## outputs ##
	output_names = [\
	"distance",\
	]
	
	output_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
