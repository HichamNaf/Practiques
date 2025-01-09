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

class SetLedCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.color = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetLedCommand
    // Serialize message field [id]
    bufferOffset = std_msgs.msg.String.serialize(obj.id, buffer, bufferOffset);
    // Serialize message field [color]
    bufferOffset = std_msgs.msg.String.serialize(obj.color, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetLedCommand
    let len;
    let data = new SetLedCommand(null);
    // Deserialize message field [id]
    data.id = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [color]
    data.color = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.id);
    length += std_msgs.msg.String.getMessageSize(object.color);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/SetLedCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '67de51c92b3fb96ec94dabeed286e658';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to change a led to a predifined color
    #
    # Led identifier; posible values: Front-C, Front-R, 
    # Front-RR, Front-L, Front-LL, Front-C, Back-R, Back-L, all.
    std_msgs/String id
    # Color to set the values to; posible values: white,
    # red, blue, cyan, magenta, yellow, green, orange, off.
    std_msgs/String color
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetLedCommand(null);
    if (msg.id !== undefined) {
      resolved.id = std_msgs.msg.String.Resolve(msg.id)
    }
    else {
      resolved.id = new std_msgs.msg.String()
    }

    if (msg.color !== undefined) {
      resolved.color = std_msgs.msg.String.Resolve(msg.color)
    }
    else {
      resolved.color = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = SetLedCommand;
