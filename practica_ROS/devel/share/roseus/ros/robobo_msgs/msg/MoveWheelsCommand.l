;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::MoveWheelsCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'MoveWheelsCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::MOVEWHEELSCOMMAND")
  (make-package "ROBOBO_MSGS::MOVEWHEELSCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude MoveWheelsCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::MoveWheelsCommand
  :super ros::object
  :slots (_lspeed _rspeed _time _unlockid ))

(defmethod robobo_msgs::MoveWheelsCommand
  (:init
   (&key
    ((:lspeed __lspeed) (instance std_msgs::Int8 :init))
    ((:rspeed __rspeed) (instance std_msgs::Int8 :init))
    ((:time __time) (instance std_msgs::Int32 :init))
    ((:unlockid __unlockid) (instance std_msgs::Int16 :init))
    )
   (send-super :init)
   (setq _lspeed __lspeed)
   (setq _rspeed __rspeed)
   (setq _time __time)
   (setq _unlockid __unlockid)
   self)
  (:lspeed
   (&rest __lspeed)
   (if (keywordp (car __lspeed))
       (send* _lspeed __lspeed)
     (progn
       (if __lspeed (setq _lspeed (car __lspeed)))
       _lspeed)))
  (:rspeed
   (&rest __rspeed)
   (if (keywordp (car __rspeed))
       (send* _rspeed __rspeed)
     (progn
       (if __rspeed (setq _rspeed (car __rspeed)))
       _rspeed)))
  (:time
   (&rest __time)
   (if (keywordp (car __time))
       (send* _time __time)
     (progn
       (if __time (setq _time (car __time)))
       _time)))
  (:unlockid
   (&rest __unlockid)
   (if (keywordp (car __unlockid))
       (send* _unlockid __unlockid)
     (progn
       (if __unlockid (setq _unlockid (car __unlockid)))
       _unlockid)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int8 _lspeed
    (send _lspeed :serialization-length)
    ;; std_msgs/Int8 _rspeed
    (send _rspeed :serialization-length)
    ;; std_msgs/Int32 _time
    (send _time :serialization-length)
    ;; std_msgs/Int16 _unlockid
    (send _unlockid :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int8 _lspeed
       (send _lspeed :serialize s)
     ;; std_msgs/Int8 _rspeed
       (send _rspeed :serialize s)
     ;; std_msgs/Int32 _time
       (send _time :serialize s)
     ;; std_msgs/Int16 _unlockid
       (send _unlockid :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int8 _lspeed
     (send _lspeed :deserialize buf ptr-) (incf ptr- (send _lspeed :serialization-length))
   ;; std_msgs/Int8 _rspeed
     (send _rspeed :deserialize buf ptr-) (incf ptr- (send _rspeed :serialization-length))
   ;; std_msgs/Int32 _time
     (send _time :deserialize buf ptr-) (incf ptr- (send _time :serialization-length))
   ;; std_msgs/Int16 _unlockid
     (send _unlockid :deserialize buf ptr-) (incf ptr- (send _unlockid :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::MoveWheelsCommand :md5sum-) "e266bff9487ab0f7db9d11321bda62d1")
(setf (get robobo_msgs::MoveWheelsCommand :datatype-) "robobo_msgs/MoveWheelsCommand")
(setf (get robobo_msgs::MoveWheelsCommand :definition-)
      "# Commands the robot to move the wheels for
# an specific time
#
# Left wheel speed
std_msgs/Int8 lspeed
# Right wheel speed
std_msgs/Int8 rspeed
# Time in miliseconds
std_msgs/Int32 time
# Identifier for end-of-movement notification
std_msgs/Int16 unlockid

================================================================================
MSG: std_msgs/Int8
int8 data

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/Int16
int16 data

")



(provide :robobo_msgs/MoveWheelsCommand "e266bff9487ab0f7db9d11321bda62d1")


