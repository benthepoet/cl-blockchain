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
   #:add-block
   #:make-block
   #:make-chain))

(in-package #:cl-blockchain)

(defclass block-object ()
  ((timestamp
    :initarg :timestamp
    :accessor timestamp)
   (hash
    :initarg :hash
    :accessor hash)
   (previous-hash
    :initarg :previous-hash
    :accessor previous-hash)))

(defun add-block (chain)
  (let* ((last-block (car chain))
         (new-block (make-block (hash last-block))))
    (append (list new-block) chain)))

(defun hash-block (timestamp previous-hash)
  (let ((data (ironclad:ascii-string-to-byte-array
               (format nil "~d~A" timestamp previous-hash))))
    (ironclad:byte-array-to-hex-string
     (ironclad:digest-sequence :sha256 data))))

(defun make-block (previous-hash)
  (let* ((timestamp (get-universal-time)))
    (make-instance 'block-object
                   :timestamp timestamp
                   :hash (hash-block timestamp previous-hash)
                   :previous-hash previous-hash)))

(defun make-chain ()
  (list (make-block nil)))
