; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude SetCameraCommand.msg.html

(cl:defclass <SetCameraCommand> (roslisp-msg-protocol:ros-message)
  ((camera
    :reader camera
    :initarg :camera
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8)))
)

(cl:defclass SetCameraCommand (<SetCameraCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetCameraCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetCameraCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<SetCameraCommand> is deprecated: use robobo_msgs-msg:SetCameraCommand instead.")))

(cl:ensure-generic-function 'camera-val :lambda-list '(m))
(cl:defmethod camera-val ((m <SetCameraCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:camera-val is deprecated.  Use robobo_msgs-msg:camera instead.")
  (camera m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetCameraCommand>) ostream)
  "Serializes a message object of type '<SetCameraCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'camera) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetCameraCommand>) istream)
  "Deserializes a message object of type '<SetCameraCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'camera) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetCameraCommand>)))
  "Returns string type for a message object of type '<SetCameraCommand>"
  "robobo_msgs/SetCameraCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetCameraCommand)))
  "Returns string type for a message object of type 'SetCameraCommand"
  "robobo_msgs/SetCameraCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetCameraCommand>)))
  "Returns md5sum for a message object of type '<SetCameraCommand>"
  "f58deb2ef48d6f096e653df51bb44a22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetCameraCommand)))
  "Returns md5sum for a message object of type 'SetCameraCommand"
  "f58deb2ef48d6f096e653df51bb44a22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetCameraCommand>)))
  "Returns full string definition for message of type '<SetCameraCommand>"
  (cl:format cl:nil "# Commands the robot to change the camera ~%#~%# Identifier of the camera to use:~%# 0 for front camera~%# 1 for back cameras~%std_msgs/Int8 camera   ~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetCameraCommand)))
  "Returns full string definition for message of type 'SetCameraCommand"
  (cl:format cl:nil "# Commands the robot to change the camera ~%#~%# Identifier of the camera to use:~%# 0 for front camera~%# 1 for back cameras~%std_msgs/Int8 camera   ~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetCameraCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'camera))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetCameraCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'SetCameraCommand
    (cl:cons ':camera (camera msg))
))
