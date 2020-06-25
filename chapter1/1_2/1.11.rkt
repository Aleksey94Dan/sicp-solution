#lang racket
; рекурсивный процесс
(define (f n)
  (cond
    ((< n 3) n)
    (else (+ (f (- n 1)) (f (- n 2)) (f (- n 3))))))

;(f 0)
;(f 1)
;(f 2)
;(f 3)
;f 3
;(f 3)
;(+ (f 2) (f 1) (f 0))
;(+ 2 1 0)
;3

;итеративный процессы
(define (f n)
  (f-iter 0 1 2 n))

(define (f-iter a b c count)
  (if (= count 0) a
     (f-iter b c (+ a b c) (- count 1))))

(f 5)
;(f-iter 0 1 2 5)
;(f-iter 1 2 3 4)
;(f-iter 2 3 6 3)
;(f-iter 3 6 11 2)
;(f-iter 6 11 20 1)
;(f-iter 11 20 37 0)
;11

