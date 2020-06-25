#lang racket

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-* a b) (fast-*-iter a b 0))

(define (fast-*-iter a b n)
    (cond
        ((= b 0) n)
        ((even? b) (fast-*-iter (double a) (halve b) n))
        (else (fast-*-iter a (- b 1) (+ a n)))
    )
)
(fast-*-iter 7 5 0)
; (fast-*-iter 5 6 5) -> 5 * 6 + 5 = 35
; (fast-*-iter 10 3 5) -> 10 * 3 + 5 = 35
; (fast-*-iter 10 2 15)-> 10 * 2 + 15=35
; (fast-*-iter 20 1 15)-> 20 * 1 + 15=35
; (fast-*-iter 20 0 35) -> 20 * 0 + 35=35



; (fast-*-iter 5 6 0)
; (fast-*-iter 10 3 0)
; (fast-*-iter 10 2 10)
; (fast-*-iter 20 1 10)
; (fast-*-iter 20 0 30)
















