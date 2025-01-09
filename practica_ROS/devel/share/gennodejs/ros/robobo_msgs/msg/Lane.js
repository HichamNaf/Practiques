// Auto-generated. Do not edit!

// (in-package robobo_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Lane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.coeffs1 = null;
      this.coeffs2 = null;
      this.minv = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('coeffs1')) {
        this.coeffs1 = initObj.coeffs1
      }
      else {
        this.coeffs1 = [];
      }
      if (initObj.hasOwnProperty('coeffs2')) {
        this.coeffs2 = initObj.coeffs2
      }
      else {
        this.coeffs2 = [];
      }
      if (initObj.hasOwnProperty('minv')) {
        this.minv = initObj.minv
      }
      else {
        this.minv = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lane
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [coeffs1]
    bufferOffset = _arraySerializer.float64(obj.coeffs1, buffer, bufferOffset, null);
    // Serialize message field [coeffs2]
    bufferOffset = _arraySerializer.float64(obj.coeffs2, buffer, bufferOffset, null);
    // Serialize message field [minv]
    bufferOffset = _arraySerializer.float64(obj.minv, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lane
    let len;
    let data = new Lane(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [coeffs1]
    data.coeffs1 = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [coeffs2]
    data.coeffs2 = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [minv]
    data.minv = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.coeffs1.length;
    length += 8 * object.coeffs2.length;
    length += 8 * object.minv.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/Lane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed37440a232a49de70e6d2b24a87f8b8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a detected lane (two lines)
    #
    # Metadata about the frame detected
    std_msgs/Header header
    # Coefficients of the first line
    float64[] coeffs1
    # Coefficients of the second line
    float64[] coeffs2
    # Inverse transformation matrix, this should be used if the
    # frame's perspective was transormed; else will be empty.
    float64[] minv 
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lane(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.coeffs1 !== undefined) {
      resolved.coeffs1 = msg.coeffs1;
    }
    else {
      resolved.coeffs1 = []
    }

    if (msg.coeffs2 !== undefined) {
      resolved.coeffs2 = msg.coeffs2;
    }
    else {
      resolved.coeffs2 = []
    }

    if (msg.minv !== undefined) {
      resolved.minv = msg.minv;
    }
    else {
      resolved.minv = []
    }

    return resolved;
    }
};

module.exports = Lane;
