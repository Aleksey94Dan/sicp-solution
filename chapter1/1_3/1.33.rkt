#lang sicp

(define (filtered-accumulate combiner null-value predicat term a next b)
  (if (> a b)
      null-value
      (combiner (term
                 (if (predicat a)
                     a
                     null-value))
                (filtered-accumulate combiner null-value predicat term (next a) next b))))


(define (next x) (+ 1 x))
(define (term x) x)

(define (sum-integers-even a b)
  (filtered-accumulate + 0 even? term a next b))

(define (product-integers-even a b)
  (filtered-accumulate * 1 even? term a next b))

(= (+ 2 4 6) (sum-integers-even 1 6))
(= (+ 2 4 6) (sum-integers-even 1 7))
(= (* 2 4 6) (product-integers-even 1 6))
(= (* 2 4 6) (product-integers-even 1 7))
(display "\n")
;а) сумма квадратов простых чисел в интервале от a до b
;term
(define (square x) (* x x))
;next
(define (inc x) (+ x 1))
;predicat
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (divides? a b)
    (= (remainder b a) 0))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (if (= n 1)
      (not (= n 1))
      (= n (smallest-divisor n))))

(define (sum-square-primes a b)
  (filtered-accumulate + 0 prime? square a inc b))

(= (+ (square 2) (square 3) (square 5) (square 7) (square 11)) (sum-square-primes 1 12))

; б) произведение положительных целых чисел меньше n, которые просты по отношению к n
;term
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-gcd n)
  (define (identity x) x)
  (define (gcd? k)
    (= (gcd n k) 1))
  (filtered-accumulate * 1 gcd? identity 1 inc n))

(product-gcd 5)

(= (*
    ((lambda (x) (if (= (gcd 5 x) 1) x 1)) 1)
    ((lambda (x) (if (= (gcd 5 x) 1) x 1)) 2)
    ((lambda (x) (if (= (gcd 5 x) 1) x 1)) 3)
    ((lambda (x) (if (= (gcd 5 x) 1) x 1)) 4)
    ((lambda (x) (if (= (gcd 5 x) 1) x 1)) 5)
    )
   (product-gcd 5)
   )

   