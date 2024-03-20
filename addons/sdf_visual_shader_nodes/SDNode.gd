# SDNode.gd
extends VisualShaderNodeCustom
class_name VisualShaderNodeCustomSD

var name = "NoName"
var category = "NoCategory"
var description = "No description"
var function_name = "noFunctionName"
var icon_type = VisualShaderNode.PORT_TYPE_SCALAR

var input_names = [\
"no_input_names",\
]
var input_types = [\
VisualShaderNode.PORT_TYPE_VECTOR_3D,\
]
var input_default_values = [\
Vector3.ZERO,\
]
var output_names = [\
"no_output_names",\
]
var output_types = [\
VisualShaderNode.PORT_TYPE_VECTOR_3D,\
]


## code ##

func get_shader_include_path():
	var path:String = self.get_script().get_path().get_base_dir()
	var filename:String = self.get_script().get_path().get_file().rstrip(".gd")
	return path + "/" + filename + ".gdshaderinc"


func _get_code(input_vars, output_vars, mode, type):
	var output = output_vars[0] + " = " + function_name + "("
	for i in input_vars.size():
		output += input_vars[i]
		if i < input_vars.size()-1:
			output += ", "
		else:
			output += ");"
	return output


## visuals ##

func _get_name():
	return name


func _get_category():
	return category


func _get_description():
	return description


func _get_return_icon_type():
	return icon_type


## code ##

func _get_global_code(mode):
	return '#include "' + get_shader_include_path() + '"'


## input ports ##

func _get_input_port_count():
	return input_names.size()


func _get_input_port_name(port):
	return input_names[port]


func _get_input_port_type(port):
	return input_types[port]


func _get_input_port_default_value(port):
	return input_default_values[port]


## output ports ##

func _get_output_port_count():
	return output_names.size()


func _get_output_port_name(port):
	return output_names[port]


func _get_output_port_type(port):
	return output_types[port]
