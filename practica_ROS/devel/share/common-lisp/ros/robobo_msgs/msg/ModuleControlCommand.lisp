; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude ModuleControlCommand.msg.html

(cl:defclass <ModuleControlCommand> (roslisp-msg-protocol:ros-message)
  ((module_name
    :reader module_name
    :initarg :module_name
    :type cl:string
    :initform "")
   (on
    :reader on
    :initarg :on
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ModuleControlCommand (<ModuleControlCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ModuleControlCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ModuleControlCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<ModuleControlCommand> is deprecated: use robobo_msgs-msg:ModuleControlCommand instead.")))

(cl:ensure-generic-function 'module_name-val :lambda-list '(m))
(cl:defmethod module_name-val ((m <ModuleControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:module_name-val is deprecated.  Use robobo_msgs-msg:module_name instead.")
  (module_name m))

(cl:ensure-generic-function 'on-val :lambda-list '(m))
(cl:defmethod on-val ((m <ModuleControlCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:on-val is deprecated.  Use robobo_msgs-msg:on instead.")
  (on m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ModuleControlCommand>) ostream)
  "Serializes a message object of type '<ModuleControlCommand>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'module_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'module_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'on) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ModuleControlCommand>) istream)
  "Deserializes a message object of type '<ModuleControlCommand>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'module_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'module_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'on) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ModuleControlCommand>)))
  "Returns string type for a message object of type '<ModuleControlCommand>"
  "robobo_msgs/ModuleControlCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ModuleControlCommand)))
  "Returns string type for a message object of type 'ModuleControlCommand"
  "robobo_msgs/ModuleControlCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ModuleControlCommand>)))
  "Returns md5sum for a message object of type '<ModuleControlCommand>"
  "e6a9b409247a54586771369e8f259611")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ModuleControlCommand)))
  "Returns md5sum for a message object of type 'ModuleControlCommand"
  "e6a9b409247a54586771369e8f259611")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ModuleControlCommand>)))
  "Returns full string definition for message of type '<ModuleControlCommand>"
  (cl:format cl:nil "# Commands the robot to turn on or off a module~%#~%# Name of the module~%string module_name~%# A bool to represent if the module should be turned~%# on or off (true for on and false for off)~%bool on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ModuleControlCommand)))
  "Returns full string definition for message of type 'ModuleControlCommand"
  (cl:format cl:nil "# Commands the robot to turn on or off a module~%#~%# Name of the module~%string module_name~%# A bool to represent if the module should be turned~%# on or off (true for on and false for off)~%bool on~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ModuleControlCommand>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'module_name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ModuleControlCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'ModuleControlCommand
    (cl:cons ':module_name (module_name msg))
    (cl:cons ':on (on msg))
))
