#lang sicp

(define (square x) (* x x))

(define (f g) (g 2))

(f square)
;(square 2) -> 4

(f (lambda (z) (* z (+ z 1))))
;(lambda (2) (* 2 (+ 2 1)))
;(lambda (2) (* 2 3))
;(lambda (2) 6)
; 6

(f f)
;(f f)
;(f 2)
;(2 2)
; application: not a procedure;
