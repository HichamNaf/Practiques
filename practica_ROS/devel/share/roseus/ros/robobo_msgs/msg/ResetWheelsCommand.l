;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::ResetWheelsCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'ResetWheelsCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::RESETWHEELSCOMMAND")
  (make-package "ROBOBO_MSGS::RESETWHEELSCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ResetWheelsCommand.msg.html


(defclass robobo_msgs::ResetWheelsCommand
  :super ros::object
  :slots ())

(defmethod robobo_msgs::ResetWheelsCommand
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get robobo_msgs::ResetWheelsCommand :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get robobo_msgs::ResetWheelsCommand :datatype-) "robobo_msgs/ResetWheelsCommand")
(setf (get robobo_msgs::ResetWheelsCommand :definition-)
      "# Commands the robot to reset the wheels encoders
# back to zero. This message its empty.
")



(provide :robobo_msgs/ResetWheelsCommand "d41d8cd98f00b204e9800998ecf8427e")


