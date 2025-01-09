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

class SetCameraCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera = null;
    }
    else {
      if (initObj.hasOwnProperty('camera')) {
        this.camera = initObj.camera
      }
      else {
        this.camera = new std_msgs.msg.Int8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetCameraCommand
    // Serialize message field [camera]
    bufferOffset = std_msgs.msg.Int8.serialize(obj.camera, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetCameraCommand
    let len;
    let data = new SetCameraCommand(null);
    // Deserialize message field [camera]
    data.camera = std_msgs.msg.Int8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/SetCameraCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f58deb2ef48d6f096e653df51bb44a22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to change the camera 
    #
    # Identifier of the camera to use:
    # 0 for front camera
    # 1 for back cameras
    std_msgs/Int8 camera   
    
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
    const resolved = new SetCameraCommand(null);
    if (msg.camera !== undefined) {
      resolved.camera = std_msgs.msg.Int8.Resolve(msg.camera)
    }
    else {
      resolved.camera = new std_msgs.msg.Int8()
    }

    return resolved;
    }
};

module.exports = SetCameraCommand;
