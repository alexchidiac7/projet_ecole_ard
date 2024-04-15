
(cl:in-package :asdf)

(defsystem "biotac_sp_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Floats" :depends-on ("_package_Floats"))
    (:file "_package_Floats" :depends-on ("_package"))
    (:file "HeaderString" :depends-on ("_package_HeaderString"))
    (:file "_package_HeaderString" :depends-on ("_package"))
  ))