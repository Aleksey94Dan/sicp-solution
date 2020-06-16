#lang racket

(define (fast-expt b n)
    (cond ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))
(define (even? n)
    (= (remainder n 2) 0))

(fast-expt 2 4)
;(fast-expt 2 4)
;(fast-expt 2 4) -> (square (fast-expt 2 2))
;(square (fast-expt 2 2)) -> (square (square (fast-expt 2 1)))
;(square (square (2* (fast-expt 2 0)))
;(square (square (2 * 1)))
;(square (4))
;16
;Процесс имеет степень роста O(log(n))
