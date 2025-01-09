;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::QrCode)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'QrCode (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::QRCODE")
  (make-package "ROBOBO_MSGS::QRCODE"))

(in-package "ROS")
;;//! \htmlinclude QrCode.msg.html
(if (not (find-package "OPENCV_APPS"))
  (ros::roseus-add-msgs "opencv_apps"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::QrCode
  :super ros::object
  :slots (_header _text _distance _center _result_points ))

(defmethod robobo_msgs::QrCode
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:text __text) "")
    ((:distance __distance) 0.0)
    ((:center __center) (instance opencv_apps::Point2D :init))
    ((:result_points __result_points) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _text (string __text))
   (setq _distance (float __distance))
   (setq _center __center)
   (setq _result_points __result_points)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:result_points
   (&rest __result_points)
   (if (keywordp (car __result_points))
       (send* _result_points __result_points)
     (progn
       (if __result_points (setq _result_points (car __result_points)))
       _result_points)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _text
    4 (length _text)
    ;; float32 _distance
    4
    ;; opencv_apps/Point2D _center
    (send _center :serialization-length)
    ;; opencv_apps/Point2D[] _result_points
    (apply #'+ (send-all _result_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; opencv_apps/Point2D _center
       (send _center :serialize s)
     ;; opencv_apps/Point2D[] _result_points
     (write-long (length _result_points) s)
     (dolist (elem _result_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; opencv_apps/Point2D _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; opencv_apps/Point2D[] _result_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _result_points (let (r) (dotimes (i n) (push (instance opencv_apps::Point2D :init) r)) r))
     (dolist (elem- _result_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get robobo_msgs::QrCode :md5sum-) "262c4f53965b665792eece06f2421ea5")
(setf (get robobo_msgs::QrCode :datatype-) "robobo_msgs/QrCode")
(setf (get robobo_msgs::QrCode :definition-)
      "# Represents a detected QR Code
#
# Metadata about the frame
Header header
# Text contained on the QR Code
string text
# Distance between the center of the code and
# the first result point
float32 distance
# Coordinate of the center of the code
opencv_apps/Point2D center
# Vector of coordinates of the result points
opencv_apps/Point2D[] result_points 

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
MSG: opencv_apps/Point2D
float64 x
float64 y


")



(provide :robobo_msgs/QrCode "262c4f53965b665792eece06f2421ea5")


