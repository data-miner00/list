(defun fib (n)
  (declare (optimize debug))
  (break)
  (if (<= n 1) n (print "Calculating fib " n)
    (when (< n 3) (break))
    (+ (fib (- n 1)) (fib (- n 2)))))

(defun factorial (n)
  (if (= n 0) 1 (* n (factorial (1- n)))))

(defun gcd (a b)
  (if (= b 0) a (gcd b (mod a b))))

(defun lcm (a b)
  (/ (* a b) (gcd a b)))

(define-condition negative-number (error)
  ((text :initarg :text :reader negative-number-text)))


