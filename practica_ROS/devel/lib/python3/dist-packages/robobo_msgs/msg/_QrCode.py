# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robobo_msgs/QrCode.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import opencv_apps.msg
import std_msgs.msg

class QrCode(genpy.Message):
  _md5sum = "262c4f53965b665792eece06f2421ea5"
  _type = "robobo_msgs/QrCode"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """# Represents a detected QR Code
#
# Metadata about the frame
Header header
# Text contained on the QR Code
string text
# Distance between the center of the code and
# the first result point
float32 distance
# Coordinate of the center of the code
opencv_apps/Point2D center
# Vector of coordinates of the result points
opencv_apps/Point2D[] result_points 

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: opencv_apps/Point2D
float64 x
float64 y

"""
  __slots__ = ['header','text','distance','center','result_points']
  _slot_types = ['std_msgs/Header','string','float32','opencv_apps/Point2D','opencv_apps/Point2D[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,text,distance,center,result_points

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(QrCode, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.text is None:
        self.text = ''
      if self.distance is None:
        self.distance = 0.
      if self.center is None:
        self.center = opencv_apps.msg.Point2D()
      if self.result_points is None:
        self.result_points = []
    else:
      self.header = std_msgs.msg.Header()
      self.text = ''
      self.distance = 0.
      self.center = opencv_apps.msg.Point2D()
      self.result_points = []

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
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.text
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_f2d().pack(_x.distance, _x.center.x, _x.center.y))
      length = len(self.result_points)
      buff.write(_struct_I.pack(length))
      for val1 in self.result_points:
        _x = val1
        buff.write(_get_struct_2d().pack(_x.x, _x.y))
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
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.center is None:
        self.center = opencv_apps.msg.Point2D()
      if self.result_points is None:
        self.result_points = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.text = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.text = str[start:end]
      _x = self
      start = end
      end += 20
      (_x.distance, _x.center.x, _x.center.y,) = _get_struct_f2d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.result_points = []
      for i in range(0, length):
        val1 = opencv_apps.msg.Point2D()
        _x = val1
        start = end
        end += 16
        (_x.x, _x.y,) = _get_struct_2d().unpack(str[start:end])
        self.result_points.append(val1)
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
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self.text
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_f2d().pack(_x.distance, _x.center.x, _x.center.y))
      length = len(self.result_points)
      buff.write(_struct_I.pack(length))
      for val1 in self.result_points:
        _x = val1
        buff.write(_get_struct_2d().pack(_x.x, _x.y))
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
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.center is None:
        self.center = opencv_apps.msg.Point2D()
      if self.result_points is None:
        self.result_points = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.text = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.text = str[start:end]
      _x = self
      start = end
      end += 20
      (_x.distance, _x.center.x, _x.center.y,) = _get_struct_f2d().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.result_points = []
      for i in range(0, length):
        val1 = opencv_apps.msg.Point2D()
        _x = val1
        start = end
        end += 16
        (_x.x, _x.y,) = _get_struct_2d().unpack(str[start:end])
        self.result_points.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2d = None
def _get_struct_2d():
    global _struct_2d
    if _struct_2d is None:
        _struct_2d = struct.Struct("<2d")
    return _struct_2d
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_f2d = None
def _get_struct_f2d():
    global _struct_f2d
    if _struct_f2d is None:
        _struct_f2d = struct.Struct("<f2d")
    return _struct_f2d
