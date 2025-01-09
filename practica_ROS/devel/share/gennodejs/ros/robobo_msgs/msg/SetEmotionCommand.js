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

class SetEmotionCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.emotion = null;
    }
    else {
      if (initObj.hasOwnProperty('emotion')) {
        this.emotion = initObj.emotion
      }
      else {
        this.emotion = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetEmotionCommand
    // Serialize message field [emotion]
    bufferOffset = std_msgs.msg.String.serialize(obj.emotion, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetEmotionCommand
    let len;
    let data = new SetEmotionCommand(null);
    // Deserialize message field [emotion]
    data.emotion = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.emotion);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/SetEmotionCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6515dd33a2228f41cfa2f673f8eb2aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to show an emotion in the display
    #
    # String of the emotion to show. Posible values:
    # happy, laughing, sad, angry, surprised, normal.
    std_msgs/String emotion
    
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
    const resolved = new SetEmotionCommand(null);
    if (msg.emotion !== undefined) {
      resolved.emotion = std_msgs.msg.String.Resolve(msg.emotion)
    }
    else {
      resolved.emotion = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = SetEmotionCommand;
