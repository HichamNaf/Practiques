// Auto-generated. Do not edit!

// (in-package robobo_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class SetBlobCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.red = null;
      this.green = null;
      this.blue = null;
      this.custom = null;
    }
    else {
      if (initObj.hasOwnProperty('red')) {
        this.red = initObj.red
      }
      else {
        this.red = false;
      }
      if (initObj.hasOwnProperty('green')) {
        this.green = initObj.green
      }
      else {
        this.green = false;
      }
      if (initObj.hasOwnProperty('blue')) {
        this.blue = initObj.blue
      }
      else {
        this.blue = false;
      }
      if (initObj.hasOwnProperty('custom')) {
        this.custom = initObj.custom
      }
      else {
        this.custom = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetBlobCommand
    // Serialize message field [red]
    bufferOffset = _serializer.bool(obj.red, buffer, bufferOffset);
    // Serialize message field [green]
    bufferOffset = _serializer.bool(obj.green, buffer, bufferOffset);
    // Serialize message field [blue]
    bufferOffset = _serializer.bool(obj.blue, buffer, bufferOffset);
    // Serialize message field [custom]
    bufferOffset = _serializer.bool(obj.custom, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetBlobCommand
    let len;
    let data = new SetBlobCommand(null);
    // Deserialize message field [red]
    data.red = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [green]
    data.green = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [blue]
    data.blue = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [custom]
    data.custom = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/SetBlobCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '96f928d9e33474244870b2bc3df1b747';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to change a the activation state of the blob detector 
    # for each possible color
    #
    
    # Red blob detection
    bool red
    # Green blob detection
    bool green
    # Blue blob detection
    bool blue
    # Custom color detection
    bool custom
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetBlobCommand(null);
    if (msg.red !== undefined) {
      resolved.red = msg.red;
    }
    else {
      resolved.red = false
    }

    if (msg.green !== undefined) {
      resolved.green = msg.green;
    }
    else {
      resolved.green = false
    }

    if (msg.blue !== undefined) {
      resolved.blue = msg.blue;
    }
    else {
      resolved.blue = false
    }

    if (msg.custom !== undefined) {
      resolved.custom = msg.custom;
    }
    else {
      resolved.custom = false
    }

    return resolved;
    }
};

module.exports = SetBlobCommand;
