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
        

(check-equal? ((repeated inc 2) 5) 7)
(check-equal? ((repeated inc 10) 10) 20)
(check-equal? ((repeated square 2) 5) 625)
(check-equal? ((repeated square 3) 3) 6561)



      