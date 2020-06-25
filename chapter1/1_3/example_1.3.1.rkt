#lang sicp

;(define (sum-integers a b)
;  (if (> a b)
;      0
;      (+ a (sum-integers (+ a 1) b))))
;(display "(sum-integers 1 5)\n")
;(sum-integers 1 5)
;(display "\n")
; (+ 1 (sum-integers 2 5)
; (+ 1 ( + 2 (sum-integers 3 5)))
; (+ 1 ( + 2 (+ 3 (sum-integers 4 5))))
; (+ 1 ( + 2 (+ 3 (+ 4 (sum-integers 5 5)))))
; (+ 1 ( + 2 (+ 3 (+ 4 (+ 5 (sum-integers 6 5))))))
; (+ 1 ( + 2 (+ 3 (+ 4 (+ 5 0)))))
; (+ 1 ( + 2 (+ 3 (+ 4 5))))
; (+ 1 ( + 2 (+ 3 9)))
; (+ 1 ( + 2 12))
; (+ 1 14)
; 15

;(define (cube x) (* x x x))
;(define (sum-cubes a b)
;  (if (> a b)
;      0
;      (+ (cube a) (sum-cubes (+ a 1) b))))

;(display "(sum-cubes 1 5)\n")
;(sum-cubes 1 5)
;(display "\n")
;(+ 1 (sum-cubes 2 5))
;(+ 1 (+ 8 (sum-cubes 3 5)))
;(+ 1 (+ 8 (+ 27 (sum-cubes 4 5))))
;(+ 1 (+ 8 (+ 27 (+ 64 sum-cubes 5 5))))
;(+ 1 (+ 8 (+ 27 (+ 64 (+125 (sum-cubes 6 5)))))
;(+ 1 (+ 8 (+ 27 (+ 64 (+125 0))))
;(+ 1 (+ 8 (+ 27 (+ 64 125)))
;(+ 1 (+ 8 (+ 27 189))
;(+ 1 (+ 8 216))
;(+ 1 224)
;25

;(define (pi-sum a b)
;  (if (> a b)
;      0
;      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;(display "(pi-sum 1 5)\n")
;(pi-sum 1 5)
;(display "\n")
;(+ (/ 1.0 (* 1 3)) (pi-sum 5 5))
;(+ (/ 1.0 (* 1 3)) (+ (/ 1.0 (* 5 7)) (pi-sum 9 5)))
;(+ (/ 1.0 3) (+ (/ 1.0 35) 0))
;(+ 0.3333333333333333 (+ 0.02857142857142857 0))
;(+ 0.3333333333333333 0.02857142857142857)
;0.3619047619047619


;шаблон для "сигма-записи" (суммирования)
;(define (<имя> a b)
;  (if (> a b)
;      0
;      (+ (<терм> a)
;         (<имя> (<следующий> a) b))))

; переведем шаблон на DrRacket
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;для суммирования целых чисел в заданном диапозоне
;создадим term
(define (identity x) x)
;создадим next
(define (inc x) (+ x 1))
;используем шаблон
(define (sum-integers a b)
  (sum identity a inc b))
(display "(sum-integers 1 5)\n")
(sum-integers 1 5)
(display "\n")

;для суммирования кубов
;создадим term
(define (cube x) (* x x x))
;используем шаблон
(define (sum-cubes a b)
  (sum cube a inc b))
(display "(sum-cubes 1 5)\n")
(sum-cubes 1 5)
(display "\n")


;для ряда лейбница;
;создадим term
(define (pi-term x)
  (/ 1.0 (* x (+ x 2))))
;создадим next
(define (pi-next x)
  (+ x 4))
;используем шаблон
(define (pi-sum a b)
  (sum pi-term a pi-next b))
(display "(sum pi-sum 1 5)\n")
(pi-sum 1 5)
(display "\n")

;используем "сигма-запись" для вычисления определенного интеграллаы численным методом
;будем использовать блочную структуру
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