;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::TalkCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'TalkCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::TALKCOMMAND")
  (make-package "ROBOBO_MSGS::TALKCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude TalkCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::TalkCommand
  :super ros::object
  :slots (_text ))

(defmethod robobo_msgs::TalkCommand
  (:init
   (&key
    ((:text __text) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _text __text)
   self)
  (:text
   (&rest __text)
   (if (keywordp (car __text))
       (send* _text __text)
     (progn
       (if __text (setq _text (car __text)))
       _text)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _text
    (send _text :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _text
       (send _text :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _text
     (send _text :deserialize buf ptr-) (incf ptr- (send _text :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::TalkCommand :md5sum-) "7fb91077b93c329c9eeaea1c488c03e0")
(setf (get robobo_msgs::TalkCommand :datatype-) "robobo_msgs/TalkCommand")
(setf (get robobo_msgs::TalkCommand :definition-)
      "# Commands the robot to talk usin Text-To-Speech
#
# Text to be spoken
std_msgs/String text


================================================================================
MSG: std_msgs/String
string data

")



(provide :robobo_msgs/TalkCommand "7fb91077b93c329c9eeaea1c488c03e0")


