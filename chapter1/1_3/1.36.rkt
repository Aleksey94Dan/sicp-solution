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

(define (average x y) (/ (+ x y) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.01)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.01)
; при использовании торможения усреднением fixed-point занимает 17 шагов
; без использовании торможения усреднением fixed-point занимает 41 шагов