# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robobo_msgs/QrCodeChange.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import opencv_apps.msg

class QrCodeChange(genpy.Message):
  _md5sum = "ad90adff5581c7da685be8171e59dbb0"
  _type = "robobo_msgs/QrCodeChange"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Represents a change (appearance and disappearance) of 
# a QR Code
#
# Text of the QR Code
string id
# Distance between the first result point and the center
# of the code 
float32 distance
# Coordinate of the center of the code
opencv_apps/Point2D center

================================================================================
MSG: opencv_apps/Point2D
float64 x
float64 y

"""
  __slots__ = ['id','distance','center']
  _slot_types = ['string','float32','opencv_apps/Point2D']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       id,distance,center

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(QrCodeChange, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.id is None:
        self.id = ''
      if self.distance is None:
        self.distance = 0.
      if self.center is None:
        self.center = opencv_apps.msg.Point2D()
    else:
      self.id = ''
      self.distance = 0.
      self.center = opencv_apps.msg.Point2D()

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
      _x = self.id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_f2d().pack(_x.distance, _x.center.x, _x.center.y))
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
      if self.center is None:
        self.center = opencv_apps.msg.Point2D()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.id = str[start:end]
      _x = self
      start = end
      end += 20
      (_x.distance, _x.center.x, _x.center.y,) = _get_struct_f2d().unpack(str[start:end])
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
      _x = self.id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_f2d().pack(_x.distance, _x.center.x, _x.center.y))
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
      if self.center is None:
        self.center = opencv_apps.msg.Point2D()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.id = str[start:end]
      _x = self
      start = end
      end += 20
      (_x.distance, _x.center.x, _x.center.y,) = _get_struct_f2d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_f2d = None
def _get_struct_f2d():
    global _struct_f2d
    if _struct_f2d is None:
        _struct_f2d = struct.Struct("<f2d")
    return _struct_f2d
