#|
  This file is a part of cl-blockchain
  (c) 2019 Ben Hanna (benpaulhanna@gmail.com)
  Author: Ben Hanna <benpaulhanna@gmail.com>
|#

(defpackage #:cl-blockchain
  (:use
   #:cl
   #:ironclad)
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

(defun hash-block (timestamp)
  (let ((data (ironclad:integer-to-octets timestamp)))
    (ironclad:byte-array-to-hex-string
     (ironclad:digest-sequence :sha256 data))))

(defun make-block ()
  (let* ((timestamp (get-universal-time)))
    (make-instance 'block-object
                   :timestamp timestamp
                   :hash (hash-block timestamp))))
