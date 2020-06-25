#lang racket

(define (expt b n) (exp-iter b n 1))

(define (exp-iter b counter product)
    (if (= counter 0) product
        (exp-iter b (- counter 1) (* product b))))

(expt 2 4)
; exp-iter 2 4 1 -> exp-iter 2 3 2 -> exp-iter 2 2 4 -> exp-iter 2 1 8 -> exp-iter 2 0 16
; Так как с каждым новым вызовом мы перезаписываем результат, то памяти требуется O(1).
; Порядок роста линейный O(n)