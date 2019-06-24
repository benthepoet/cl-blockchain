#|
  This file is a part of cl-blockchain
  (c) 2019 Ben Hanna (benpaulhanna@gmail.com)
  Author: Ben Hanna <benpaulhanna@gmail.com>
|#

(defpackage #:cl-blockchain
  (:use #:cl #:ironclad)
  (:export
   #:make-block))

(in-package #:cl-blockchain)

(defclass block-object ()
  ((timestamp
    :initarg :timestamp
    :accessor timestamp)
   (hash
    :initarg :hash
    :accessor hash)))

(defun make-block ()
  (let* ((timestamp (get-universal-time))
         (data (make-array 8 :element-type '(unsigned-byte 8)))
         (hash (ironclad:digest-sequence :sha256 data)))
    (make-instance 'block-object
                   :timestamp timestamp
                   :hash hash)))
