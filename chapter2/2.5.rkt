#lang racket
(require rackunit)

(define (expt b n) 
  (define (exp-iter b counter product)
    (if (= counter 0) product
        (exp-iter b (- counter 1) (* product b))))
  (exp-iter b n 1)
 )

(define (cons x y)
  (* (expt 2 x) (expt 3 y))
 )

(define (car z)
  (factor-number z 2))

(define (cdr z)
  (factor-number z 3))

(define (factor-number value base)
  (define (factor-number-iter value base counter)
  (if (= (remainder value base) 0) (factor-number-iter (/ value base) base (+ counter 1))
      counter))
  (factor-number-iter value base 0)
)

(define a 2)
(define b 3)
(define x (cons a b))
(define x2 (cons 0 1))
(define x3 (cons 1 0))

(check-equal? x 108)
(check-equal? x2 3)
(check-equal? x3 2)
(check-equal? (cdr x) b)
(check-equal? (car x2) 0)
(check-equal? (cdr x2) 1)
(check-equal? (car x3) 1)
(check-equal? (cdr x3) 0)
