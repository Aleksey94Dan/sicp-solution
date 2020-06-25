#lang sicp

 (define (cont-frac n d k) 
    (define (iter i) 
      (/ (n i) (+ (d i) 
                  (if (< i k) 
                      (iter (+ i 1)) 
                      0)))) 
    (iter 1)) 


(define (cont k)
  (/ 1 (cont-frac (lambda (x) 1.0) (lambda (x) 1.0) k)))

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

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




(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(golden-ratio)

(define (count-iter standart function)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.0001))
  (define (try guess iter)
    (display "iter = ")
    (display iter)
    (newline)
    (if (close-enough? standart (function guess))
        guess
        (try (+ guess 1) (+ iter 1))))
  (try 1 1))

(count-iter (golden-ratio) cont)
; при приближении с верностью до 4 цифр после запятой k=12

(define (cont-frac-iter n d k)
  (define (iter result k)
    (if (= k 1)
        result
        (/ n (+ d (iter result (- k 1))))))
  (iter 0 k))

(/ 1 (cont-frac-iter 1.0 1.0 109))


