; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude SetLedCommand.msg.html

(cl:defclass <SetLedCommand> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (color
    :reader color
    :initarg :color
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass SetLedCommand (<SetLedCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLedCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLedCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<SetLedCommand> is deprecated: use robobo_msgs-msg:SetLedCommand instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SetLedCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:id-val is deprecated.  Use robobo_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <SetLedCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:color-val is deprecated.  Use robobo_msgs-msg:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLedCommand>) ostream)
  "Serializes a message object of type '<SetLedCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'id) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'color) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLedCommand>) istream)
  "Deserializes a message object of type '<SetLedCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'id) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'color) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLedCommand>)))
  "Returns string type for a message object of type '<SetLedCommand>"
  "robobo_msgs/SetLedCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLedCommand)))
  "Returns string type for a message object of type 'SetLedCommand"
  "robobo_msgs/SetLedCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLedCommand>)))
  "Returns md5sum for a message object of type '<SetLedCommand>"
  "67de51c92b3fb96ec94dabeed286e658")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLedCommand)))
  "Returns md5sum for a message object of type 'SetLedCommand"
  "67de51c92b3fb96ec94dabeed286e658")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLedCommand>)))
  "Returns full string definition for message of type '<SetLedCommand>"
  (cl:format cl:nil "# Commands the robot to change a led to a predifined color~%#~%# Led identifier; posible values: Front-C, Front-R, ~%# Front-RR, Front-L, Front-LL, Front-C, Back-R, Back-L, all.~%std_msgs/String id~%# Color to set the values to; posible values: white,~%# red, blue, cyan, magenta, yellow, green, orange, off.~%std_msgs/String color~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLedCommand)))
  "Returns full string definition for message of type 'SetLedCommand"
  (cl:format cl:nil "# Commands the robot to change a led to a predifined color~%#~%# Led identifier; posible values: Front-C, Front-R, ~%# Front-RR, Front-L, Front-LL, Front-C, Back-R, Back-L, all.~%std_msgs/String id~%# Color to set the values to; posible values: white,~%# red, blue, cyan, magenta, yellow, green, orange, off.~%std_msgs/String color~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLedCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLedCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLedCommand
    (cl:cons ':id (id msg))
    (cl:cons ':color (color msg))
))
