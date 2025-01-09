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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class OrientationEuler {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vector = null;
      this.yaw = null;
      this.pitch = null;
      this.roll = null;
    }
    else {
      if (initObj.hasOwnProperty('vector')) {
        this.vector = initObj.vector
      }
      else {
        this.vector = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = new std_msgs.msg.Float64();
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = new std_msgs.msg.Float64();
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = new std_msgs.msg.Float64();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OrientationEuler
    // Serialize message field [vector]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.vector, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.yaw, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.pitch, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.roll, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OrientationEuler
    let len;
    let data = new OrientationEuler(null);
    // Deserialize message field [vector]
    data.vector = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/OrientationEuler';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '65c4e234a4ea295f537af690b4738286';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a orientation using euler angles (yaw, pitch, roll)
    
    # Orientation vector in euler angles
    geometry_msgs/Vector3 vector
    
    # Yaw degrees
    std_msgs/Float64 yaw
    # Pitch degrees
    std_msgs/Float64 pitch
    # Roll degrees 
    std_msgs/Float64 roll 
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: std_msgs/Float64
    float64 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OrientationEuler(null);
    if (msg.vector !== undefined) {
      resolved.vector = geometry_msgs.msg.Vector3.Resolve(msg.vector)
    }
    else {
      resolved.vector = new geometry_msgs.msg.Vector3()
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = std_msgs.msg.Float64.Resolve(msg.yaw)
    }
    else {
      resolved.yaw = new std_msgs.msg.Float64()
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = std_msgs.msg.Float64.Resolve(msg.pitch)
    }
    else {
      resolved.pitch = new std_msgs.msg.Float64()
    }

    if (msg.roll !== undefined) {
      resolved.roll = std_msgs.msg.Float64.Resolve(msg.roll)
    }
    else {
      resolved.roll = new std_msgs.msg.Float64()
    }

    return resolved;
    }
};

module.exports = OrientationEuler;
