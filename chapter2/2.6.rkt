#lang racket
(require rackunit)
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))

; Тогда определение one:
(define one (lambda (f) (lambda (x) (f x))))

;(add-1 one)
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x)))))
;(lambda (f) (lambda (x) (f (((lambda (x) (f x)) x)))))
;(lambda (f) (lambda (x) (f (f x))))
; Тогда определение two:
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f(f x))))))

; Процедура сложения получается следующим образом:
; Из процедур zero, one, two видно, что
; при zero: f(x) -> x
; при one: f(x) -> (f x)
; при two: f(x) -> (f (f x))
; Наблюдается закономерность, которую можно выразить следующим образом:
; f^n(x) -> ((n f ) x), где n - процедура числа Чёрча.
;  пример, воспользуемся методом подстановки для one
;((n f ) x)
;(((lambda (f) (lambda (x) (f x))) f) x)
;(f x)
;  пример, воспользуемся методом подстановки для two
;((n f ) x)
;(((lambda (f) (lambda (x) (f (f x)))) f ) x)
;(f (f x))

; Процедура сложения должна принимать две процедуры чисел Чёрча, т.е
; ((n f) x) и ((m f) t)
; Пусть ((n f) x)  = t, тогда ((m f) t) = ((m f) ((n f) x))
; Также можно выразить, как f^n(x) и f^m(t), f^n(x) = t, тогда f^m(f^n(x)) = f^(m+n)(x).


(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))



(define (inc x) (+ x 1))
(define (church->nat n) ((n inc) 0))
(check-equal? (church->nat zero) 0)
(check-equal? (church->nat one) 1)
(check-equal? (church->nat two) 2)
(check-equal? (church->nat (add one one)) 2)
(check-equal? (church->nat (add two one)) 3)
(check-equal? (church->nat (add (add two one) zero)) 3) 
(check-equal? (church->nat (add (add two one) one)) 4)