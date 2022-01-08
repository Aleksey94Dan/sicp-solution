#lang racket
(require rackunit)


(define (cons x y)
  (lambda (m) (m x y)))


(define (car z)
  (z (lambda (p q) p)))


(define (cdr z)
  (z (lambda (p q) q)))

;; Проверяем, что при любых двух объектах x и y, car возращает x
(check-equal? (car (cons 2 3)) 2)
;; Проверяем, что при любых двух объектах x и y, cdr возращает y
(check-equal? (cdr (cons 2 3)) 3)

;; Воспользуемся подстановочной моделью
;; Для car
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (p q) p) x y)
;((lambda (x y) x))
;x

;; Для cdr
;((cons x y) (lambda (p q) q))
;((lambda (m) (m x y)) (lambda (p q) q))
;(((lambda (p q) q) x y))
;(((x y) y))
;y
