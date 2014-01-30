(in-package :cl-user)
(defpackage pcl-pathname-asd
  (:use :cl :asdf))
(in-package :pcl-pathname-asd)

(defsystem pcl-pathname
  :version "0.1"
  :author "Chan Beom Park"
  :license "BSD"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "pcl-pathname"))))
  :description "Code from Chapter 15 of Practical Common Lisp written by P. Seibel"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq))))
