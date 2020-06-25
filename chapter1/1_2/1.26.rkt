#lang sicp

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp)
         (remainder
            (*  (expmod base (/ exp 2) m)
                (expmod base (/ exp 2) m))
                m))
        (else
            (remainder (* base (expmod base (- exp 1) m))
            m))))

(expmod 2 6 6)
; произведем вичисление используя данную процедуру
; 2 3 3
;(expmod 2 6 6)
;(remainder (* (expmod 2 3 6) (expmod 2 3 6)) 6)
;(remainder (* (remainder (* 2 (expmod 2 2 6) 6)) (remainder (* 2 (expmod 2 2 6) 6)) 6))
;(remainder (* (remainder (* 2 (remainder (* (expmod 2 1 6) (expmod 2 1 6)) 6) 6)) (remainder (* 2 (remainder (*  (expmod 2 1 6) (expmod 2 1 6)) 6) 6)) 6))
;(remainder (* (remainder (* 2 (remainder (* (remainder (* 2 (expmod base 0 6)) 6) (remainder (* 2 (expmod base 0 6)) 6)) 6) 6)) (remainder (* 2 (remainder (*  (remainder (* 2 (expmod base 0 6)) 6) (remainder (* 2 (expmod base 0 6)) 6)) 6) 6)) 6))

; (define (expmod base exp m)
;     (cond
;         ((= exp 0) 1)
;         ((even? exp)
;          (remainder
;             (square  (expmod base (/ exp 2) m))
;                 m)
;         (else
;             (remainder (* base (expmod base (- exp 1) m))
;             m))))

; ;(expmod 2 6 6)
; (remainder (square (expmod 2 3 6)) 6)
; (remainder (square (remainder (* 2 (expmod 2 2 6))6)) 6)
; (remainder (square (remainder (* 2 (remainder (square (expmod 2 1 6)) 6)) 6)) 6)
; (remainder (square (remainder (* 2 (remainder (square (remainder (* 2 (expmod 2 0 6) 6)) 6)) 6)) 6)
4