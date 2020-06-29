#lang racket/base

(require rackunit)

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x))))




(check-equal? ((double inc) 1) 3)
(check-equal? ((double inc) 15) 17)
(check-equal? ((double square) 2) 16)
(check-equal? ((double square) 3) 81)
(check-equal? (((double (double double)) inc) 5) 21)

