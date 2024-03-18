# link.gd
@tool
extends VisualShaderNodeCustomSD
class_name VisualShaderNodeSDLink


func _init():
	## visuals ##
	name = "SDLink"
	category = "DistanceFields"
	icon_type = VisualShaderNode.PORT_TYPE_SCALAR
	description =\
"""SDF that takes in position in 3D space and returns value based \
on the distance from a defined chain link surface.

Negative value indicates that the point is inside of a shape, \
and positive indicates that it's outside of it."""
	
	function_name = "sdLinkNode"
	
	## inputs ##
	input_names = [\
	"point",\
	"radius",\
	"thickness",\
	"len",\
	"transform",\
	]
	
	input_types = [\
	VisualShaderNode.PORT_TYPE_VECTOR_3D,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_TRANSFORM,\
	]
	
	input_default_values = [\
	Vector3.ZERO,\
	1.0,\
	0.5,\
	1.5,\
	Transform3D.IDENTITY,\
	]
	
	## outputs ##
	output_names = [\
	"distance",\
	]
	
	output_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
