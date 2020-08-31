#lang racket/base

(require rackunit)


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define (numer x) (car x))


(define (denom x) (cdr x))


(define (make-rat n d)
  (cond ((and (> n 0) (> d 0)) (cons n d))
        ((and (< n 0) (< d 0)) (cons (* -1 n) (* -1 d)))
        ((< n 0) (cons n d))
        ((< d 0) (cons (* -1 n) (* -1 d)))
        (else 0)))


(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))


(check-equal? (make-rat 1 2) (cons 1 2))
(check-equal? (make-rat -1 -2) (cons 1 2))
(check-equal? (make-rat -1 2) (cons -1 2))
(check-equal? (make-rat 1 -2) (cons -1 2))


(define minus-one-half (make-rat 1 -2))
(define minus-one-third (make-rat -1 -3))

(print-rat (mul-rat minus-one-half minus-one-third))






