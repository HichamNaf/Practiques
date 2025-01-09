; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude PlaySoundCommand.msg.html

(cl:defclass <PlaySoundCommand> (roslisp-msg-protocol:ros-message)
  ((sound
    :reader sound
    :initarg :sound
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass PlaySoundCommand (<PlaySoundCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlaySoundCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlaySoundCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<PlaySoundCommand> is deprecated: use robobo_msgs-msg:PlaySoundCommand instead.")))

(cl:ensure-generic-function 'sound-val :lambda-list '(m))
(cl:defmethod sound-val ((m <PlaySoundCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:sound-val is deprecated.  Use robobo_msgs-msg:sound instead.")
  (sound m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlaySoundCommand>) ostream)
  "Serializes a message object of type '<PlaySoundCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sound) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlaySoundCommand>) istream)
  "Deserializes a message object of type '<PlaySoundCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sound) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlaySoundCommand>)))
  "Returns string type for a message object of type '<PlaySoundCommand>"
  "robobo_msgs/PlaySoundCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlaySoundCommand)))
  "Returns string type for a message object of type 'PlaySoundCommand"
  "robobo_msgs/PlaySoundCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlaySoundCommand>)))
  "Returns md5sum for a message object of type '<PlaySoundCommand>"
  "0935a125722801704c8ff8170000156e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlaySoundCommand)))
  "Returns md5sum for a message object of type 'PlaySoundCommand"
  "0935a125722801704c8ff8170000156e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlaySoundCommand>)))
  "Returns full string definition for message of type '<PlaySoundCommand>"
  (cl:format cl:nil "# Commands the robot to play a sound~%#~%# Plays a predefined sound. Posible ~%# variables: moan, purr, angry, ~%# approve, disapprove, discomfort, ~%# doubtful, laugh, likes, mumble, ~%# ouch, thinking, various~%std_msgs/String sound~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlaySoundCommand)))
  "Returns full string definition for message of type 'PlaySoundCommand"
  (cl:format cl:nil "# Commands the robot to play a sound~%#~%# Plays a predefined sound. Posible ~%# variables: moan, purr, angry, ~%# approve, disapprove, discomfort, ~%# doubtful, laugh, likes, mumble, ~%# ouch, thinking, various~%std_msgs/String sound~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlaySoundCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sound))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlaySoundCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'PlaySoundCommand
    (cl:cons ':sound (sound msg))
))
