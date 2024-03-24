# extrude.gd
@tool
extends VisualShaderNodeCustomSD
class_name VisualShaderNodeSDExtrude


func _init():
	## visuals ##
	name = "SDExtrude"
	category = "DistanceFields/Operations"
	icon_type = VisualShaderNode.PORT_TYPE_SCALAR
	description =\
"""This function takes any 2D SDF and extrudes it into 3D. Z has to be taken out of your 3D Vector with decomposing."""
	
	function_name = "opExtrusion"
	
	## inputs ##
	input_names = [\
	"result_2d",\
	"z",\
	"height",\
	]
	
	input_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
	
	input_default_values = [\
	0.0,\
	0.0,\
	1.0,\
	]
	
	## outputs ##
	output_names = [\
	"distance",\
	]
	
	output_types = [\
	VisualShaderNode.PORT_TYPE_SCALAR,\
	]
