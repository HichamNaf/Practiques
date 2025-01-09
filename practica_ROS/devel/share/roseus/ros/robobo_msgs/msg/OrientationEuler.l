;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::OrientationEuler)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'OrientationEuler (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::ORIENTATIONEULER")
  (make-package "ROBOBO_MSGS::ORIENTATIONEULER"))

(in-package "ROS")
;;//! \htmlinclude OrientationEuler.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::OrientationEuler
  :super ros::object
  :slots (_vector _yaw _pitch _roll ))

(defmethod robobo_msgs::OrientationEuler
  (:init
   (&key
    ((:vector __vector) (instance geometry_msgs::Vector3 :init))
    ((:yaw __yaw) (instance std_msgs::Float64 :init))
    ((:pitch __pitch) (instance std_msgs::Float64 :init))
    ((:roll __roll) (instance std_msgs::Float64 :init))
    )
   (send-super :init)
   (setq _vector __vector)
   (setq _yaw __yaw)
   (setq _pitch __pitch)
   (setq _roll __roll)
   self)
  (:vector
   (&rest __vector)
   (if (keywordp (car __vector))
       (send* _vector __vector)
     (progn
       (if __vector (setq _vector (car __vector)))
       _vector)))
  (:yaw
   (&rest __yaw)
   (if (keywordp (car __yaw))
       (send* _yaw __yaw)
     (progn
       (if __yaw (setq _yaw (car __yaw)))
       _yaw)))
  (:pitch
   (&rest __pitch)
   (if (keywordp (car __pitch))
       (send* _pitch __pitch)
     (progn
       (if __pitch (setq _pitch (car __pitch)))
       _pitch)))
  (:roll
   (&rest __roll)
   (if (keywordp (car __roll))
       (send* _roll __roll)
     (progn
       (if __roll (setq _roll (car __roll)))
       _roll)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _vector
    (send _vector :serialization-length)
    ;; std_msgs/Float64 _yaw
    (send _yaw :serialization-length)
    ;; std_msgs/Float64 _pitch
    (send _pitch :serialization-length)
    ;; std_msgs/Float64 _roll
    (send _roll :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _vector
       (send _vector :serialize s)
     ;; std_msgs/Float64 _yaw
       (send _yaw :serialize s)
     ;; std_msgs/Float64 _pitch
       (send _pitch :serialize s)
     ;; std_msgs/Float64 _roll
       (send _roll :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _vector
     (send _vector :deserialize buf ptr-) (incf ptr- (send _vector :serialization-length))
   ;; std_msgs/Float64 _yaw
     (send _yaw :deserialize buf ptr-) (incf ptr- (send _yaw :serialization-length))
   ;; std_msgs/Float64 _pitch
     (send _pitch :deserialize buf ptr-) (incf ptr- (send _pitch :serialization-length))
   ;; std_msgs/Float64 _roll
     (send _roll :deserialize buf ptr-) (incf ptr- (send _roll :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::OrientationEuler :md5sum-) "65c4e234a4ea295f537af690b4738286")
(setf (get robobo_msgs::OrientationEuler :datatype-) "robobo_msgs/OrientationEuler")
(setf (get robobo_msgs::OrientationEuler :definition-)
      "# Represents a orientation using euler angles (yaw, pitch, roll)

# Orientation vector in euler angles
geometry_msgs/Vector3 vector

# Yaw degrees
std_msgs/Float64 yaw
# Pitch degrees
std_msgs/Float64 pitch
# Roll degrees 
std_msgs/Float64 roll 

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: std_msgs/Float64
float64 data
")



(provide :robobo_msgs/OrientationEuler "65c4e234a4ea295f537af690b4738286")


