#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (display "iter = ")
    (display count)
    (display "\t")
    (display "guess = ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ count 1)))))
  (try first-guess 1))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.01)
