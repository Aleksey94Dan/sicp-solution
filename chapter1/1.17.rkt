#lang racket

; (define (mul a b)
;     (if (= b 0) 0
;         (+ a (mul a (- b 1)))
;     )
; )

;(mul 4 3)
;(mul 4 3)
;(mul 4 3) -> (+ 4 (mul 4 2))
;(+ 4 (mul 4 2)) -> (+ 4 (+ 4 (mul 4 1)))
;(+ 4 (+ 4 (mul 4 1))) -> (+4 (+ 4 (+ 4 (mul 4 0))))
;(+ 4 (+ 4 (mul 4 0))) -> (+4 (+ 4 (+ 4 0)))
;(+4 (+ 4 (+ 4 0))) -> 12

; (mul 4 7)
; (+ 4 (mul 4 6))
; (+4 (+ 4 (mul 4 5))





(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (fast-add a b)
    (cond
        ((= b 1) a)
        ((= b 0) 0)
        ((even? b) (fast-add (double a) (halve b)))
        (else (+ a (fast-add a (- b 1))))
    )
)

(fast-add 4 0)
(fast-add 4 3)
;(fast-add 4 3) -> (+ 4 (fast-add 4 2))
;(+ 4 (fast-add 4 2)) -> (+ 4 (fast-add 8 1)) -> 12


; (fast-add 4 7)
; (+ 4 (fast-add 4 6)
; (+ 4 (fast-add 8 3)
; (+ 4 (+ 8 (fast-add 8 2)))
; (+ 4 (+ 8 (fast-add 16 1)))
; (+ 4 (+ 8 16))
; 28

; (fast-add 4 8)
; (fast-add 8 4)
; (fast-add 16 2)
; (fast-add 32 1)
; 32