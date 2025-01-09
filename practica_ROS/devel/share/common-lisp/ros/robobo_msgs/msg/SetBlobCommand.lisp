; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude SetBlobCommand.msg.html

(cl:defclass <SetBlobCommand> (roslisp-msg-protocol:ros-message)
  ((red
    :reader red
    :initarg :red
    :type cl:boolean
    :initform cl:nil)
   (green
    :reader green
    :initarg :green
    :type cl:boolean
    :initform cl:nil)
   (blue
    :reader blue
    :initarg :blue
    :type cl:boolean
    :initform cl:nil)
   (custom
    :reader custom
    :initarg :custom
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetBlobCommand (<SetBlobCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetBlobCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetBlobCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<SetBlobCommand> is deprecated: use robobo_msgs-msg:SetBlobCommand instead.")))

(cl:ensure-generic-function 'red-val :lambda-list '(m))
(cl:defmethod red-val ((m <SetBlobCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:red-val is deprecated.  Use robobo_msgs-msg:red instead.")
  (red m))

(cl:ensure-generic-function 'green-val :lambda-list '(m))
(cl:defmethod green-val ((m <SetBlobCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:green-val is deprecated.  Use robobo_msgs-msg:green instead.")
  (green m))

(cl:ensure-generic-function 'blue-val :lambda-list '(m))
(cl:defmethod blue-val ((m <SetBlobCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:blue-val is deprecated.  Use robobo_msgs-msg:blue instead.")
  (blue m))

(cl:ensure-generic-function 'custom-val :lambda-list '(m))
(cl:defmethod custom-val ((m <SetBlobCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:custom-val is deprecated.  Use robobo_msgs-msg:custom instead.")
  (custom m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetBlobCommand>) ostream)
  "Serializes a message object of type '<SetBlobCommand>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'red) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'green) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blue) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'custom) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetBlobCommand>) istream)
  "Deserializes a message object of type '<SetBlobCommand>"
    (cl:setf (cl:slot-value msg 'red) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'green) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blue) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'custom) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetBlobCommand>)))
  "Returns string type for a message object of type '<SetBlobCommand>"
  "robobo_msgs/SetBlobCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetBlobCommand)))
  "Returns string type for a message object of type 'SetBlobCommand"
  "robobo_msgs/SetBlobCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetBlobCommand>)))
  "Returns md5sum for a message object of type '<SetBlobCommand>"
  "96f928d9e33474244870b2bc3df1b747")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetBlobCommand)))
  "Returns md5sum for a message object of type 'SetBlobCommand"
  "96f928d9e33474244870b2bc3df1b747")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetBlobCommand>)))
  "Returns full string definition for message of type '<SetBlobCommand>"
  (cl:format cl:nil "# Commands the robot to change a the activation state of the blob detector ~%# for each possible color~%#~%~%# Red blob detection~%bool red~%# Green blob detection~%bool green~%# Blue blob detection~%bool blue~%# Custom color detection~%bool custom~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetBlobCommand)))
  "Returns full string definition for message of type 'SetBlobCommand"
  (cl:format cl:nil "# Commands the robot to change a the activation state of the blob detector ~%# for each possible color~%#~%~%# Red blob detection~%bool red~%# Green blob detection~%bool green~%# Blue blob detection~%bool blue~%# Custom color detection~%bool custom~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetBlobCommand>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetBlobCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'SetBlobCommand
    (cl:cons ':red (red msg))
    (cl:cons ':green (green msg))
    (cl:cons ':blue (blue msg))
    (cl:cons ':custom (custom msg))
))
