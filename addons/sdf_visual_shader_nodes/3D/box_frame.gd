# round_box.gd
@tool
extends VisualShaderNodeCustomSD
class_name VisualShaderNodeSDBoxFrame


func _init():
	## visuals ##
	name = "SDBoxFrame"
	category = "DistanceFields/3D"
	icon_type = VisualShaderNode.PORT_TYPE_SCALAR
	description =\
"""SDF that takes in position in 3D space and returns value based \
on the distance from a defined box frame surface.

Negative value indicates that the point is inside of a shape, \
and positive indicates that it's outside of it."""
	
	function_name = "sdBoxFrameNode"
	
	## inputs ##
	input_names = [\
	"point",\
	"dimensions",\
	"frame_thickness",\
	"transform",\
	]
	
	input_types = [\
	VisualShaderNode.PORT_TYPE_VECTOR_3D,\
	VisualShaderNode.PORT_TYPE_VECTOR_3D,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_TRANSFORM,\
	]
	
	input_default_values = [\
	Vector3.ZERO,\
	Vector3.ONE,\
	0.1,\
	Transform3D.IDENTITY,\
	]
	
	## outputs ##
	output_names = [\
	"distance",\
	]
	
	output_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
