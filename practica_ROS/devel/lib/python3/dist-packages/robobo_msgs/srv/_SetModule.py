# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robobo_msgs/SetModuleRequest.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class SetModuleRequest(genpy.Message):
  _md5sum = "5983e1be243acc0d1b2471a384feece7"
  _type = "robobo_msgs/SetModuleRequest"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Commands the robot to start/stop a module
#
# Module name; posible values: tag, object-detection, lane-detection 
# State: true on, false off
std_msgs/String moduleName
std_msgs/Bool moduleState

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Bool
bool data"""
  __slots__ = ['moduleName','moduleState']
  _slot_types = ['std_msgs/String','std_msgs/Bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       moduleName,moduleState

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SetModuleRequest, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.moduleName is None:
        self.moduleName = std_msgs.msg.String()
      if self.moduleState is None:
        self.moduleState = std_msgs.msg.Bool()
    else:
      self.moduleName = std_msgs.msg.String()
      self.moduleState = std_msgs.msg.Bool()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.moduleName.data
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.moduleState.data
      buff.write(_get_struct_B().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.moduleName is None:
        self.moduleName = std_msgs.msg.String()
      if self.moduleState is None:
        self.moduleState = std_msgs.msg.Bool()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.moduleName.data = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.moduleName.data = str[start:end]
      start = end
      end += 1
      (self.moduleState.data,) = _get_struct_B().unpack(str[start:end])
      self.moduleState.data = bool(self.moduleState.data)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.moduleName.data
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.moduleState.data
      buff.write(_get_struct_B().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.moduleName is None:
        self.moduleName = std_msgs.msg.String()
      if self.moduleState is None:
        self.moduleState = std_msgs.msg.Bool()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.moduleName.data = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.moduleName.data = str[start:end]
      start = end
      end += 1
      (self.moduleState.data,) = _get_struct_B().unpack(str[start:end])
      self.moduleState.data = bool(self.moduleState.data)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robobo_msgs/SetModuleResponse.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class SetModuleResponse(genpy.Message):
  _md5sum = "b41202f44ec8802b6a66ae15859258a4"
  _type = "robobo_msgs/SetModuleResponse"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """std_msgs/Int8 error


================================================================================
MSG: std_msgs/Int8
int8 data
"""
  __slots__ = ['error']
  _slot_types = ['std_msgs/Int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       error

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SetModuleResponse, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.error is None:
        self.error = std_msgs.msg.Int8()
    else:
      self.error = std_msgs.msg.Int8()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.error.data
      buff.write(_get_struct_b().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.error is None:
        self.error = std_msgs.msg.Int8()
      end = 0
      start = end
      end += 1
      (self.error.data,) = _get_struct_b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.error.data
      buff.write(_get_struct_b().pack(_x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.error is None:
        self.error = std_msgs.msg.Int8()
      end = 0
      start = end
      end += 1
      (self.error.data,) = _get_struct_b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_b = None
def _get_struct_b():
    global _struct_b
    if _struct_b is None:
        _struct_b = struct.Struct("<b")
    return _struct_b
class SetModule(object):
  _type          = 'robobo_msgs/SetModule'
  _md5sum = 'd1ff912db9829e756961c386739c3bd2'
  _request_class  = SetModuleRequest
  _response_class = SetModuleResponse
