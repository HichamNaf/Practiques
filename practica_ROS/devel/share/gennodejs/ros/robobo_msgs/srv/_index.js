
"use strict";

let PlaySound = require('./PlaySound.js')
let SetLoad = require('./SetLoad.js')
let ResetWheels = require('./ResetWheels.js')
let SetLed = require('./SetLed.js')
let MovePanTilt = require('./MovePanTilt.js')
let SetModule = require('./SetModule.js')
let MoveWheels = require('./MoveWheels.js')
let Talk = require('./Talk.js')
let SetCamera = require('./SetCamera.js')
let SetEmotion = require('./SetEmotion.js')
let SetSensorFrequency = require('./SetSensorFrequency.js')

module.exports = {
  PlaySound: PlaySound,
  SetLoad: SetLoad,
  ResetWheels: ResetWheels,
  SetLed: SetLed,
  MovePanTilt: MovePanTilt,
  SetModule: SetModule,
  MoveWheels: MoveWheels,
  Talk: Talk,
  SetCamera: SetCamera,
  SetEmotion: SetEmotion,
  SetSensorFrequency: SetSensorFrequency,
};
