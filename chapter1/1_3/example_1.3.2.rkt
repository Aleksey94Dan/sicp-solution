#lang sicp

;lambda - функции
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b))


(define (integral f a b dx)
  (* (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)
     dx))



(define (cube x) (* x x x))
(integral cube 0 1 0.01)
(integral (lambda (x) (* x x x)) 0 1 0.01)

(define (plus4 x) (+ x 4))
;эквивалентно
(define plus4 (lambda (x) (+ x 4)))
; использование, как оператора в комбинации
((lambda (x y z) (+ x y (* z z))) 1 2 3)

; создание локальных переменных с помощью let
; f(x, y) = x(1 + xy)^3 + y(1-y) + (1 + xy)(1-y)
; функцию можно выразить следующим образом
; a = 1 + xy
; b = 1 - y
; f(x, y) = xa^2 + yb + ab

; через define пишем вспомогательную процедуру
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (f-helpler (+ 1 (* x y))
             (- 1 y)))

; через lambda пишем вспомогательную процедуру
(define (f x y)
  ((lambda (a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (+ 1 (* x y))
  (- 1 y)))

; с использованием особой формы let
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
        