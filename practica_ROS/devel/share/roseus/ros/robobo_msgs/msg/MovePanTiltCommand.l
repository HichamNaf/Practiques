;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::MovePanTiltCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'MovePanTiltCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::MOVEPANTILTCOMMAND")
  (make-package "ROBOBO_MSGS::MOVEPANTILTCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude MovePanTiltCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::MovePanTiltCommand
  :super ros::object
  :slots (_panPos _panSpeed _panUnlockId _tiltPos _tiltSpeed _tiltUnlockId ))

(defmethod robobo_msgs::MovePanTiltCommand
  (:init
   (&key
    ((:panPos __panPos) (instance std_msgs::Int16 :init))
    ((:panSpeed __panSpeed) (instance std_msgs::Int8 :init))
    ((:panUnlockId __panUnlockId) (instance std_msgs::Int16 :init))
    ((:tiltPos __tiltPos) (instance std_msgs::Int16 :init))
    ((:tiltSpeed __tiltSpeed) (instance std_msgs::Int8 :init))
    ((:tiltUnlockId __tiltUnlockId) (instance std_msgs::Int16 :init))
    )
   (send-super :init)
   (setq _panPos __panPos)
   (setq _panSpeed __panSpeed)
   (setq _panUnlockId __panUnlockId)
   (setq _tiltPos __tiltPos)
   (setq _tiltSpeed __tiltSpeed)
   (setq _tiltUnlockId __tiltUnlockId)
   self)
  (:panPos
   (&rest __panPos)
   (if (keywordp (car __panPos))
       (send* _panPos __panPos)
     (progn
       (if __panPos (setq _panPos (car __panPos)))
       _panPos)))
  (:panSpeed
   (&rest __panSpeed)
   (if (keywordp (car __panSpeed))
       (send* _panSpeed __panSpeed)
     (progn
       (if __panSpeed (setq _panSpeed (car __panSpeed)))
       _panSpeed)))
  (:panUnlockId
   (&rest __panUnlockId)
   (if (keywordp (car __panUnlockId))
       (send* _panUnlockId __panUnlockId)
     (progn
       (if __panUnlockId (setq _panUnlockId (car __panUnlockId)))
       _panUnlockId)))
  (:tiltPos
   (&rest __tiltPos)
   (if (keywordp (car __tiltPos))
       (send* _tiltPos __tiltPos)
     (progn
       (if __tiltPos (setq _tiltPos (car __tiltPos)))
       _tiltPos)))
  (:tiltSpeed
   (&rest __tiltSpeed)
   (if (keywordp (car __tiltSpeed))
       (send* _tiltSpeed __tiltSpeed)
     (progn
       (if __tiltSpeed (setq _tiltSpeed (car __tiltSpeed)))
       _tiltSpeed)))
  (:tiltUnlockId
   (&rest __tiltUnlockId)
   (if (keywordp (car __tiltUnlockId))
       (send* _tiltUnlockId __tiltUnlockId)
     (progn
       (if __tiltUnlockId (setq _tiltUnlockId (car __tiltUnlockId)))
       _tiltUnlockId)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int16 _panPos
    (send _panPos :serialization-length)
    ;; std_msgs/Int8 _panSpeed
    (send _panSpeed :serialization-length)
    ;; std_msgs/Int16 _panUnlockId
    (send _panUnlockId :serialization-length)
    ;; std_msgs/Int16 _tiltPos
    (send _tiltPos :serialization-length)
    ;; std_msgs/Int8 _tiltSpeed
    (send _tiltSpeed :serialization-length)
    ;; std_msgs/Int16 _tiltUnlockId
    (send _tiltUnlockId :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int16 _panPos
       (send _panPos :serialize s)
     ;; std_msgs/Int8 _panSpeed
       (send _panSpeed :serialize s)
     ;; std_msgs/Int16 _panUnlockId
       (send _panUnlockId :serialize s)
     ;; std_msgs/Int16 _tiltPos
       (send _tiltPos :serialize s)
     ;; std_msgs/Int8 _tiltSpeed
       (send _tiltSpeed :serialize s)
     ;; std_msgs/Int16 _tiltUnlockId
       (send _tiltUnlockId :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int16 _panPos
     (send _panPos :deserialize buf ptr-) (incf ptr- (send _panPos :serialization-length))
   ;; std_msgs/Int8 _panSpeed
     (send _panSpeed :deserialize buf ptr-) (incf ptr- (send _panSpeed :serialization-length))
   ;; std_msgs/Int16 _panUnlockId
     (send _panUnlockId :deserialize buf ptr-) (incf ptr- (send _panUnlockId :serialization-length))
   ;; std_msgs/Int16 _tiltPos
     (send _tiltPos :deserialize buf ptr-) (incf ptr- (send _tiltPos :serialization-length))
   ;; std_msgs/Int8 _tiltSpeed
     (send _tiltSpeed :deserialize buf ptr-) (incf ptr- (send _tiltSpeed :serialization-length))
   ;; std_msgs/Int16 _tiltUnlockId
     (send _tiltUnlockId :deserialize buf ptr-) (incf ptr- (send _tiltUnlockId :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::MovePanTiltCommand :md5sum-) "e02b68971ce7a0ff6df448c278f194a2")
(setf (get robobo_msgs::MovePanTiltCommand :datatype-) "robobo_msgs/MovePanTiltCommand")
(setf (get robobo_msgs::MovePanTiltCommand :definition-)
      "# Commands the robot to move it's pan and/or
# tilt. It won't move unless the UnlockId is 
# different than 0.
#
# Desired pan position. Range 11 .. 343
std_msgs/Int16 panPos
# Desired pan speed
std_msgs/Int8 panSpeed
# Identifier for end-of-movement notification
std_msgs/Int16 panUnlockId
# Desired tilt position. Range 0 .. 100
std_msgs/Int16 tiltPos
# Desired tilt speed
std_msgs/Int8 tiltSpeed
# Identifier for end-of-movement notification
std_msgs/Int16 tiltUnlockId

================================================================================
MSG: std_msgs/Int16
int16 data

================================================================================
MSG: std_msgs/Int8
int8 data

")



(provide :robobo_msgs/MovePanTiltCommand "e02b68971ce7a0ff6df448c278f194a2")


