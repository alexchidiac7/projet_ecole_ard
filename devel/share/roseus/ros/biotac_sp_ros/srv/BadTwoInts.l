;; Auto-generated. Do not edit!


(when (boundp 'biotac_sp_ros::BadTwoInts)
  (if (not (find-package "BIOTAC_SP_ROS"))
    (make-package "BIOTAC_SP_ROS"))
  (shadow 'BadTwoInts (find-package "BIOTAC_SP_ROS")))
(unless (find-package "BIOTAC_SP_ROS::BADTWOINTS")
  (make-package "BIOTAC_SP_ROS::BADTWOINTS"))
(unless (find-package "BIOTAC_SP_ROS::BADTWOINTSREQUEST")
  (make-package "BIOTAC_SP_ROS::BADTWOINTSREQUEST"))
(unless (find-package "BIOTAC_SP_ROS::BADTWOINTSRESPONSE")
  (make-package "BIOTAC_SP_ROS::BADTWOINTSRESPONSE"))

(in-package "ROS")





(defclass biotac_sp_ros::BadTwoIntsRequest
  :super ros::object
  :slots (_a _b ))

(defmethod biotac_sp_ros::BadTwoIntsRequest
  (:init
   (&key
    ((:a __a) 0)
    ((:b __b) 0)
    )
   (send-super :init)
   (setq _a (round __a))
   (setq _b (round __b))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; int64 _a
    8
    ;; int32 _b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _a
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _a (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _a) (= (length (_a . bv)) 2)) ;; bignum
              (write-long (ash (elt (_a . bv) 0) 0) s)
              (write-long (ash (elt (_a . bv) 1) -1) s))
             ((and (class _a) (= (length (_a . bv)) 1)) ;; big1
              (write-long (elt (_a . bv) 0) s)
              (write-long (if (>= _a 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _a s)(write-long (if (>= _a 0) 0 #xffffffff) s)))
     ;; int32 _b
       (write-long _b s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _a
#+(or :alpha :irix6 :x86_64)
      (setf _a (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _a (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int32 _b
     (setq _b (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass biotac_sp_ros::BadTwoIntsResponse
  :super ros::object
  :slots (_sum ))

(defmethod biotac_sp_ros::BadTwoIntsResponse
  (:init
   (&key
    ((:sum __sum) 0)
    )
   (send-super :init)
   (setq _sum (round __sum))
   self)
  (:sum
   (&optional __sum)
   (if __sum (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; int32 _sum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sum
       (write-long _sum s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sum
     (setq _sum (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass biotac_sp_ros::BadTwoInts
  :super ros::object
  :slots ())

(setf (get biotac_sp_ros::BadTwoInts :md5sum-) "60962375a49bd6746d7c85dff75ebb9c")
(setf (get biotac_sp_ros::BadTwoInts :datatype-) "biotac_sp_ros/BadTwoInts")
(setf (get biotac_sp_ros::BadTwoInts :request) biotac_sp_ros::BadTwoIntsRequest)
(setf (get biotac_sp_ros::BadTwoInts :response) biotac_sp_ros::BadTwoIntsResponse)

(defmethod biotac_sp_ros::BadTwoIntsRequest
  (:response () (instance biotac_sp_ros::BadTwoIntsResponse :init)))

(setf (get biotac_sp_ros::BadTwoIntsRequest :md5sum-) "60962375a49bd6746d7c85dff75ebb9c")
(setf (get biotac_sp_ros::BadTwoIntsRequest :datatype-) "biotac_sp_ros/BadTwoIntsRequest")
(setf (get biotac_sp_ros::BadTwoIntsRequest :definition-)
      "# Bad version of AddTwoInts for unit testing
int64 a
int32 b
---
int32 sum

")

(setf (get biotac_sp_ros::BadTwoIntsResponse :md5sum-) "60962375a49bd6746d7c85dff75ebb9c")
(setf (get biotac_sp_ros::BadTwoIntsResponse :datatype-) "biotac_sp_ros/BadTwoIntsResponse")
(setf (get biotac_sp_ros::BadTwoIntsResponse :definition-)
      "# Bad version of AddTwoInts for unit testing
int64 a
int32 b
---
int32 sum

")



(provide :biotac_sp_ros/BadTwoInts "60962375a49bd6746d7c85dff75ebb9c")


