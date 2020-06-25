#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (inc k) (+ k 1))
  (define (term-simpson k)
    (define (next-y k)
      (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2)
            (else 4)))
  (* (next-y k) (f (+ a (* k h)))))
  (* (/ h 3) (sum term-simpson 0 inc n)))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
