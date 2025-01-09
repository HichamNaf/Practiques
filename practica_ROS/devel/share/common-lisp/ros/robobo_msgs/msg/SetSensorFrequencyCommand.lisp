; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude SetSensorFrequencyCommand.msg.html

(cl:defclass <SetSensorFrequencyCommand> (roslisp-msg-protocol:ros-message)
  ((frequency
    :reader frequency
    :initarg :frequency
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8)))
)

(cl:defclass SetSensorFrequencyCommand (<SetSensorFrequencyCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSensorFrequencyCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSensorFrequencyCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<SetSensorFrequencyCommand> is deprecated: use robobo_msgs-msg:SetSensorFrequencyCommand instead.")))

(cl:ensure-generic-function 'frequency-val :lambda-list '(m))
(cl:defmethod frequency-val ((m <SetSensorFrequencyCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:frequency-val is deprecated.  Use robobo_msgs-msg:frequency instead.")
  (frequency m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSensorFrequencyCommand>) ostream)
  "Serializes a message object of type '<SetSensorFrequencyCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'frequency) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSensorFrequencyCommand>) istream)
  "Deserializes a message object of type '<SetSensorFrequencyCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'frequency) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSensorFrequencyCommand>)))
  "Returns string type for a message object of type '<SetSensorFrequencyCommand>"
  "robobo_msgs/SetSensorFrequencyCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSensorFrequencyCommand)))
  "Returns string type for a message object of type 'SetSensorFrequencyCommand"
  "robobo_msgs/SetSensorFrequencyCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSensorFrequencyCommand>)))
  "Returns md5sum for a message object of type '<SetSensorFrequencyCommand>"
  "b96ba08af418a90a3d51c1440b29c5db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSensorFrequencyCommand)))
  "Returns md5sum for a message object of type 'SetSensorFrequencyCommand"
  "b96ba08af418a90a3d51c1440b29c5db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSensorFrequencyCommand>)))
  "Returns full string definition for message of type '<SetSensorFrequencyCommand>"
  (cl:format cl:nil "# Commands the robot to change the frequency of notifications~%# of all sensors of the robot~%#~%# Integer representing the frequency; posible values: ~%# 0 for LOW~%# 1 for NORMAL~%# 2 for HIGH~%# 3 for MAX~%std_msgs/Int8 frequency   ~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSensorFrequencyCommand)))
  "Returns full string definition for message of type 'SetSensorFrequencyCommand"
  (cl:format cl:nil "# Commands the robot to change the frequency of notifications~%# of all sensors of the robot~%#~%# Integer representing the frequency; posible values: ~%# 0 for LOW~%# 1 for NORMAL~%# 2 for HIGH~%# 3 for MAX~%std_msgs/Int8 frequency   ~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSensorFrequencyCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'frequency))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSensorFrequencyCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSensorFrequencyCommand
    (cl:cons ':frequency (frequency msg))
))
