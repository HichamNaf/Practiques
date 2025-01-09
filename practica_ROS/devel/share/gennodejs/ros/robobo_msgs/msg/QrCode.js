// Auto-generated. Do not edit!

// (in-package robobo_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let opencv_apps = _finder('opencv_apps');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class QrCode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.text = null;
      this.distance = null;
      this.center = null;
      this.result_points = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = '';
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new opencv_apps.msg.Point2D();
      }
      if (initObj.hasOwnProperty('result_points')) {
        this.result_points = initObj.result_points
      }
      else {
        this.result_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QrCode
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = opencv_apps.msg.Point2D.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [result_points]
    // Serialize the length for message field [result_points]
    bufferOffset = _serializer.uint32(obj.result_points.length, buffer, bufferOffset);
    obj.result_points.forEach((val) => {
      bufferOffset = opencv_apps.msg.Point2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QrCode
    let len;
    let data = new QrCode(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [text]
    data.text = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = opencv_apps.msg.Point2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [result_points]
    // Deserialize array length for message field [result_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.result_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.result_points[i] = opencv_apps.msg.Point2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.text);
    length += 16 * object.result_points.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/QrCode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '262c4f53965b665792eece06f2421ea5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a detected QR Code
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
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new QrCode(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.center !== undefined) {
      resolved.center = opencv_apps.msg.Point2D.Resolve(msg.center)
    }
    else {
      resolved.center = new opencv_apps.msg.Point2D()
    }

    if (msg.result_points !== undefined) {
      resolved.result_points = new Array(msg.result_points.length);
      for (let i = 0; i < resolved.result_points.length; ++i) {
        resolved.result_points[i] = opencv_apps.msg.Point2D.Resolve(msg.result_points[i]);
      }
    }
    else {
      resolved.result_points = []
    }

    return resolved;
    }
};

module.exports = QrCode;
