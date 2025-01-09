; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-srv)


;//! \htmlinclude SetModule-request.msg.html

(cl:defclass <SetModule-request> (roslisp-msg-protocol:ros-message)
  ((moduleName
    :reader moduleName
    :initarg :moduleName
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (moduleState
    :reader moduleState
    :initarg :moduleState
    :type std_msgs-msg:Bool
    :initform (cl:make-instance 'std_msgs-msg:Bool)))
)

(cl:defclass SetModule-request (<SetModule-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetModule-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetModule-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-srv:<SetModule-request> is deprecated: use robobo_msgs-srv:SetModule-request instead.")))

(cl:ensure-generic-function 'moduleName-val :lambda-list '(m))
(cl:defmethod moduleName-val ((m <SetModule-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-srv:moduleName-val is deprecated.  Use robobo_msgs-srv:moduleName instead.")
  (moduleName m))

(cl:ensure-generic-function 'moduleState-val :lambda-list '(m))
(cl:defmethod moduleState-val ((m <SetModule-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-srv:moduleState-val is deprecated.  Use robobo_msgs-srv:moduleState instead.")
  (moduleState m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetModule-request>) ostream)
  "Serializes a message object of type '<SetModule-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'moduleName) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'moduleState) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetModule-request>) istream)
  "Deserializes a message object of type '<SetModule-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'moduleName) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'moduleState) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetModule-request>)))
  "Returns string type for a service object of type '<SetModule-request>"
  "robobo_msgs/SetModuleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetModule-request)))
  "Returns string type for a service object of type 'SetModule-request"
  "robobo_msgs/SetModuleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetModule-request>)))
  "Returns md5sum for a message object of type '<SetModule-request>"
  "d1ff912db9829e756961c386739c3bd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetModule-request)))
  "Returns md5sum for a message object of type 'SetModule-request"
  "d1ff912db9829e756961c386739c3bd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetModule-request>)))
  "Returns full string definition for message of type '<SetModule-request>"
  (cl:format cl:nil "# Commands the robot to start/stop a module~%#~%# Module name; posible values: tag, object-detection, lane-detection ~%# State: true on, false off~%std_msgs/String moduleName~%std_msgs/Bool moduleState~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetModule-request)))
  "Returns full string definition for message of type 'SetModule-request"
  (cl:format cl:nil "# Commands the robot to start/stop a module~%#~%# Module name; posible values: tag, object-detection, lane-detection ~%# State: true on, false off~%std_msgs/String moduleName~%std_msgs/Bool moduleState~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetModule-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'moduleName))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'moduleState))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetModule-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetModule-request
    (cl:cons ':moduleName (moduleName msg))
    (cl:cons ':moduleState (moduleState msg))
))
;//! \htmlinclude SetModule-response.msg.html

(cl:defclass <SetModule-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type std_msgs-msg:Int8
    :initform (cl:make-instance 'std_msgs-msg:Int8)))
)

(cl:defclass SetModule-response (<SetModule-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetModule-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetModule-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-srv:<SetModule-response> is deprecated: use robobo_msgs-srv:SetModule-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <SetModule-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-srv:error-val is deprecated.  Use robobo_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetModule-response>) ostream)
  "Serializes a message object of type '<SetModule-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetModule-response>) istream)
  "Deserializes a message object of type '<SetModule-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetModule-response>)))
  "Returns string type for a service object of type '<SetModule-response>"
  "robobo_msgs/SetModuleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetModule-response)))
  "Returns string type for a service object of type 'SetModule-response"
  "robobo_msgs/SetModuleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetModule-response>)))
  "Returns md5sum for a message object of type '<SetModule-response>"
  "d1ff912db9829e756961c386739c3bd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetModule-response)))
  "Returns md5sum for a message object of type 'SetModule-response"
  "d1ff912db9829e756961c386739c3bd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetModule-response>)))
  "Returns full string definition for message of type '<SetModule-response>"
  (cl:format cl:nil "std_msgs/Int8 error~%~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetModule-response)))
  "Returns full string definition for message of type 'SetModule-response"
  (cl:format cl:nil "std_msgs/Int8 error~%~%~%================================================================================~%MSG: std_msgs/Int8~%int8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetModule-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetModule-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetModule-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetModule)))
  'SetModule-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetModule)))
  'SetModule-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetModule)))
  "Returns string type for a service object of type '<SetModule>"
  "robobo_msgs/SetModule")