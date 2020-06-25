#lang sicp

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x) (* x x x))
(define (integral f a b dx)
  ;запишем next
  (define (add-dx x) (+ x dx))
  ; f - есть term
  (* (sum f (+ a (/ dx 2)) add-dx b) dx))

(display "(integral cube 0 1 0.01)\n")
(integral cube 0 1 0.01)
(display "\n")


(display "(integral cube 0 1 0.001)\n")
(integral cube 0 1 0.001)
(display "\n")