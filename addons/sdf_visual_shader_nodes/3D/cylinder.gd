# inf_cylinder.gd
@tool
extends VisualShaderNodeCustomSD
class_name VisualShaderNodeSDCylinder


func _init():
	## visuals ##
	name = "SDCylinder"
	category = "DistanceFields/3D"
	icon_type = VisualShaderNode.PORT_TYPE_SCALAR
	description =\
"""SDF that takes in position in 3D space and returns value based \
on the distance from a defined cylinder surface.

Negative value indicates that the point is inside of a shape, \
and positive indicates that it's outside of it."""
	
	function_name = "sdCylinderNode"
	
	## inputs ##
	input_names = [\
	"point",\
	"radius",\
	"height",\
	"transform",\
	]
	
	input_types = [\
	VisualShaderNode.PORT_TYPE_VECTOR_3D,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_TRANSFORM,\
	]
	
	input_default_values = [\
	Vector3.ZERO,\
	1.0,\
	2.0,\
	Transform3D.IDENTITY,\
	]
	
	## outputs ##
	output_names = [\
	"distance",\
	]
	
	output_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
