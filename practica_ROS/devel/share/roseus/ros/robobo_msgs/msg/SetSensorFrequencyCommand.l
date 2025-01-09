;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetSensorFrequencyCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetSensorFrequencyCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETSENSORFREQUENCYCOMMAND")
  (make-package "ROBOBO_MSGS::SETSENSORFREQUENCYCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SetSensorFrequencyCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::SetSensorFrequencyCommand
  :super ros::object
  :slots (_frequency ))

(defmethod robobo_msgs::SetSensorFrequencyCommand
  (:init
   (&key
    ((:frequency __frequency) (instance std_msgs::Int8 :init))
    )
   (send-super :init)
   (setq _frequency __frequency)
   self)
  (:frequency
   (&rest __frequency)
   (if (keywordp (car __frequency))
       (send* _frequency __frequency)
     (progn
       (if __frequency (setq _frequency (car __frequency)))
       _frequency)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int8 _frequency
    (send _frequency :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int8 _frequency
       (send _frequency :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int8 _frequency
     (send _frequency :deserialize buf ptr-) (incf ptr- (send _frequency :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::SetSensorFrequencyCommand :md5sum-) "b96ba08af418a90a3d51c1440b29c5db")
(setf (get robobo_msgs::SetSensorFrequencyCommand :datatype-) "robobo_msgs/SetSensorFrequencyCommand")
(setf (get robobo_msgs::SetSensorFrequencyCommand :definition-)
      "# Commands the robot to change the frequency of notifications
# of all sensors of the robot
#
# Integer representing the frequency; posible values: 
# 0 for LOW
# 1 for NORMAL
# 2 for HIGH
# 3 for MAX
std_msgs/Int8 frequency   

================================================================================
MSG: std_msgs/Int8
int8 data

")



(provide :robobo_msgs/SetSensorFrequencyCommand "b96ba08af418a90a3d51c1440b29c5db")


