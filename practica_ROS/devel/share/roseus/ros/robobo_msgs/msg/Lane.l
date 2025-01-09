;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::Lane)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'Lane (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::LANE")
  (make-package "ROBOBO_MSGS::LANE"))

(in-package "ROS")
;;//! \htmlinclude Lane.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::Lane
  :super ros::object
  :slots (_header _coeffs1 _coeffs2 _minv ))

(defmethod robobo_msgs::Lane
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:coeffs1 __coeffs1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:coeffs2 __coeffs2) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:minv __minv) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _coeffs1 __coeffs1)
   (setq _coeffs2 __coeffs2)
   (setq _minv __minv)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:coeffs1
   (&optional __coeffs1)
   (if __coeffs1 (setq _coeffs1 __coeffs1)) _coeffs1)
  (:coeffs2
   (&optional __coeffs2)
   (if __coeffs2 (setq _coeffs2 __coeffs2)) _coeffs2)
  (:minv
   (&optional __minv)
   (if __minv (setq _minv __minv)) _minv)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _coeffs1
    (* 8    (length _coeffs1)) 4
    ;; float64[] _coeffs2
    (* 8    (length _coeffs2)) 4
    ;; float64[] _minv
    (* 8    (length _minv)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _coeffs1
     (write-long (length _coeffs1) s)
     (dotimes (i (length _coeffs1))
       (sys::poke (elt _coeffs1 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _coeffs2
     (write-long (length _coeffs2) s)
     (dotimes (i (length _coeffs2))
       (sys::poke (elt _coeffs2 i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _minv
     (write-long (length _minv) s)
     (dotimes (i (length _minv))
       (sys::poke (elt _minv i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _coeffs1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coeffs1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coeffs1 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _coeffs2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coeffs2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coeffs2 i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _minv
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _minv (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _minv i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get robobo_msgs::Lane :md5sum-) "ed37440a232a49de70e6d2b24a87f8b8")
(setf (get robobo_msgs::Lane :datatype-) "robobo_msgs/Lane")
(setf (get robobo_msgs::Lane :definition-)
      "# Represents a detected lane (two lines)
#
# Metadata about the frame detected
std_msgs/Header header
# Coefficients of the first line
float64[] coeffs1
# Coefficients of the second line
float64[] coeffs2
# Inverse transformation matrix, this should be used if the
# frame's perspective was transormed; else will be empty.
float64[] minv 

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

")



(provide :robobo_msgs/Lane "ed37440a232a49de70e6d2b24a87f8b8")


