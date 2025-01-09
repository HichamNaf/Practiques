; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-srv)


;//! \htmlinclude SetLoad-request.msg.html

(cl:defclass <SetLoad-request> (roslisp-msg-protocol:ros-message)
  ((power_load
    :reader power_load
    :initarg :power_load
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetLoad-request (<SetLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-srv:<SetLoad-request> is deprecated: use robobo_msgs-srv:SetLoad-request instead.")))

(cl:ensure-generic-function 'power_load-val :lambda-list '(m))
(cl:defmethod power_load-val ((m <SetLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-srv:power_load-val is deprecated.  Use robobo_msgs-srv:power_load instead.")
  (power_load m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLoad-request>) ostream)
  "Serializes a message object of type '<SetLoad-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'power_load))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLoad-request>) istream)
  "Deserializes a message object of type '<SetLoad-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power_load) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLoad-request>)))
  "Returns string type for a service object of type '<SetLoad-request>"
  "robobo_msgs/SetLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLoad-request)))
  "Returns string type for a service object of type 'SetLoad-request"
  "robobo_msgs/SetLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLoad-request>)))
  "Returns md5sum for a message object of type '<SetLoad-request>"
  "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLoad-request)))
  "Returns md5sum for a message object of type 'SetLoad-request"
  "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLoad-request>)))
  "Returns full string definition for message of type '<SetLoad-request>"
  (cl:format cl:nil "float64 power_load~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLoad-request)))
  "Returns full string definition for message of type 'SetLoad-request"
  (cl:format cl:nil "float64 power_load~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLoad-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLoad-request
    (cl:cons ':power_load (power_load msg))
))
;//! \htmlinclude SetLoad-response.msg.html

(cl:defclass <SetLoad-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetLoad-response (<SetLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-srv:<SetLoad-response> is deprecated: use robobo_msgs-srv:SetLoad-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SetLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-srv:result-val is deprecated.  Use robobo_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLoad-response>) ostream)
  "Serializes a message object of type '<SetLoad-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLoad-response>) istream)
  "Deserializes a message object of type '<SetLoad-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLoad-response>)))
  "Returns string type for a service object of type '<SetLoad-response>"
  "robobo_msgs/SetLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLoad-response)))
  "Returns string type for a service object of type 'SetLoad-response"
  "robobo_msgs/SetLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLoad-response>)))
  "Returns md5sum for a message object of type '<SetLoad-response>"
  "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLoad-response)))
  "Returns md5sum for a message object of type 'SetLoad-response"
  "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLoad-response>)))
  "Returns full string definition for message of type '<SetLoad-response>"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLoad-response)))
  "Returns full string definition for message of type 'SetLoad-response"
  (cl:format cl:nil "bool result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLoad-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLoad-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetLoad)))
  'SetLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetLoad)))
  'SetLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLoad)))
  "Returns string type for a service object of type '<SetLoad>"
  "robobo_msgs/SetLoad")