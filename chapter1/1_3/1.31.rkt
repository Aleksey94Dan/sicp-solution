#lang sicp

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (product-cubes-rec a b)
  (product-rec cube a inc b))

(define (product-cubes-iter a b)
  (product-iter cube a inc b))

(display "rec-process\n")
(product-cubes-rec 1 11)
(display "iter-process\n")
(product-cubes-iter 1 11)

;процедура для вычисления факториала
(define (factorial n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (product-iter term 1 next n))

(display "factorial\n")
(factorial 5)


;процедура для вычисления приближенного значения пи

(define (john-wolles)
  (define (term x) (* (/ (- x 1) x) (/ (+ x 1) x)))
  (define (next x) (+ x 2))
  (* 4 (product-iter term 3.0 next 7.0)))
(john-wolles)
