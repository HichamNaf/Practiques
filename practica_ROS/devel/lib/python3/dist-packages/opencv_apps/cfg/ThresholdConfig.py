## *********************************************************
##
## File autogenerated for the opencv_apps package
## by the dynamic_reconfigure package.
## Please do not edit.
##
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'name': 'Default', 'type': '', 'state': True, 'cstate': 'true', 'id': 0, 'parent': 0, 'parameters': [{'name': 'use_camera_info', 'type': 'bool', 'default': False, 'level': 0, 'description': 'Indicates that the camera_info topic should be subscribed to to get the default input_frame_id. Otherwise the frame from the image message will be used.', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'apply_otsu', 'type': 'bool', 'default': False, 'level': 0, 'description': 'Apply otsu threshold', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'threshold_type', 'type': 'int', 'default': 0, 'level': 0, 'description': 'Threshold Type', 'min': 0, 'max': 4, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': "{'enum': [{'name': 'Binary', 'type': 'int', 'value': 0, 'srcline': 10, 'srcfile': '/home/vboxuser/practica_ws/src/opencv_apps/cfg/Threshold.cfg', 'description': 'Binary', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Binary_Inverted', 'type': 'int', 'value': 1, 'srcline': 11, 'srcfile': '/home/vboxuser/practica_ws/src/opencv_apps/cfg/Threshold.cfg', 'description': 'Binary Inverted', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Threshold_Truncated', 'type': 'int', 'value': 2, 'srcline': 12, 'srcfile': '/home/vboxuser/practica_ws/src/opencv_apps/cfg/Threshold.cfg', 'description': 'Threshold Truncated', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Threshold_To_Zero', 'type': 'int', 'value': 3, 'srcline': 13, 'srcfile': '/home/vboxuser/practica_ws/src/opencv_apps/cfg/Threshold.cfg', 'description': 'Threshold to Zero', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Threshold_To_Zero_Inverted', 'type': 'int', 'value': 4, 'srcline': 14, 'srcfile': '/home/vboxuser/practica_ws/src/opencv_apps/cfg/Threshold.cfg', 'description': 'Threshold to zero inverted', 'ctype': 'int', 'cconsttype': 'const int'}], 'enum_description': 'An enum for Threshold Types'}", 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'threshold', 'type': 'int', 'default': 150, 'level': 0, 'description': 'Threshold value', 'min': 0, 'max': 255, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'max_binary', 'type': 'int', 'default': 255, 'level': 0, 'description': 'Max Binary value', 'min': 0, 'max': 255, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}], 'groups': [], 'srcline': 246, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'class': 'DEFAULT', 'parentclass': '', 'parentname': 'Default', 'field': 'default', 'upper': 'DEFAULT', 'lower': 'groups'}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

Threshold_Binary = 0
Threshold_Binary_Inverted = 1
Threshold_Threshold_Truncated = 2
Threshold_Threshold_To_Zero = 3
Threshold_Threshold_To_Zero_Inverted = 4
