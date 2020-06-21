#lang sicp

; рекурсивный процесс
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))


; итеративный процесс
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

; процедура умножения
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (product-1 term a next b)
  (accumulate-iter * 1 term a next b))


; процедура суммирования
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-1 term a next b)
  (accumulate-iter + 0 term a next b))


(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum-integers a b)
  (sum identity a inc b))
(display "(sum-integers 1 5)\n")
(sum-integers 1 5)
(display "\n")

(define (sum-integers-1 a b)
  (sum-1 identity a inc b))
(display "(sum-integers 1 5)\n")
(sum-integers-1 1 5)
(display "\n")


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

(define (integral-iter f a b dx)
  ;запишем next
  (define (add-dx x) (+ x dx))
  ; f - есть term
  (* (sum-1 f (+ a (/ dx 2)) add-dx b) dx))

(display "(integral cube 0 1 0.01)\n")
(integral-iter cube 0 1 0.01)
(display "\n")


(display "(integral cube 0 1 0.001)\n")
(integral-iter cube 0 1 0.001)
(display "\n")