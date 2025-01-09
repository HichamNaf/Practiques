; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude ResetWheelsCommand.msg.html

(cl:defclass <ResetWheelsCommand> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ResetWheelsCommand (<ResetWheelsCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetWheelsCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetWheelsCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<ResetWheelsCommand> is deprecated: use robobo_msgs-msg:ResetWheelsCommand instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetWheelsCommand>) ostream)
  "Serializes a message object of type '<ResetWheelsCommand>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetWheelsCommand>) istream)
  "Deserializes a message object of type '<ResetWheelsCommand>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetWheelsCommand>)))
  "Returns string type for a message object of type '<ResetWheelsCommand>"
  "robobo_msgs/ResetWheelsCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetWheelsCommand)))
  "Returns string type for a message object of type 'ResetWheelsCommand"
  "robobo_msgs/ResetWheelsCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetWheelsCommand>)))
  "Returns md5sum for a message object of type '<ResetWheelsCommand>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetWheelsCommand)))
  "Returns md5sum for a message object of type 'ResetWheelsCommand"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetWheelsCommand>)))
  "Returns full string definition for message of type '<ResetWheelsCommand>"
  (cl:format cl:nil "# Commands the robot to reset the wheels encoders~%# back to zero. This message its empty.~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetWheelsCommand)))
  "Returns full string definition for message of type 'ResetWheelsCommand"
  (cl:format cl:nil "# Commands the robot to reset the wheels encoders~%# back to zero. This message its empty.~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetWheelsCommand>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetWheelsCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetWheelsCommand
))
