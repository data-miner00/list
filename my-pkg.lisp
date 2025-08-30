(defpackage :com.example.my-pkg
  (:use :cl)
  (:export :test)) ;; (com.example.my-pkg:test) to call

(in-package :com.example.my-pkg)

(defun test () "Hello from my-pkg!") ;; (com.example.my-pkg::test) to call

(defpackage :com.example.other-pkg
  (:use :cl)
  (:import-from :com.example.my-pkg #:test)
  (:export #:test2))

(in-package :com.example.other-pkg)

(defun test2 () (test))


