;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::PlaySoundCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'PlaySoundCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::PLAYSOUNDCOMMAND")
  (make-package "ROBOBO_MSGS::PLAYSOUNDCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude PlaySoundCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::PlaySoundCommand
  :super ros::object
  :slots (_sound ))

(defmethod robobo_msgs::PlaySoundCommand
  (:init
   (&key
    ((:sound __sound) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _sound __sound)
   self)
  (:sound
   (&rest __sound)
   (if (keywordp (car __sound))
       (send* _sound __sound)
     (progn
       (if __sound (setq _sound (car __sound)))
       _sound)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _sound
    (send _sound :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _sound
       (send _sound :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _sound
     (send _sound :deserialize buf ptr-) (incf ptr- (send _sound :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::PlaySoundCommand :md5sum-) "0935a125722801704c8ff8170000156e")
(setf (get robobo_msgs::PlaySoundCommand :datatype-) "robobo_msgs/PlaySoundCommand")
(setf (get robobo_msgs::PlaySoundCommand :definition-)
      "# Commands the robot to play a sound
#
# Plays a predefined sound. Posible 
# variables: moan, purr, angry, 
# approve, disapprove, discomfort, 
# doubtful, laugh, likes, mumble, 
# ouch, thinking, various
std_msgs/String sound

================================================================================
MSG: std_msgs/String
string data

")



(provide :robobo_msgs/PlaySoundCommand "0935a125722801704c8ff8170000156e")


