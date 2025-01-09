;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetLedCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetLedCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETLEDCOMMAND")
  (make-package "ROBOBO_MSGS::SETLEDCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SetLedCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::SetLedCommand
  :super ros::object
  :slots (_id _color ))

(defmethod robobo_msgs::SetLedCommand
  (:init
   (&key
    ((:id __id) (instance std_msgs::String :init))
    ((:color __color) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _id __id)
   (setq _color __color)
   self)
  (:id
   (&rest __id)
   (if (keywordp (car __id))
       (send* _id __id)
     (progn
       (if __id (setq _id (car __id)))
       _id)))
  (:color
   (&rest __color)
   (if (keywordp (car __color))
       (send* _color __color)
     (progn
       (if __color (setq _color (car __color)))
       _color)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _id
    (send _id :serialization-length)
    ;; std_msgs/String _color
    (send _color :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _id
       (send _id :serialize s)
     ;; std_msgs/String _color
       (send _color :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _id
     (send _id :deserialize buf ptr-) (incf ptr- (send _id :serialization-length))
   ;; std_msgs/String _color
     (send _color :deserialize buf ptr-) (incf ptr- (send _color :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::SetLedCommand :md5sum-) "67de51c92b3fb96ec94dabeed286e658")
(setf (get robobo_msgs::SetLedCommand :datatype-) "robobo_msgs/SetLedCommand")
(setf (get robobo_msgs::SetLedCommand :definition-)
      "# Commands the robot to change a led to a predifined color
#
# Led identifier; posible values: Front-C, Front-R, 
# Front-RR, Front-L, Front-LL, Front-C, Back-R, Back-L, all.
std_msgs/String id
# Color to set the values to; posible values: white,
# red, blue, cyan, magenta, yellow, green, orange, off.
std_msgs/String color

================================================================================
MSG: std_msgs/String
string data

")



(provide :robobo_msgs/SetLedCommand "67de51c92b3fb96ec94dabeed286e658")


