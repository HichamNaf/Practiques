; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude QrCode.msg.html

(cl:defclass <QrCode> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (text
    :reader text
    :initarg :text
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
    :initform (cl:make-instance 'opencv_apps-msg:Point2D))
   (result_points
    :reader result_points
    :initarg :result_points
    :type (cl:vector opencv_apps-msg:Point2D)
   :initform (cl:make-array 0 :element-type 'opencv_apps-msg:Point2D :initial-element (cl:make-instance 'opencv_apps-msg:Point2D))))
)

(cl:defclass QrCode (<QrCode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QrCode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QrCode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<QrCode> is deprecated: use robobo_msgs-msg:QrCode instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <QrCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:header-val is deprecated.  Use robobo_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <QrCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:text-val is deprecated.  Use robobo_msgs-msg:text instead.")
  (text m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <QrCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:distance-val is deprecated.  Use robobo_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <QrCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:center-val is deprecated.  Use robobo_msgs-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'result_points-val :lambda-list '(m))
(cl:defmethod result_points-val ((m <QrCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:result_points-val is deprecated.  Use robobo_msgs-msg:result_points instead.")
  (result_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QrCode>) ostream)
  "Serializes a message object of type '<QrCode>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'result_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'result_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QrCode>) istream)
  "Deserializes a message object of type '<QrCode>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'result_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'result_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'opencv_apps-msg:Point2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QrCode>)))
  "Returns string type for a message object of type '<QrCode>"
  "robobo_msgs/QrCode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QrCode)))
  "Returns string type for a message object of type 'QrCode"
  "robobo_msgs/QrCode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QrCode>)))
  "Returns md5sum for a message object of type '<QrCode>"
  "262c4f53965b665792eece06f2421ea5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QrCode)))
  "Returns md5sum for a message object of type 'QrCode"
  "262c4f53965b665792eece06f2421ea5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QrCode>)))
  "Returns full string definition for message of type '<QrCode>"
  (cl:format cl:nil "# Represents a detected QR Code~%#~%# Metadata about the frame~%Header header~%# Text contained on the QR Code~%string text~%# Distance between the center of the code and~%# the first result point~%float32 distance~%# Coordinate of the center of the code~%opencv_apps/Point2D center~%# Vector of coordinates of the result points~%opencv_apps/Point2D[] result_points ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: opencv_apps/Point2D~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QrCode)))
  "Returns full string definition for message of type 'QrCode"
  (cl:format cl:nil "# Represents a detected QR Code~%#~%# Metadata about the frame~%Header header~%# Text contained on the QR Code~%string text~%# Distance between the center of the code and~%# the first result point~%float32 distance~%# Coordinate of the center of the code~%opencv_apps/Point2D center~%# Vector of coordinates of the result points~%opencv_apps/Point2D[] result_points ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: opencv_apps/Point2D~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QrCode>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'text))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'result_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QrCode>))
  "Converts a ROS message object to a list"
  (cl:list 'QrCode
    (cl:cons ':header (header msg))
    (cl:cons ':text (text msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':center (center msg))
    (cl:cons ':result_points (result_points msg))
))
