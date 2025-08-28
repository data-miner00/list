(defun my-when (condition true-fn)
  (if condition (funcall true-fn)))

(my-when t (lambda () (print "Condition is true!")))

;; Optional args
(defun greet (name &optional (greeting "Hello")) ;; Greeting is optional and defaults to "Hello"
  (format t "~a, ~a!~%" greeting name))

;; Collecting args
(defun sum (&rest numbers) ;; Collects all arguments into a list called numbers
  (reduce #'+ numbers))

;; Any optional args
(defun use-key (&key a b c) (list a b c))
(use-key :b 2) ;; => (NIL 2 NIL)

