; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude MovePanTiltCommand.msg.html

(cl:defclass <MovePanTiltCommand> (roslisp-msg-protocol:ros-message)
  ((panPos
    :reader panPos
    :initarg :panPos
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16))
   (panSpeed
    :reader panSpeed
    :initarg :panSpeed
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8))
   (panUnlockId
    :reader panUnlockId
    :initarg :panUnlockId
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16))
   (tiltPos
    :reader tiltPos
    :initarg :tiltPos
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16))
   (tiltSpeed
    :reader tiltSpeed
    :initarg :tiltSpeed
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8))
   (tiltUnlockId
    :reader tiltUnlockId
    :initarg :tiltUnlockId
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16)))
)

(cl:defclass MovePanTiltCommand (<MovePanTiltCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePanTiltCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePanTiltCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<MovePanTiltCommand> is deprecated: use robobo_msgs-msg:MovePanTiltCommand instead.")))

(cl:ensure-generic-function 'panPos-val :lambda-list '(m))
(cl:defmethod panPos-val ((m <MovePanTiltCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:panPos-val is deprecated.  Use robobo_msgs-msg:panPos instead.")
  (panPos m))

(cl:ensure-generic-function 'panSpeed-val :lambda-list '(m))
(cl:defmethod panSpeed-val ((m <MovePanTiltCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:panSpeed-val is deprecated.  Use robobo_msgs-msg:panSpeed instead.")
  (panSpeed m))

(cl:ensure-generic-function 'panUnlockId-val :lambda-list '(m))
(cl:defmethod panUnlockId-val ((m <MovePanTiltCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:panUnlockId-val is deprecated.  Use robobo_msgs-msg:panUnlockId instead.")
  (panUnlockId m))

(cl:ensure-generic-function 'tiltPos-val :lambda-list '(m))
(cl:defmethod tiltPos-val ((m <MovePanTiltCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:tiltPos-val is deprecated.  Use robobo_msgs-msg:tiltPos instead.")
  (tiltPos m))

(cl:ensure-generic-function 'tiltSpeed-val :lambda-list '(m))
(cl:defmethod tiltSpeed-val ((m <MovePanTiltCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:tiltSpeed-val is deprecated.  Use robobo_msgs-msg:tiltSpeed instead.")
  (tiltSpeed m))

(cl:ensure-generic-function 'tiltUnlockId-val :lambda-list '(m))
(cl:defmethod tiltUnlockId-val ((m <MovePanTiltCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:tiltUnlockId-val is deprecated.  Use robobo_msgs-msg:tiltUnlockId instead.")
  (tiltUnlockId m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePanTiltCommand>) ostream)
  "Serializes a message object of type '<MovePanTiltCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'panPos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'panSpeed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'panUnlockId) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tiltPos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tiltSpeed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'tiltUnlockId) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePanTiltCommand>) istream)
  "Deserializes a message object of type '<MovePanTiltCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'panPos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'panSpeed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'panUnlockId) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tiltPos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tiltSpeed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'tiltUnlockId) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePanTiltCommand>)))
  "Returns string type for a message object of type '<MovePanTiltCommand>"
  "robobo_msgs/MovePanTiltCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePanTiltCommand)))
  "Returns string type for a message object of type 'MovePanTiltCommand"
  "robobo_msgs/MovePanTiltCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePanTiltCommand>)))
  "Returns md5sum for a message object of type '<MovePanTiltCommand>"
  "e02b68971ce7a0ff6df448c278f194a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePanTiltCommand)))
  "Returns md5sum for a message object of type 'MovePanTiltCommand"
  "e02b68971ce7a0ff6df448c278f194a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePanTiltCommand>)))
  "Returns full string definition for message of type '<MovePanTiltCommand>"
  (cl:format cl:nil "# Commands the robot to move it's pan and/or~%# tilt. It won't move unless the UnlockId is ~%# different than 0.~%#~%# Desired pan position. Range 11 .. 343~%std_msgs/Int16 panPos~%# Desired pan speed~%std_msgs/Int8 panSpeed~%# Identifier for end-of-movement notification~%std_msgs/Int16 panUnlockId~%# Desired tilt position. Range 0 .. 100~%std_msgs/Int16 tiltPos~%# Desired tilt speed~%std_msgs/Int8 tiltSpeed~%# Identifier for end-of-movement notification~%std_msgs/Int16 tiltUnlockId~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePanTiltCommand)))
  "Returns full string definition for message of type 'MovePanTiltCommand"
  (cl:format cl:nil "# Commands the robot to move it's pan and/or~%# tilt. It won't move unless the UnlockId is ~%# different than 0.~%#~%# Desired pan position. Range 11 .. 343~%std_msgs/Int16 panPos~%# Desired pan speed~%std_msgs/Int8 panSpeed~%# Identifier for end-of-movement notification~%std_msgs/Int16 panUnlockId~%# Desired tilt position. Range 0 .. 100~%std_msgs/Int16 tiltPos~%# Desired tilt speed~%std_msgs/Int8 tiltSpeed~%# Identifier for end-of-movement notification~%std_msgs/Int16 tiltUnlockId~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePanTiltCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'panPos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'panSpeed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'panUnlockId))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tiltPos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tiltSpeed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'tiltUnlockId))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePanTiltCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePanTiltCommand
    (cl:cons ':panPos (panPos msg))
    (cl:cons ':panSpeed (panSpeed msg))
    (cl:cons ':panUnlockId (panUnlockId msg))
    (cl:cons ':tiltPos (tiltPos msg))
    (cl:cons ':tiltSpeed (tiltSpeed msg))
    (cl:cons ':tiltUnlockId (tiltUnlockId msg))
))
