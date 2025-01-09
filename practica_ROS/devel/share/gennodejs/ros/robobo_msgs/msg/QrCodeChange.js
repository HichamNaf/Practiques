// Auto-generated. Do not edit!

// (in-package robobo_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let opencv_apps = _finder('opencv_apps');

//-----------------------------------------------------------

class QrCodeChange {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.distance = null;
      this.center = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new opencv_apps.msg.Point2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QrCodeChange
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float32(obj.distance, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = opencv_apps.msg.Point2D.serialize(obj.center, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QrCodeChange
    let len;
    let data = new QrCodeChange(null);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = opencv_apps.msg.Point2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.id);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robobo_msgs/QrCodeChange';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad90adff5581c7da685be8171e59dbb0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a change (appearance and disappearance) of 
    # a QR Code
    #
    # Text of the QR Code
    string id
    # Distance between the first result point and the center
    # of the code 
    float32 distance
    # Coordinate of the center of the code
    opencv_apps/Point2D center
    
    ================================================================================
    MSG: opencv_apps/Point2D
    float64 x
    float64 y
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new QrCodeChange(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.center !== undefined) {
      resolved.center = opencv_apps.msg.Point2D.Resolve(msg.center)
    }
    else {
      resolved.center = new opencv_apps.msg.Point2D()
    }

    return resolved;
    }
};

module.exports = QrCodeChange;
