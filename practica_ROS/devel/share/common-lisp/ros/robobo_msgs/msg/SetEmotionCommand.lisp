; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude SetEmotionCommand.msg.html

(cl:defclass <SetEmotionCommand> (roslisp-msg-protocol:ros-message)
  ((emotion
    :reader emotion
    :initarg :emotion
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass SetEmotionCommand (<SetEmotionCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEmotionCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEmotionCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<SetEmotionCommand> is deprecated: use robobo_msgs-msg:SetEmotionCommand instead.")))

(cl:ensure-generic-function 'emotion-val :lambda-list '(m))
(cl:defmethod emotion-val ((m <SetEmotionCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:emotion-val is deprecated.  Use robobo_msgs-msg:emotion instead.")
  (emotion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEmotionCommand>) ostream)
  "Serializes a message object of type '<SetEmotionCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'emotion) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEmotionCommand>) istream)
  "Deserializes a message object of type '<SetEmotionCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'emotion) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEmotionCommand>)))
  "Returns string type for a message object of type '<SetEmotionCommand>"
  "robobo_msgs/SetEmotionCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEmotionCommand)))
  "Returns string type for a message object of type 'SetEmotionCommand"
  "robobo_msgs/SetEmotionCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEmotionCommand>)))
  "Returns md5sum for a message object of type '<SetEmotionCommand>"
  "a6515dd33a2228f41cfa2f673f8eb2aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEmotionCommand)))
  "Returns md5sum for a message object of type 'SetEmotionCommand"
  "a6515dd33a2228f41cfa2f673f8eb2aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEmotionCommand>)))
  "Returns full string definition for message of type '<SetEmotionCommand>"
  (cl:format cl:nil "# Commands the robot to show an emotion in the display~%#~%# String of the emotion to show. Posible values:~%# happy, laughing, sad, angry, surprised, normal.~%std_msgs/String emotion~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEmotionCommand)))
  "Returns full string definition for message of type 'SetEmotionCommand"
  (cl:format cl:nil "# Commands the robot to show an emotion in the display~%#~%# String of the emotion to show. Posible values:~%# happy, laughing, sad, angry, surprised, normal.~%std_msgs/String emotion~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEmotionCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'emotion))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEmotionCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEmotionCommand
    (cl:cons ':emotion (emotion msg))
))
