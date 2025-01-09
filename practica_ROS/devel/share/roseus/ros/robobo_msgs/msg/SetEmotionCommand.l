;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetEmotionCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetEmotionCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETEMOTIONCOMMAND")
  (make-package "ROBOBO_MSGS::SETEMOTIONCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SetEmotionCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::SetEmotionCommand
  :super ros::object
  :slots (_emotion ))

(defmethod robobo_msgs::SetEmotionCommand
  (:init
   (&key
    ((:emotion __emotion) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _emotion __emotion)
   self)
  (:emotion
   (&rest __emotion)
   (if (keywordp (car __emotion))
       (send* _emotion __emotion)
     (progn
       (if __emotion (setq _emotion (car __emotion)))
       _emotion)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _emotion
    (send _emotion :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _emotion
       (send _emotion :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _emotion
     (send _emotion :deserialize buf ptr-) (incf ptr- (send _emotion :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::SetEmotionCommand :md5sum-) "a6515dd33a2228f41cfa2f673f8eb2aa")
(setf (get robobo_msgs::SetEmotionCommand :datatype-) "robobo_msgs/SetEmotionCommand")
(setf (get robobo_msgs::SetEmotionCommand :definition-)
      "# Commands the robot to show an emotion in the display
#
# String of the emotion to show. Posible values:
# happy, laughing, sad, angry, surprised, normal.
std_msgs/String emotion

================================================================================
MSG: std_msgs/String
string data

")



(provide :robobo_msgs/SetEmotionCommand "a6515dd33a2228f41cfa2f673f8eb2aa")


