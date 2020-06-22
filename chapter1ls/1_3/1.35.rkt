#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (golden-ratio x)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(golden-ratio 1)
(golden-ratio 2)
(golden-ratio 3)

(define (test-golden-ratio expected actually)
  (< (abs (- expected actually)) 0.0001))

(test-golden-ratio (golden-ratio 1) 1.6180)
(test-golden-ratio (golden-ratio 2) 1.6180)
(test-golden-ratio (golden-ratio 3) 1.6180)
(test-golden-ratio (golden-ratio 4) 1.6180)
(test-golden-ratio (golden-ratio 5) 1.6180)