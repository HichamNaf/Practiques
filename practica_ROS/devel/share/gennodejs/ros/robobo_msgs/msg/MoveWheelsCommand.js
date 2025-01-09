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

class MoveWheelsCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lspeed = null;
      this.rspeed = null;
      this.time = null;
      this.unlockid = null;
    }
    else {
      if (initObj.hasOwnProperty('lspeed')) {
        this.lspeed = initObj.lspeed
      }
      else {
        this.lspeed = new std_msgs.msg.Int8();
      }
      if (initObj.hasOwnProperty('rspeed')) {
        this.rspeed = initObj.rspeed
      }
      else {
        this.rspeed = new std_msgs.msg.Int8();
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('unlockid')) {
        this.unlockid = initObj.unlockid
      }
      else {
        this.unlockid = new std_msgs.msg.Int16();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveWheelsCommand
    // Serialize message field [lspeed]
    bufferOffset = std_msgs.msg.Int8.serialize(obj.lspeed, buffer, bufferOffset);
    // Serialize message field [rspeed]
    bufferOffset = std_msgs.msg.Int8.serialize(obj.rspeed, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.time, buffer, bufferOffset);
    // Serialize message field [unlockid]
    bufferOffset = std_msgs.msg.Int16.serialize(obj.unlockid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveWheelsCommand
    let len;
    let data = new MoveWheelsCommand(null);
    // Deserialize message field [lspeed]
    data.lspeed = std_msgs.msg.Int8.deserialize(buffer, bufferOffset);
    // Deserialize message field [rspeed]
    data.rspeed = std_msgs.msg.Int8.deserialize(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [unlockid]
    data.unlockid = std_msgs.msg.Int16.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/MoveWheelsCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e266bff9487ab0f7db9d11321bda62d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to move the wheels for
    # an specific time
    #
    # Left wheel speed
    std_msgs/Int8 lspeed
    # Right wheel speed
    std_msgs/Int8 rspeed
    # Time in miliseconds
    std_msgs/Int32 time
    # Identifier for end-of-movement notification
    std_msgs/Int16 unlockid
    
    ================================================================================
    MSG: std_msgs/Int8
    int8 data
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    ================================================================================
    MSG: std_msgs/Int16
    int16 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveWheelsCommand(null);
    if (msg.lspeed !== undefined) {
      resolved.lspeed = std_msgs.msg.Int8.Resolve(msg.lspeed)
    }
    else {
      resolved.lspeed = new std_msgs.msg.Int8()
    }

    if (msg.rspeed !== undefined) {
      resolved.rspeed = std_msgs.msg.Int8.Resolve(msg.rspeed)
    }
    else {
      resolved.rspeed = new std_msgs.msg.Int8()
    }

    if (msg.time !== undefined) {
      resolved.time = std_msgs.msg.Int32.Resolve(msg.time)
    }
    else {
      resolved.time = new std_msgs.msg.Int32()
    }

    if (msg.unlockid !== undefined) {
      resolved.unlockid = std_msgs.msg.Int16.Resolve(msg.unlockid)
    }
    else {
      resolved.unlockid = new std_msgs.msg.Int16()
    }

    return resolved;
    }
};

module.exports = MoveWheelsCommand;
