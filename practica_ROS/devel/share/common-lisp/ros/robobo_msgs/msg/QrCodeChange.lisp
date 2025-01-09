; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude QrCodeChange.msg.html

(cl:defclass <QrCodeChange> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (center
    :reader center
    :initarg :center
    :type opencv_apps-msg:Point2D
    :initform (cl:make-instance 'opencv_apps-msg:Point2D)))
)

(cl:defclass QrCodeChange (<QrCodeChange>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QrCodeChange>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QrCodeChange)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<QrCodeChange> is deprecated: use robobo_msgs-msg:QrCodeChange instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <QrCodeChange>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:id-val is deprecated.  Use robobo_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <QrCodeChange>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:distance-val is deprecated.  Use robobo_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <QrCodeChange>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:center-val is deprecated.  Use robobo_msgs-msg:center instead.")
  (center m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QrCodeChange>) ostream)
  "Serializes a message object of type '<QrCodeChange>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QrCodeChange>) istream)
  "Deserializes a message object of type '<QrCodeChange>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QrCodeChange>)))
  "Returns string type for a message object of type '<QrCodeChange>"
  "robobo_msgs/QrCodeChange")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QrCodeChange)))
  "Returns string type for a message object of type 'QrCodeChange"
  "robobo_msgs/QrCodeChange")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QrCodeChange>)))
  "Returns md5sum for a message object of type '<QrCodeChange>"
  "ad90adff5581c7da685be8171e59dbb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QrCodeChange)))
  "Returns md5sum for a message object of type 'QrCodeChange"
  "ad90adff5581c7da685be8171e59dbb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QrCodeChange>)))
  "Returns full string definition for message of type '<QrCodeChange>"
  (cl:format cl:nil "# Represents a change (appearance and disappearance) of ~%# a QR Code~%#~%# Text of the QR Code~%string id~%# Distance between the first result point and the center~%# of the code ~%float32 distance~%# Coordinate of the center of the code~%opencv_apps/Point2D center~%~%================================================================================~%MSG: opencv_apps/Point2D~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QrCodeChange)))
  "Returns full string definition for message of type 'QrCodeChange"
  (cl:format cl:nil "# Represents a change (appearance and disappearance) of ~%# a QR Code~%#~%# Text of the QR Code~%string id~%# Distance between the first result point and the center~%# of the code ~%float32 distance~%# Coordinate of the center of the code~%opencv_apps/Point2D center~%~%================================================================================~%MSG: opencv_apps/Point2D~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QrCodeChange>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QrCodeChange>))
  "Converts a ROS message object to a list"
  (cl:list 'QrCodeChange
    (cl:cons ':id (id msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':center (center msg))
))
