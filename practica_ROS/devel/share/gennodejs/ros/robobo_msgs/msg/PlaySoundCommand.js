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

class PlaySoundCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sound = null;
    }
    else {
      if (initObj.hasOwnProperty('sound')) {
        this.sound = initObj.sound
      }
      else {
        this.sound = new std_msgs.msg.String();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlaySoundCommand
    // Serialize message field [sound]
    bufferOffset = std_msgs.msg.String.serialize(obj.sound, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlaySoundCommand
    let len;
    let data = new PlaySoundCommand(null);
    // Deserialize message field [sound]
    data.sound = std_msgs.msg.String.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.String.getMessageSize(object.sound);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/PlaySoundCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0935a125722801704c8ff8170000156e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Commands the robot to play a sound
    #
    # Plays a predefined sound. Posible 
    # variables: moan, purr, angry, 
    # approve, disapprove, discomfort, 
    # doubtful, laugh, likes, mumble, 
    # ouch, thinking, various
    std_msgs/String sound
    
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
    const resolved = new PlaySoundCommand(null);
    if (msg.sound !== undefined) {
      resolved.sound = std_msgs.msg.String.Resolve(msg.sound)
    }
    else {
      resolved.sound = new std_msgs.msg.String()
    }

    return resolved;
    }
};

module.exports = PlaySoundCommand;
