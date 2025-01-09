// Auto-generated. Do not edit!

// (in-package robobo_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetModuleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.moduleName = null;
      this.moduleState = null;
    }
    else {
      if (initObj.hasOwnProperty('moduleName')) {
        this.moduleName = initObj.moduleName
      }
      else {
        this.moduleName = new std_msgs.msg.String();
      }
      if (initObj.hasOwnProperty('moduleState')) {
        this.moduleState = initObj.moduleState
      }
      else {
        this.moduleState = new std_msgs.msg.Bool();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetModuleRequest
    // Serialize message field [moduleName]
    bufferOffset = std_msgs.msg.String.serialize(obj.moduleName, buffer, bufferOffset);
    // Serialize message field [moduleState]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.moduleState, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetModuleRequest
    let len;
    let data = new SetModuleRequest(null);
    // Deserialize message field [moduleName]
    data.moduleName = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    // Deserialize message field [moduleState]
    data.moduleState = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.moduleName);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robobo_msgs/SetModuleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5983e1be243acc0d1b2471a384feece7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to start/stop a module
    #
    # Module name; posible values: tag, object-detection, lane-detection 
    # State: true on, false off
    std_msgs/String moduleName
    std_msgs/Bool moduleState
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    ================================================================================
    MSG: std_msgs/Bool
    bool data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetModuleRequest(null);
    if (msg.moduleName !== undefined) {
      resolved.moduleName = std_msgs.msg.String.Resolve(msg.moduleName)
    }
    else {
      resolved.moduleName = new std_msgs.msg.String()
    }

    if (msg.moduleState !== undefined) {
      resolved.moduleState = std_msgs.msg.Bool.Resolve(msg.moduleState)
    }
    else {
      resolved.moduleState = new std_msgs.msg.Bool()
    }

    return resolved;
    }
};

class SetModuleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.error = null;
    }
    else {
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = new std_msgs.msg.Int8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetModuleResponse
    // Serialize message field [error]
    bufferOffset = std_msgs.msg.Int8.serialize(obj.error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetModuleResponse
    let len;
    let data = new SetModuleResponse(null);
    // Deserialize message field [error]
    data.error = std_msgs.msg.Int8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robobo_msgs/SetModuleResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b41202f44ec8802b6a66ae15859258a4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Int8 error
    
    
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
    const resolved = new SetModuleResponse(null);
    if (msg.error !== undefined) {
      resolved.error = std_msgs.msg.Int8.Resolve(msg.error)
    }
    else {
      resolved.error = new std_msgs.msg.Int8()
    }

    return resolved;
    }
};

module.exports = {
  Request: SetModuleRequest,
  Response: SetModuleResponse,
  md5sum() { return 'd1ff912db9829e756961c386739c3bd2'; },
  datatype() { return 'robobo_msgs/SetModule'; }
};
