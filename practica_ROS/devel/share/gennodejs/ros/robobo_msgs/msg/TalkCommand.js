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

class TalkCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.text = null;
    }
    else {
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TalkCommand
    // Serialize message field [text]
    bufferOffset = std_msgs.msg.String.serialize(obj.text, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TalkCommand
    let len;
    let data = new TalkCommand(null);
    // Deserialize message field [text]
    data.text = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.text);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/TalkCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7fb91077b93c329c9eeaea1c488c03e0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to talk usin Text-To-Speech
    #
    # Text to be spoken
    std_msgs/String text
    
    
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
    const resolved = new TalkCommand(null);
    if (msg.text !== undefined) {
      resolved.text = std_msgs.msg.String.Resolve(msg.text)
    }
    else {
      resolved.text = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = TalkCommand;
