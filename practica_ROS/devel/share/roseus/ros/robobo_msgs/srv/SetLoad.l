;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetLoad)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetLoad (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETLOAD")
  (make-package "ROBOBO_MSGS::SETLOAD"))
(unless (find-package "ROBOBO_MSGS::SETLOADREQUEST")
  (make-package "ROBOBO_MSGS::SETLOADREQUEST"))
(unless (find-package "ROBOBO_MSGS::SETLOADRESPONSE")
  (make-package "ROBOBO_MSGS::SETLOADRESPONSE"))

(in-package "ROS")





(defclass robobo_msgs::SetLoadRequest
  :super ros::object
  :slots (_power_load ))

(defmethod robobo_msgs::SetLoadRequest
  (:init
   (&key
    ((:power_load __power_load) 0.0)
    )
   (send-super :init)
   (setq _power_load (float __power_load))
   self)
  (:power_load
   (&optional __power_load)
   (if __power_load (setq _power_load __power_load)) _power_load)
  (:serialization-length
   ()
   (+
    ;; float64 _power_load
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _power_load
       (sys::poke _power_load (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _power_load
     (setq _power_load (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass robobo_msgs::SetLoadResponse
  :super ros::object
  :slots (_result ))

(defmethod robobo_msgs::SetLoadResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robobo_msgs::SetLoad
  :super ros::object
  :slots ())

(setf (get robobo_msgs::SetLoad :md5sum-) "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(setf (get robobo_msgs::SetLoad :datatype-) "robobo_msgs/SetLoad")
(setf (get robobo_msgs::SetLoad :request) robobo_msgs::SetLoadRequest)
(setf (get robobo_msgs::SetLoad :response) robobo_msgs::SetLoadResponse)

(defmethod robobo_msgs::SetLoadRequest
  (:response () (instance robobo_msgs::SetLoadResponse :init)))

(setf (get robobo_msgs::SetLoadRequest :md5sum-) "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(setf (get robobo_msgs::SetLoadRequest :datatype-) "robobo_msgs/SetLoadRequest")
(setf (get robobo_msgs::SetLoadRequest :definition-)
      "float64 power_load
---
bool result
")

(setf (get robobo_msgs::SetLoadResponse :md5sum-) "c6df5f3c4e0e3e4f0d7fcf166cd717e7")
(setf (get robobo_msgs::SetLoadResponse :datatype-) "robobo_msgs/SetLoadResponse")
(setf (get robobo_msgs::SetLoadResponse :definition-)
      "float64 power_load
---
bool result
")



(provide :robobo_msgs/SetLoad "c6df5f3c4e0e3e4f0d7fcf166cd717e7")


