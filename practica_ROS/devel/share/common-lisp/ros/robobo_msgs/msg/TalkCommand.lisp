; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude TalkCommand.msg.html

(cl:defclass <TalkCommand> (roslisp-msg-protocol:ros-message)
  ((text
    :reader text
    :initarg :text
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass TalkCommand (<TalkCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TalkCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TalkCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<TalkCommand> is deprecated: use robobo_msgs-msg:TalkCommand instead.")))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <TalkCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:text-val is deprecated.  Use robobo_msgs-msg:text instead.")
  (text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TalkCommand>) ostream)
  "Serializes a message object of type '<TalkCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'text) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TalkCommand>) istream)
  "Deserializes a message object of type '<TalkCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'text) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TalkCommand>)))
  "Returns string type for a message object of type '<TalkCommand>"
  "robobo_msgs/TalkCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TalkCommand)))
  "Returns string type for a message object of type 'TalkCommand"
  "robobo_msgs/TalkCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TalkCommand>)))
  "Returns md5sum for a message object of type '<TalkCommand>"
  "7fb91077b93c329c9eeaea1c488c03e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TalkCommand)))
  "Returns md5sum for a message object of type 'TalkCommand"
  "7fb91077b93c329c9eeaea1c488c03e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TalkCommand>)))
  "Returns full string definition for message of type '<TalkCommand>"
  (cl:format cl:nil "# Commands the robot to talk usin Text-To-Speech~%#~%# Text to be spoken~%std_msgs/String text~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TalkCommand)))
  "Returns full string definition for message of type 'TalkCommand"
  (cl:format cl:nil "# Commands the robot to talk usin Text-To-Speech~%#~%# Text to be spoken~%std_msgs/String text~%~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TalkCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'text))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TalkCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'TalkCommand
    (cl:cons ':text (text msg))
))
