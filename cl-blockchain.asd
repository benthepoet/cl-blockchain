#|
 This file is a part of cl-blockchain
 (c) 2019 Ben Hanna (benpaulhanna@gmail.com)
 Author: Ben Hanna <benpaulhanna@gmail.com>
|#

(in-package #:cl-user)
(asdf:defsystem cl-blockchain
  :version "0.0.0"
  :license "BSD-3"
  :author "Ben Hanna <benpaulhanna@gmail.com>"
  :maintainer "Ben Hanna <benpaulhanna@gmail.com>"
  :description "A blockchain implementation in Common Lisp."
  :serial T
  :components ((:file "package"))
  :depends-on (:ironclad))
