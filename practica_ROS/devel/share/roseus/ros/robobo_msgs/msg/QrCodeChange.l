;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::QrCodeChange)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'QrCodeChange (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::QRCODECHANGE")
  (make-package "ROBOBO_MSGS::QRCODECHANGE"))

(in-package "ROS")
;;//! \htmlinclude QrCodeChange.msg.html
(if (not (find-package "OPENCV_APPS"))
  (ros::roseus-add-msgs "opencv_apps"))


(defclass robobo_msgs::QrCodeChange
  :super ros::object
  :slots (_id _distance _center ))

(defmethod robobo_msgs::QrCodeChange
  (:init
   (&key
    ((:id __id) "")
    ((:distance __distance) 0.0)
    ((:center __center) (instance opencv_apps::Point2D :init))
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _distance (float __distance))
   (setq _center __center)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
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
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; float32 _distance
    4
    ;; opencv_apps/Point2D _center
    (send _center :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; opencv_apps/Point2D _center
       (send _center :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; opencv_apps/Point2D _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::QrCodeChange :md5sum-) "ad90adff5581c7da685be8171e59dbb0")
(setf (get robobo_msgs::QrCodeChange :datatype-) "robobo_msgs/QrCodeChange")
(setf (get robobo_msgs::QrCodeChange :definition-)
      "# Represents a change (appearance and disappearance) of 
# a QR Code
#
# Text of the QR Code
string id
# Distance between the first result point and the center
# of the code 
float32 distance
# Coordinate of the center of the code
opencv_apps/Point2D center

================================================================================
MSG: opencv_apps/Point2D
float64 x
float64 y


")



(provide :robobo_msgs/QrCodeChange "ad90adff5581c7da685be8171e59dbb0")


