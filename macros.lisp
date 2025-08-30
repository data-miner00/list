(defun plusf (a b)
  "Returns the sum expression of A and B without evaluating them."
  `(+ ,a ,b))

(defmacro plusm (a b)
  "Macro that evaluates the sum of A and B at compile time."
  `(+ ,a ,b))

(macroexpand-1 '(plusm 2 3))

;; The same
(if t (progn (princ "Hello") (princ " World!")))

(when t (princ "Hello") (princ " Worlds!"))

(defmacro if-let (binding true-expr false-expr)
  `(let (,binding)
     (if ,(first binding) ,true-expr ,false-expr)))

(macroexpand-1 '(if-let (x 42) (+ x 1) 'false))

;; Homework
(defmacro if-swapped (condit false-expr true-expr)
  `(if ,condit ,true-expr ,false-expr))

(let ((ans (if-swapped t 'false 'true)))
    (princ ans))

;; Return first non-nil args
(defmacro my-or (&rest args)
  (if (null args)
      nil
      `(let ((temp# ,(car args)))
         (if temp# temp# (my-or ,@(cdr args))))))

(defmacro my-and (&rest args)
  (if (= (length args) 1)
    (first args)
    `(if ,(first args)
       ,(first args)
       (my-and ,@(rest args)))))


(defmacro for ((var from to) &rest body)
  `(do ((,var ,from (1+ ,var))
        (limit ,to))
     ((>= ,var limit))
     ,@body))



