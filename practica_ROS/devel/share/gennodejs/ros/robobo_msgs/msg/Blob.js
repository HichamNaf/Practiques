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

class Blob {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.color = null;
      this.size = null;
      this.center = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new opencv_apps.msg.Point2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Blob
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [color]
    bufferOffset = std_msgs.msg.String.serialize(obj.color, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.size, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = opencv_apps.msg.Point2D.serialize(obj.center, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Blob
    let len;
    let data = new Blob(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [color]
    data.color = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = opencv_apps.msg.Point2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += std_msgs.msg.String.getMessageSize(object.color);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/Blob';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fcdaa08fe5dcb5ccf3de600463bba07b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a detected Color Blob
    #
    # Metadata about the frame
    Header header
    # Color of the blob
    std_msgs/String color
    # Size of the blob (area) in pixels
    std_msgs/Int32 size
    # Coordinate of the center of the blob
    opencv_apps/Point2D center
    
    
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
    MSG: std_msgs/String
    string data
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
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
    const resolved = new Blob(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.color !== undefined) {
      resolved.color = std_msgs.msg.String.Resolve(msg.color)
    }
    else {
      resolved.color = new std_msgs.msg.String()
    }

    if (msg.size !== undefined) {
      resolved.size = std_msgs.msg.Int32.Resolve(msg.size)
    }
    else {
      resolved.size = new std_msgs.msg.Int32()
    }

    if (msg.center !== undefined) {
      resolved.center = opencv_apps.msg.Point2D.Resolve(msg.center)
    }
    else {
      resolved.center = new opencv_apps.msg.Point2D()
    }

    return resolved;
    }
};

module.exports = Blob;
