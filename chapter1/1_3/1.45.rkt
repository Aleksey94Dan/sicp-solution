  
#lang racket/base

(require rackunit)
(define (even? n) (= (remainder n 2) 0))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda(x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


; Процедура вычисления квадратного корня

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
;(sqrt 4)

; Процедура вычисления кубического корня корня

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))
;(cube-root 8)
;(cube-root 27)

; создадим функцию для вычисления корней n-ой степени
; будем использовать функию возведеие в степень из прошлых заданий, определим её:

(define (fast-expt b n)
  (cond((= n 0) 1)
       ((even? n) (square (fast-expt b (/ n 2))))
       (else
        (* b (fast-expt b (- n 1))))))

(define (pow-root x n)
  (fixed-point (average-damp (lambda (y) (/ x (fast-expt y (- n 1))))) 1.0))


; Проведем экспиремент для 2-ой степени
;(pow-root 4 2)
; Проведем экспиремент для 3-ой степени
;(pow-root 27 3)
; Проведем экспиремент для 4-ой степени
;(pow-root 8 4)
; На 4-ой степени процесс зависает.
; Проведем экспиремент для 5-ой степени
;(pow-root 81 5)
; Проведем экспиремент для 6-ой степени
;(pow-root 81 6)
; Проведем экспиремент для 7-ой степени
;(pow-root 81 7)
; Проведем экспиремент для 8-ой степени
;(pow-root 81 8)
;(pow-root 81 9)
;(pow-root 81 4)

; Перепишем pow-rot с использованием repeated
(define (pow-root-fix x n repeat)
  (fixed-point (repeated (average-damp (lambda (y) (/ x (fast-expt y (- n 1))))) repeat) 1.0))
(pow-root-fix 27 3 6)
