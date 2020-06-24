#lang sicp

(define (cont-frac n d k) 
    (define (iter i) 
      (/ (n i) (+ (d i) 
                  (if (< i k) 
                      (iter (+ i 1)) 
                      0)))) 
    (iter 1))


(define (tan-cf y k)
  (cont-frac (lambda (x) (if (= x 1) x (- (* x x))))
             (lambda (x) (- (* x 2.0) 1.0))
             k
             )
             )

(tan-cf 1 100)

