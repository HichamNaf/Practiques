;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::Blob)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'Blob (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::BLOB")
  (make-package "ROBOBO_MSGS::BLOB"))

(in-package "ROS")
;;//! \htmlinclude Blob.msg.html
(if (not (find-package "OPENCV_APPS"))
  (ros::roseus-add-msgs "opencv_apps"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::Blob
  :super ros::object
  :slots (_header _color _size _center ))

(defmethod robobo_msgs::Blob
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:color __color) (instance std_msgs::String :init))
    ((:size __size) (instance std_msgs::Int32 :init))
    ((:center __center) (instance opencv_apps::Point2D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _color __color)
   (setq _size __size)
   (setq _center __center)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:color
   (&rest __color)
   (if (keywordp (car __color))
       (send* _color __color)
     (progn
       (if __color (setq _color (car __color)))
       _color)))
  (:size
   (&rest __size)
   (if (keywordp (car __size))
       (send* _size __size)
     (progn
       (if __size (setq _size (car __size)))
       _size)))
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/String _color
    (send _color :serialization-length)
    ;; std_msgs/Int32 _size
    (send _size :serialization-length)
    ;; opencv_apps/Point2D _center
    (send _center :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/String _color
       (send _color :serialize s)
     ;; std_msgs/Int32 _size
       (send _size :serialize s)
     ;; opencv_apps/Point2D _center
       (send _center :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/String _color
     (send _color :deserialize buf ptr-) (incf ptr- (send _color :serialization-length))
   ;; std_msgs/Int32 _size
     (send _size :deserialize buf ptr-) (incf ptr- (send _size :serialization-length))
   ;; opencv_apps/Point2D _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::Blob :md5sum-) "fcdaa08fe5dcb5ccf3de600463bba07b")
(setf (get robobo_msgs::Blob :datatype-) "robobo_msgs/Blob")
(setf (get robobo_msgs::Blob :definition-)
      "# Represents a detected Color Blob
#
# Metadata about the frame
Header header
# Color of the blob
std_msgs/String color
# Size of the blob (area) in pixels
std_msgs/Int32 size
# Coordinate of the center of the blob
opencv_apps/Point2D center


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: opencv_apps/Point2D
float64 x
float64 y


")



(provide :robobo_msgs/Blob "fcdaa08fe5dcb5ccf3de600463bba07b")


