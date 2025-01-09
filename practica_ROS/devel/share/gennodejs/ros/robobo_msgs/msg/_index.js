
"use strict";

let SetLedCommand = require('./SetLedCommand.js');
let QrCode = require('./QrCode.js');
let SetSensorFrequencyCommand = require('./SetSensorFrequencyCommand.js');
let Fling = require('./Fling.js');
let SetEmotionCommand = require('./SetEmotionCommand.js');
let Wheels = require('./Wheels.js');
let IRs = require('./IRs.js');
let OrientationEuler = require('./OrientationEuler.js');
let Tap = require('./Tap.js');
let Led = require('./Led.js');
let MovePanTiltCommand = require('./MovePanTiltCommand.js');
let QrCodeChange = require('./QrCodeChange.js');
let ResetWheelsCommand = require('./ResetWheelsCommand.js');
let SetCameraCommand = require('./SetCameraCommand.js');
let ModuleControlCommand = require('./ModuleControlCommand.js');
let PlaySoundCommand = require('./PlaySoundCommand.js');
let Blob = require('./Blob.js');
let TalkCommand = require('./TalkCommand.js');
let MoveWheelsCommand = require('./MoveWheelsCommand.js');
let SetBlobCommand = require('./SetBlobCommand.js');
let Lane = require('./Lane.js');

module.exports = {
  SetLedCommand: SetLedCommand,
  QrCode: QrCode,
  SetSensorFrequencyCommand: SetSensorFrequencyCommand,
  Fling: Fling,
  SetEmotionCommand: SetEmotionCommand,
  Wheels: Wheels,
  IRs: IRs,
  OrientationEuler: OrientationEuler,
  Tap: Tap,
  Led: Led,
  MovePanTiltCommand: MovePanTiltCommand,
  QrCodeChange: QrCodeChange,
  ResetWheelsCommand: ResetWheelsCommand,
  SetCameraCommand: SetCameraCommand,
  ModuleControlCommand: ModuleControlCommand,
  PlaySoundCommand: PlaySoundCommand,
  Blob: Blob,
  TalkCommand: TalkCommand,
  MoveWheelsCommand: MoveWheelsCommand,
  SetBlobCommand: SetBlobCommand,
  Lane: Lane,
};
