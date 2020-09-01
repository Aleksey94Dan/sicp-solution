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
    (/ (+
        (f (- x dx))
        (f x)
        (f (+ x dx))
        )
       3
       )
    )
  )


(check-equal? ((smooth square) 2) 4.000000000066667)
(check-equal? ((smooth inc) 2)  3.0)


(define (n-fold-smoothoed-function f n)
  ((repeated smooth n) f))

((n-fold-smoothoed-function inc 8) 3)
((n-fold-smoothoed-function square 8) 3)

