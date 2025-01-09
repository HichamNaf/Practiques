;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetBlobCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetBlobCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETBLOBCOMMAND")
  (make-package "ROBOBO_MSGS::SETBLOBCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SetBlobCommand.msg.html


(defclass robobo_msgs::SetBlobCommand
  :super ros::object
  :slots (_red _green _blue _custom ))

(defmethod robobo_msgs::SetBlobCommand
  (:init
   (&key
    ((:red __red) nil)
    ((:green __green) nil)
    ((:blue __blue) nil)
    ((:custom __custom) nil)
    )
   (send-super :init)
   (setq _red __red)
   (setq _green __green)
   (setq _blue __blue)
   (setq _custom __custom)
   self)
  (:red
   (&optional (__red :null))
   (if (not (eq __red :null)) (setq _red __red)) _red)
  (:green
   (&optional (__green :null))
   (if (not (eq __green :null)) (setq _green __green)) _green)
  (:blue
   (&optional (__blue :null))
   (if (not (eq __blue :null)) (setq _blue __blue)) _blue)
  (:custom
   (&optional (__custom :null))
   (if (not (eq __custom :null)) (setq _custom __custom)) _custom)
  (:serialization-length
   ()
   (+
    ;; bool _red
    1
    ;; bool _green
    1
    ;; bool _blue
    1
    ;; bool _custom
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _red
       (if _red (write-byte -1 s) (write-byte 0 s))
     ;; bool _green
       (if _green (write-byte -1 s) (write-byte 0 s))
     ;; bool _blue
       (if _blue (write-byte -1 s) (write-byte 0 s))
     ;; bool _custom
       (if _custom (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _red
     (setq _red (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _green
     (setq _green (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _blue
     (setq _blue (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _custom
     (setq _custom (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robobo_msgs::SetBlobCommand :md5sum-) "96f928d9e33474244870b2bc3df1b747")
(setf (get robobo_msgs::SetBlobCommand :datatype-) "robobo_msgs/SetBlobCommand")
(setf (get robobo_msgs::SetBlobCommand :definition-)
      "# Commands the robot to change a the activation state of the blob detector 
# for each possible color
#

# Red blob detection
bool red
# Green blob detection
bool green
# Blue blob detection
bool blue
# Custom color detection
bool custom

")



(provide :robobo_msgs/SetBlobCommand "96f928d9e33474244870b2bc3df1b747")


