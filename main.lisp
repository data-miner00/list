;; Hello World
(format t "Hello, World!~%")

;; Math expression
(/ (+ -6 (sqrt (- (* 6 6) (* 4 1 8)))) (* 2 1))

;; Variables and functions
(defun ask-name ()
  (format t "What is your name? ")
  (finish-output)
  (read-line))

(defun ask-and-return ()
  (let ((name (ask-name))
        (another (ask-name))
        (intro ""))
    (setf another (string-upcase another))  ;; Modifies existing variable
    (setf intro (concatenate 'string "My name is " name "."))
    (format t "~A and ~A~%" name another)
    (terpri)
    (format t "~A~%" intro)
    name))

(princ (ask-and-return))

;; Declaration works in parallel, cannot refer y to x. Use * for sequential.
(let* ((x 42) (y x))
  (princ x)
  (terpri)
  (princ y))

;; If-else
(defun print-sign (n)
  (if (< n 0)
    (format t "Negative~%")
    (format t "Positive~%")))

;; Cond
(defun print-sign-cond (n)
  (cond
    ((< n 0) (format t "Negative~%"))
    ((> n 0) (princ "doing additional positive things: ") (format t "Positive~%"))
    (t (format t "Zero~%"))))

(print-sign-cond 24)

(defun next-even (n)
  (if (evenp n)
    (+ n 2)
    (+ n 1)))

(princ (next-even 3))

;; progn discards everything but the last expression
(defun next-number (n)
  (if (= (mod n 2) 0)
    (progn
      (format t "~A is even~%" n)
      (/ n 2))
    (+ (* 3 n) 1)))

(princ (next-number 6))

(defun read-number ()
  (format t "Enter a number: ")
  (finish-output)
  (parse-integer (read-line)))

(defun read-and-sum (n)
  (let ((total 0))
    (dotimes (i n)
      (setf total (+ total (read-number))))
    total))

(princ (read-and-sum 3))

;; Same function but using do loop
(defun read-and-sum-do (n)
  (let ((total 0))
    (do ((i 0 (+ i 1))) ((= i n) total) ;; return total when i = n
      (setf total (+ total (read-number))))))

(princ (read-and-sum-do 3))
