(defclass circle ()
  ((radius :initarg :radius
           :initform 0 ;; (error "You must provide a radius")
           :reader radius))) ;; Can refer to radius directly witout (slot-value)

(defparameter *my-circle* (make-instance 'circle :radius 5))

(print (class-of *my-circle*))

(print (slot-value *my-circle* 'radius))
(setf (slot-value *my-circle* 'radius) 10)
(print (slot-value *my-circle* 'radius))
(setf (radius *my-circle*) 10)
(print (radius *my-circle*))

(defclass colored-circle (circle)
  ((color :initarg :color
          :initform "red"
          :accessor color)))

(defparameter *green-circle* (make-instance 'colored-circle :radius 15 :color 'green))

;; Class in lisp supports multiple inheritance

(defgeneric area (shape)
  (:documentation "Calculate the area of a shape"))

(defmethod area ((shape circle))
  (* pi (radius shape) (radius shape)))

;; Polymorphism

(defclass avatar () ())
(defclass warrior (avatar) ())
(defclass mage (avatar) ())

(defclass weapon () ())
(defclass sword (weapon) ())
(defclass staff (weapon) ())

(defgeneric attack (avatar weapon))

(defmethod attack ((avatar warrior) (weapon sword))
  (format t "Warrior attacks with a sword!~%"))

(defmethod attack ((avatar mage) (weapon sword))
  (format t "Mage attacks weakly with a sword!~%"))

(let ((war (make-instance 'warrior))
      (mag (make-instance 'mage))
      (big-sword (make-instance 'sword))
      (magic-staff (make-instance 'staff)))
  (attack war big-sword)
  (attack war magic-staff)
  (attack mag big-sword)
  (attack mag magic-staff))

;; Override toString method
(defmethod print-object ((obj circle) stream)
  (format stream "A circle with radius ~A" (radius obj)))

