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

class SetSensorFrequencyCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.frequency = null;
    }
    else {
      if (initObj.hasOwnProperty('frequency')) {
        this.frequency = initObj.frequency
      }
      else {
        this.frequency = new std_msgs.msg.Int8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetSensorFrequencyCommand
    // Serialize message field [frequency]
    bufferOffset = std_msgs.msg.Int8.serialize(obj.frequency, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetSensorFrequencyCommand
    let len;
    let data = new SetSensorFrequencyCommand(null);
    // Deserialize message field [frequency]
    data.frequency = std_msgs.msg.Int8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/SetSensorFrequencyCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b96ba08af418a90a3d51c1440b29c5db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to change the frequency of notifications
    # of all sensors of the robot
    #
    # Integer representing the frequency; posible values: 
    # 0 for LOW
    # 1 for NORMAL
    # 2 for HIGH
    # 3 for MAX
    std_msgs/Int8 frequency   
    
    ================================================================================
    MSG: std_msgs/Int8
    int8 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetSensorFrequencyCommand(null);
    if (msg.frequency !== undefined) {
      resolved.frequency = std_msgs.msg.Int8.Resolve(msg.frequency)
    }
    else {
      resolved.frequency = new std_msgs.msg.Int8()
    }

    return resolved;
    }
};

module.exports = SetSensorFrequencyCommand;
