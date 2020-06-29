#lang racket/base

(require rackunit)

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(check-equal? ((compose square inc) 6) 49)
