#lang racket

(define (square x) (* x x))

(define (even? x)
    (= (remainder x 2) 0))

(define (expt b n) (expt-iter b n 1))

(define (expt-iter b n a)
    (
        cond
            ((= n 0) a)
            ((even? n) (expt-iter (square b) (/ n 2) a))
            (else (expt-iter b (- n 1) (* a b)))
    )
)

(expt 2 4)
;(expt 2 4)
;(expt-iter 2 4 1) -> 1*2^4=16
;(expt-iter 4 2 1) -> 1*4^2=16
;(expt-iter 16 1 1) -> 16*1^2
;(expt-iter 16 0 16) -> 16*16^0
;Как видно, решение соответсвует условим инваринатности






