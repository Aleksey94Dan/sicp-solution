#lang sicp
(define (cont-frac n d k) 
    (define (iter i) 
      (/ (n i) (+ (d i) 
                  (if (< i k) 
                      (iter (+ i 1)) 
                      0)))) 
    (iter 1)) 


(define (member-eiler i)
  (if (= (remainder i 3) 2)
      (* 2 (/ (+ i 1) 3))
      1))

(= (member-eiler 1) 1)
(= (member-eiler 2) 2)
(= (member-eiler 3) 1)
(= (member-eiler 4) 1)
(= (member-eiler 5) 4)
(= (member-eiler 6) 1)
(= (member-eiler 7) 1)
(= (member-eiler 8) 6)
(= (member-eiler 9) 1)
(= (member-eiler 10) 1)
(= (member-eiler 11) 8)

(define (e k)
  (+ 2 (cont-frac (lambda (i) 1.0) member-eiler k)))

(e 9)