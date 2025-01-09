;; Auto-generated. Do not edit!


(when (boundp 'robobo_msgs::ModuleControlCommand)
  (if (not (find-package "ROBOBO_MSGS"))
    (make-package "ROBOBO_MSGS"))
  (shadow 'ModuleControlCommand (find-package "ROBOBO_MSGS")))
(unless (find-package "ROBOBO_MSGS::MODULECONTROLCOMMAND")
  (make-package "ROBOBO_MSGS::MODULECONTROLCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ModuleControlCommand.msg.html


(defclass robobo_msgs::ModuleControlCommand
  :super ros::object
  :slots (_module_name _on ))

(defmethod robobo_msgs::ModuleControlCommand
  (:init
   (&key
    ((:module_name __module_name) "")
    ((:on __on) nil)
    )
   (send-super :init)
   (setq _module_name (string __module_name))
   (setq _on __on)
   self)
  (:module_name
   (&optional __module_name)
   (if __module_name (setq _module_name __module_name)) _module_name)
  (:on
   (&optional (__on :null))
   (if (not (eq __on :null)) (setq _on __on)) _on)
  (:serialization-length
   ()
   (+
    ;; string _module_name
    4 (length _module_name)
    ;; bool _on
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _module_name
       (write-long (length _module_name) s) (princ _module_name s)
     ;; bool _on
       (if _on (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _module_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _module_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _on
     (setq _on (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robobo_msgs::ModuleControlCommand :md5sum-) "e6a9b409247a54586771369e8f259611")
(setf (get robobo_msgs::ModuleControlCommand :datatype-) "robobo_msgs/ModuleControlCommand")
(setf (get robobo_msgs::ModuleControlCommand :definition-)
      "# Commands the robot to turn on or off a module
#
# Name of the module
string module_name
# A bool to represent if the module should be turned
# on or off (true for on and false for off)
bool on

")



(provide :robobo_msgs/ModuleControlCommand "e6a9b409247a54586771369e8f259611")


