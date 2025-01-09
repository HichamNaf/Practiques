; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude Blob.msg.html

(cl:defclass <Blob> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (color
    :reader color
    :initarg :color
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (size
    :reader size
    :initarg :size
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (center
    :reader center
    :initarg :center
    :type opencv_apps-msg:Point2D
    :initform (cl:make-instance 'opencv_apps-msg:Point2D)))
)

(cl:defclass Blob (<Blob>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Blob>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Blob)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<Blob> is deprecated: use robobo_msgs-msg:Blob instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:header-val is deprecated.  Use robobo_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:color-val is deprecated.  Use robobo_msgs-msg:color instead.")
  (color m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:size-val is deprecated.  Use robobo_msgs-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <Blob>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:center-val is deprecated.  Use robobo_msgs-msg:center instead.")
  (center m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Blob>) ostream)
  "Serializes a message object of type '<Blob>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'color) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'size) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Blob>) istream)
  "Deserializes a message object of type '<Blob>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'color) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'size) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Blob>)))
  "Returns string type for a message object of type '<Blob>"
  "robobo_msgs/Blob")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Blob)))
  "Returns string type for a message object of type 'Blob"
  "robobo_msgs/Blob")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Blob>)))
  "Returns md5sum for a message object of type '<Blob>"
  "fcdaa08fe5dcb5ccf3de600463bba07b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Blob)))
  "Returns md5sum for a message object of type 'Blob"
  "fcdaa08fe5dcb5ccf3de600463bba07b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Blob>)))
  "Returns full string definition for message of type '<Blob>"
  (cl:format cl:nil "# Represents a detected Color Blob~%#~%# Metadata about the frame~%Header header~%# Color of the blob~%std_msgs/String color~%# Size of the blob (area) in pixels~%std_msgs/Int32 size~%# Coordinate of the center of the blob~%opencv_apps/Point2D center~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: opencv_apps/Point2D~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Blob)))
  "Returns full string definition for message of type 'Blob"
  (cl:format cl:nil "# Represents a detected Color Blob~%#~%# Metadata about the frame~%Header header~%# Color of the blob~%std_msgs/String color~%# Size of the blob (area) in pixels~%std_msgs/Int32 size~%# Coordinate of the center of the blob~%opencv_apps/Point2D center~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: opencv_apps/Point2D~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Blob>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'color))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'size))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Blob>))
  "Converts a ROS message object to a list"
  (cl:list 'Blob
    (cl:cons ':header (header msg))
    (cl:cons ':color (color msg))
    (cl:cons ':size (size msg))
    (cl:cons ':center (center msg))
))
