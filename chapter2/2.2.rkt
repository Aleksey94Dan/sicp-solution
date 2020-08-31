#lang racket/base


(define (make-segment start end)
  (cons start end))


(define (start-segment segment)
  (car segment))


(define (end-segment segment)
  (cdr segment))


(define (make-point x y)
  (cons x y))


(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))


