# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robobo_msgs/MovePanTiltCommand.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class MovePanTiltCommand(genpy.Message):
  _md5sum = "e02b68971ce7a0ff6df448c278f194a2"
  _type = "robobo_msgs/MovePanTiltCommand"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Commands the robot to move it's pan and/or
# tilt. It won't move unless the UnlockId is 
# different than 0.
#
# Desired pan position. Range 11 .. 343
std_msgs/Int16 panPos
# Desired pan speed
std_msgs/Int8 panSpeed
# Identifier for end-of-movement notification
std_msgs/Int16 panUnlockId
# Desired tilt position. Range 0 .. 100
std_msgs/Int16 tiltPos
# Desired tilt speed
std_msgs/Int8 tiltSpeed
# Identifier for end-of-movement notification
std_msgs/Int16 tiltUnlockId

================================================================================
MSG: std_msgs/Int16
int16 data

================================================================================
MSG: std_msgs/Int8
int8 data
"""
  __slots__ = ['panPos','panSpeed','panUnlockId','tiltPos','tiltSpeed','tiltUnlockId']
  _slot_types = ['std_msgs/Int16','std_msgs/Int8','std_msgs/Int16','std_msgs/Int16','std_msgs/Int8','std_msgs/Int16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       panPos,panSpeed,panUnlockId,tiltPos,tiltSpeed,tiltUnlockId

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MovePanTiltCommand, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.panPos is None:
        self.panPos = std_msgs.msg.Int16()
      if self.panSpeed is None:
        self.panSpeed = std_msgs.msg.Int8()
      if self.panUnlockId is None:
        self.panUnlockId = std_msgs.msg.Int16()
      if self.tiltPos is None:
        self.tiltPos = std_msgs.msg.Int16()
      if self.tiltSpeed is None:
        self.tiltSpeed = std_msgs.msg.Int8()
      if self.tiltUnlockId is None:
        self.tiltUnlockId = std_msgs.msg.Int16()
    else:
      self.panPos = std_msgs.msg.Int16()
      self.panSpeed = std_msgs.msg.Int8()
      self.panUnlockId = std_msgs.msg.Int16()
      self.tiltPos = std_msgs.msg.Int16()
      self.tiltSpeed = std_msgs.msg.Int8()
      self.tiltUnlockId = std_msgs.msg.Int16()

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
      _x = self
      buff.write(_get_struct_hb2hbh().pack(_x.panPos.data, _x.panSpeed.data, _x.panUnlockId.data, _x.tiltPos.data, _x.tiltSpeed.data, _x.tiltUnlockId.data))
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
      if self.panPos is None:
        self.panPos = std_msgs.msg.Int16()
      if self.panSpeed is None:
        self.panSpeed = std_msgs.msg.Int8()
      if self.panUnlockId is None:
        self.panUnlockId = std_msgs.msg.Int16()
      if self.tiltPos is None:
        self.tiltPos = std_msgs.msg.Int16()
      if self.tiltSpeed is None:
        self.tiltSpeed = std_msgs.msg.Int8()
      if self.tiltUnlockId is None:
        self.tiltUnlockId = std_msgs.msg.Int16()
      end = 0
      _x = self
      start = end
      end += 10
      (_x.panPos.data, _x.panSpeed.data, _x.panUnlockId.data, _x.tiltPos.data, _x.tiltSpeed.data, _x.tiltUnlockId.data,) = _get_struct_hb2hbh().unpack(str[start:end])
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
      _x = self
      buff.write(_get_struct_hb2hbh().pack(_x.panPos.data, _x.panSpeed.data, _x.panUnlockId.data, _x.tiltPos.data, _x.tiltSpeed.data, _x.tiltUnlockId.data))
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
      if self.panPos is None:
        self.panPos = std_msgs.msg.Int16()
      if self.panSpeed is None:
        self.panSpeed = std_msgs.msg.Int8()
      if self.panUnlockId is None:
        self.panUnlockId = std_msgs.msg.Int16()
      if self.tiltPos is None:
        self.tiltPos = std_msgs.msg.Int16()
      if self.tiltSpeed is None:
        self.tiltSpeed = std_msgs.msg.Int8()
      if self.tiltUnlockId is None:
        self.tiltUnlockId = std_msgs.msg.Int16()
      end = 0
      _x = self
      start = end
      end += 10
      (_x.panPos.data, _x.panSpeed.data, _x.panUnlockId.data, _x.tiltPos.data, _x.tiltSpeed.data, _x.tiltUnlockId.data,) = _get_struct_hb2hbh().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_hb2hbh = None
def _get_struct_hb2hbh():
    global _struct_hb2hbh
    if _struct_hb2hbh is None:
        _struct_hb2hbh = struct.Struct("<hb2hbh")
    return _struct_hb2hbh
