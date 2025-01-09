;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetCameraCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetCameraCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETCAMERACOMMAND")
  (make-package "ROBOBO_MSGS::SETCAMERACOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SetCameraCommand.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::SetCameraCommand
  :super ros::object
  :slots (_camera ))

(defmethod robobo_msgs::SetCameraCommand
  (:init
   (&key
    ((:camera __camera) (instance std_msgs::Int8 :init))
    )
   (send-super :init)
   (setq _camera __camera)
   self)
  (:camera
   (&rest __camera)
   (if (keywordp (car __camera))
       (send* _camera __camera)
     (progn
       (if __camera (setq _camera (car __camera)))
       _camera)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int8 _camera
    (send _camera :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int8 _camera
       (send _camera :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int8 _camera
     (send _camera :deserialize buf ptr-) (incf ptr- (send _camera :serialization-length))
   ;;
   self)
  )

(setf (get robobo_msgs::SetCameraCommand :md5sum-) "f58deb2ef48d6f096e653df51bb44a22")
(setf (get robobo_msgs::SetCameraCommand :datatype-) "robobo_msgs/SetCameraCommand")
(setf (get robobo_msgs::SetCameraCommand :definition-)
      "# Commands the robot to change the camera 
#
# Identifier of the camera to use:
# 0 for front camera
# 1 for back cameras
std_msgs/Int8 camera   

================================================================================
MSG: std_msgs/Int8
int8 data

")



(provide :robobo_msgs/SetCameraCommand "f58deb2ef48d6f096e653df51bb44a22")


