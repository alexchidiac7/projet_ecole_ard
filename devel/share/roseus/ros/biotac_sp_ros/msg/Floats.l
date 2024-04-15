;; Auto-generated. Do not edit!


(when (boundp 'biotac_sp_ros::Floats)
  (if (not (find-package "BIOTAC_SP_ROS"))
    (make-package "BIOTAC_SP_ROS"))
  (shadow 'Floats (find-package "BIOTAC_SP_ROS")))
(unless (find-package "BIOTAC_SP_ROS::FLOATS")
  (make-package "BIOTAC_SP_ROS::FLOATS"))

(in-package "ROS")
;;//! \htmlinclude Floats.msg.html


(defclass biotac_sp_ros::Floats
  :super ros::object
  :slots (_data ))

(defmethod biotac_sp_ros::Floats
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get biotac_sp_ros::Floats :md5sum-) "420cd38b6b071cd49f2970c3e2cee511")
(setf (get biotac_sp_ros::Floats :datatype-) "biotac_sp_ros/Floats")
(setf (get biotac_sp_ros::Floats :definition-)
      "float32[] data

")



(provide :biotac_sp_ros/Floats "420cd38b6b071cd49f2970c3e2cee511")


