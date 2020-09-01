#lang racket/base

(require rackunit)

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



(define (midpoint-segment segment)
  (let ((x1 (x-point (start-segment segment)))
        (x2 (x-point (end-segment segment)))
        (y1 (y-point (start-segment segment)))
        (y2 (y-point (end-segment segment))))
    (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))


(define (AB-segment)
  (make-segment (make-point 1 1) (make-point 5 1)))


(define (AC-segment)
  (make-segment (make-point 2 1) (make-point 8 3)))

(define (0-segment)
  (make-segment (make-point 0 0) (make-point 0 0)))


(check-equal? (midpoint-segment (AB-segment)) (make-point 3 1))
(check-equal? (midpoint-segment (AC-segment)) (make-point 5 2))
(check-equal? (midpoint-segment (0-segment)) (make-point 0 0))


