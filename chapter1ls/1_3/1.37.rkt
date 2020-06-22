#lang sicp

(define (cont-frac n d k)
    (if (= k 1)
        (/ (n k) (n d))
        (/ (n k) (+ (n d) (cont-frac n d (- k 1))))))

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 5000)
