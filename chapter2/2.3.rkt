#lang racket/base

(require rackunit)


(define (make-segment start-point end-point) (cons start-point end-point))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))


(define (make-point x y) (cons x y))

(define (x-point point) (car point))
(define (y-point point) (cdr point))


(define (midpoint-select segment)
  (let
    ((x1 (x-point (start-segment segment)))
     (x2 (x-point (end-segment segment)))
     (y1 (y-point (start-segment segment)))
     (y2 (y-point (end-segment segment))))
  (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))
))



(define (rectangle-perimeter rectangle)
  (* (+ (select-length rectangle) (select-width rectangle)) 2)
)

(define (rectangle-area rectangle)
  (* (select-length rectangle) (select-width rectangle))
)

;; View 1. top-left-point, Length and width, and one coordinates.
(define (make-rectangle-1 top-left-point length width)
  (cons top-left-point (cons length width)))

(define (select-length rectangle) (car (cdr rectangle)))
(define (select-width rectangle) (cdr (cdr rectangle)))

(define (rectangle-1)(make-rectangle-1 (make-point 0 0) 2 2))
(define (rectangle-2)(make-rectangle-1 (make-point 0 0) 6 2))


(check-equal? (rectangle-perimeter (rectangle-1)) 8)
(check-equal? (rectangle-perimeter (rectangle-2)) 16)
(check-equal? (rectangle-area (rectangle-1)) 4)
(check-equal? (rectangle-area (rectangle-2)) 12)

;; View 2. diagonal coordinates.

(define (make-rectangle-2  point-1 point-2)
  (let
    ((top-left-point (make-point (x-point point-1) (y-point point-2)))
     (length (abs (- (x-point point-2) (x-point point-1))))
     (width (abs (- (y-point point-2) (y-point point-1)))))
    (cons top-left-point (cons length width))))
     

(define (rectangle-3) (make-rectangle-2 (make-point 0 0) (make-point 4 4)))
(define (rectangle-4) (make-rectangle-2 (make-point 0 0) (make-point 5 2)))


(check-equal? (rectangle-perimeter (rectangle-3)) 16)
(check-equal? (rectangle-perimeter (rectangle-4)) 14)
(check-equal? (rectangle-area (rectangle-3)) 16)
(check-equal? (rectangle-area (rectangle-4)) 10)
