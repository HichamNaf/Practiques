;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::SetModule)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'SetModule (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::SETMODULE")
  (make-package "ROBOBO_MSGS::SETMODULE"))
(unless (find-package "ROBOBO_MSGS::SETMODULEREQUEST")
  (make-package "ROBOBO_MSGS::SETMODULEREQUEST"))
(unless (find-package "ROBOBO_MSGS::SETMODULERESPONSE")
  (make-package "ROBOBO_MSGS::SETMODULERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robobo_msgs::SetModuleRequest
  :super ros::object
  :slots (_moduleName _moduleState ))

(defmethod robobo_msgs::SetModuleRequest
  (:init
   (&key
    ((:moduleName __moduleName) (instance std_msgs::String :init))
    ((:moduleState __moduleState) (instance std_msgs::Bool :init))
    )
   (send-super :init)
   (setq _moduleName __moduleName)
   (setq _moduleState __moduleState)
   self)
  (:moduleName
   (&rest __moduleName)
   (if (keywordp (car __moduleName))
       (send* _moduleName __moduleName)
     (progn
       (if __moduleName (setq _moduleName (car __moduleName)))
       _moduleName)))
  (:moduleState
   (&rest __moduleState)
   (if (keywordp (car __moduleState))
       (send* _moduleState __moduleState)
     (progn
       (if __moduleState (setq _moduleState (car __moduleState)))
       _moduleState)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _moduleName
    (send _moduleName :serialization-length)
    ;; std_msgs/Bool _moduleState
    (send _moduleState :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _moduleName
       (send _moduleName :serialize s)
     ;; std_msgs/Bool _moduleState
       (send _moduleState :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _moduleName
     (send _moduleName :deserialize buf ptr-) (incf ptr- (send _moduleName :serialization-length))
   ;; std_msgs/Bool _moduleState
     (send _moduleState :deserialize buf ptr-) (incf ptr- (send _moduleState :serialization-length))
   ;;
   self)
  )

(defclass robobo_msgs::SetModuleResponse
  :super ros::object
  :slots (_error ))

(defmethod robobo_msgs::SetModuleResponse
  (:init
   (&key
    ((:error __error) (instance std_msgs::Int8 :init))
    )
   (send-super :init)
   (setq _error __error)
   self)
  (:error
   (&rest __error)
   (if (keywordp (car __error))
       (send* _error __error)
     (progn
       (if __error (setq _error (car __error)))
       _error)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int8 _error
    (send _error :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int8 _error
       (send _error :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int8 _error
     (send _error :deserialize buf ptr-) (incf ptr- (send _error :serialization-length))
   ;;
   self)
  )

(defclass robobo_msgs::SetModule
  :super ros::object
  :slots ())

(setf (get robobo_msgs::SetModule :md5sum-) "d1ff912db9829e756961c386739c3bd2")
(setf (get robobo_msgs::SetModule :datatype-) "robobo_msgs/SetModule")
(setf (get robobo_msgs::SetModule :request) robobo_msgs::SetModuleRequest)
(setf (get robobo_msgs::SetModule :response) robobo_msgs::SetModuleResponse)

(defmethod robobo_msgs::SetModuleRequest
  (:response () (instance robobo_msgs::SetModuleResponse :init)))

(setf (get robobo_msgs::SetModuleRequest :md5sum-) "d1ff912db9829e756961c386739c3bd2")
(setf (get robobo_msgs::SetModuleRequest :datatype-) "robobo_msgs/SetModuleRequest")
(setf (get robobo_msgs::SetModuleRequest :definition-)
      "# Commands the robot to start/stop a module
#
# Module name; posible values: tag, object-detection, lane-detection 
# State: true on, false off
std_msgs/String moduleName
std_msgs/Bool moduleState

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Bool
---
std_msgs/Int8 error


================================================================================
MSG: std_msgs/Int8
int8 data
")

(setf (get robobo_msgs::SetModuleResponse :md5sum-) "d1ff912db9829e756961c386739c3bd2")
(setf (get robobo_msgs::SetModuleResponse :datatype-) "robobo_msgs/SetModuleResponse")
(setf (get robobo_msgs::SetModuleResponse :definition-)
      "# Commands the robot to start/stop a module
#
# Module name; posible values: tag, object-detection, lane-detection 
# State: true on, false off
std_msgs/String moduleName
std_msgs/Bool moduleState

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Bool
---
std_msgs/Int8 error


================================================================================
MSG: std_msgs/Int8
int8 data
")



(provide :robobo_msgs/SetModule "d1ff912db9829e756961c386739c3bd2")


