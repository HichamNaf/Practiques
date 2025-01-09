; Auto-generated. Do not edit!


(cl:in-package robobo_msgs-msg)


;//! \htmlinclude OrientationEuler.msg.html

(cl:defclass <OrientationEuler> (roslisp-msg-protocol:ros-message)
  ((vector
    :reader vector
    :initarg :vector
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (yaw
    :reader yaw
    :initarg :yaw
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (pitch
    :reader pitch
    :initarg :pitch
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (roll
    :reader roll
    :initarg :roll
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64)))
)

(cl:defclass OrientationEuler (<OrientationEuler>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrientationEuler>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrientationEuler)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robobo_msgs-msg:<OrientationEuler> is deprecated: use robobo_msgs-msg:OrientationEuler instead.")))

(cl:ensure-generic-function 'vector-val :lambda-list '(m))
(cl:defmethod vector-val ((m <OrientationEuler>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:vector-val is deprecated.  Use robobo_msgs-msg:vector instead.")
  (vector m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <OrientationEuler>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:yaw-val is deprecated.  Use robobo_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <OrientationEuler>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:pitch-val is deprecated.  Use robobo_msgs-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <OrientationEuler>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robobo_msgs-msg:roll-val is deprecated.  Use robobo_msgs-msg:roll instead.")
  (roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrientationEuler>) ostream)
  "Serializes a message object of type '<OrientationEuler>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vector) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'yaw) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pitch) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'roll) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrientationEuler>) istream)
  "Deserializes a message object of type '<OrientationEuler>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vector) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'yaw) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pitch) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'roll) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrientationEuler>)))
  "Returns string type for a message object of type '<OrientationEuler>"
  "robobo_msgs/OrientationEuler")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrientationEuler)))
  "Returns string type for a message object of type 'OrientationEuler"
  "robobo_msgs/OrientationEuler")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrientationEuler>)))
  "Returns md5sum for a message object of type '<OrientationEuler>"
  "65c4e234a4ea295f537af690b4738286")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrientationEuler)))
  "Returns md5sum for a message object of type 'OrientationEuler"
  "65c4e234a4ea295f537af690b4738286")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrientationEuler>)))
  "Returns full string definition for message of type '<OrientationEuler>"
  (cl:format cl:nil "# Represents a orientation using euler angles (yaw, pitch, roll)~%~%# Orientation vector in euler angles~%geometry_msgs/Vector3 vector~%~%# Yaw degrees~%std_msgs/Float64 yaw~%# Pitch degrees~%std_msgs/Float64 pitch~%# Roll degrees ~%std_msgs/Float64 roll ~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrientationEuler)))
  "Returns full string definition for message of type 'OrientationEuler"
  (cl:format cl:nil "# Represents a orientation using euler angles (yaw, pitch, roll)~%~%# Orientation vector in euler angles~%geometry_msgs/Vector3 vector~%~%# Yaw degrees~%std_msgs/Float64 yaw~%# Pitch degrees~%std_msgs/Float64 pitch~%# Roll degrees ~%std_msgs/Float64 roll ~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrientationEuler>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vector))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'yaw))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pitch))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'roll))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrientationEuler>))
  "Converts a ROS message object to a list"
  (cl:list 'OrientationEuler
    (cl:cons ':vector (vector msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
))
