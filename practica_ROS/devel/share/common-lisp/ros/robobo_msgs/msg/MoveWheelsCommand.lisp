; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude MoveWheelsCommand.msg.html

(cl:defclass <MoveWheelsCommand> (roslisp-msg-protocol:ros-message)
  ((lspeed
    :reader lspeed
    :initarg :lspeed
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8))
   (rspeed
    :reader rspeed
    :initarg :rspeed
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8))
   (time
    :reader time
    :initarg :time
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (unlockid
    :reader unlockid
    :initarg :unlockid
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16)))
)

(cl:defclass MoveWheelsCommand (<MoveWheelsCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveWheelsCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveWheelsCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<MoveWheelsCommand> is deprecated: use robobo_msgs-msg:MoveWheelsCommand instead.")))

(cl:ensure-generic-function 'lspeed-val :lambda-list '(m))
(cl:defmethod lspeed-val ((m <MoveWheelsCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:lspeed-val is deprecated.  Use robobo_msgs-msg:lspeed instead.")
  (lspeed m))

(cl:ensure-generic-function 'rspeed-val :lambda-list '(m))
(cl:defmethod rspeed-val ((m <MoveWheelsCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:rspeed-val is deprecated.  Use robobo_msgs-msg:rspeed instead.")
  (rspeed m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <MoveWheelsCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:time-val is deprecated.  Use robobo_msgs-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'unlockid-val :lambda-list '(m))
(cl:defmethod unlockid-val ((m <MoveWheelsCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:unlockid-val is deprecated.  Use robobo_msgs-msg:unlockid instead.")
  (unlockid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveWheelsCommand>) ostream)
  "Serializes a message object of type '<MoveWheelsCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'lspeed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rspeed) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'time) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'unlockid) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveWheelsCommand>) istream)
  "Deserializes a message object of type '<MoveWheelsCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'lspeed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rspeed) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'time) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'unlockid) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveWheelsCommand>)))
  "Returns string type for a message object of type '<MoveWheelsCommand>"
  "robobo_msgs/MoveWheelsCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveWheelsCommand)))
  "Returns string type for a message object of type 'MoveWheelsCommand"
  "robobo_msgs/MoveWheelsCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveWheelsCommand>)))
  "Returns md5sum for a message object of type '<MoveWheelsCommand>"
  "e266bff9487ab0f7db9d11321bda62d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveWheelsCommand)))
  "Returns md5sum for a message object of type 'MoveWheelsCommand"
  "e266bff9487ab0f7db9d11321bda62d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveWheelsCommand>)))
  "Returns full string definition for message of type '<MoveWheelsCommand>"
  (cl:format cl:nil "# Commands the robot to move the wheels for~%# an specific time~%#~%# Left wheel speed~%std_msgs/Int8 lspeed~%# Right wheel speed~%std_msgs/Int8 rspeed~%# Time in miliseconds~%std_msgs/Int32 time~%# Identifier for end-of-movement notification~%std_msgs/Int16 unlockid~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveWheelsCommand)))
  "Returns full string definition for message of type 'MoveWheelsCommand"
  (cl:format cl:nil "# Commands the robot to move the wheels for~%# an specific time~%#~%# Left wheel speed~%std_msgs/Int8 lspeed~%# Right wheel speed~%std_msgs/Int8 rspeed~%# Time in miliseconds~%std_msgs/Int32 time~%# Identifier for end-of-movement notification~%std_msgs/Int16 unlockid~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveWheelsCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'lspeed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rspeed))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'time))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'unlockid))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveWheelsCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveWheelsCommand
    (cl:cons ':lspeed (lspeed msg))
    (cl:cons ':rspeed (rspeed msg))
    (cl:cons ':time (time msg))
    (cl:cons ':unlockid (unlockid msg))
))
