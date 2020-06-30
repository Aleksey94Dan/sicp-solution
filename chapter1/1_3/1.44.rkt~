#lang racket/base

(require rackunit)

(define (square x)(* x x))
(define (inc x) (+ x 1))


(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))


(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ 3
       (+
        (f (- x dx))
        (f x)
        (f (+ x dx))
        )
       )
    )
  )



(define (n-fold-smoothoed-function f n)
  (repeated f n))


