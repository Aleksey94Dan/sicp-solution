#lang racket

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

(gcd 206 40)

; апликативный порядок вычисления
; сначала  вычисление аргументов затем вычисление процедуры
;(gcd 206 40)
;(gcd 206 40) -> (gcd 40 (remainder 206 40)) -> (gcd 40 6)
;(gcd 40 6) -> (gcd  6 (remainder 40 6)) -> (gcd 6 4)
;(gcd 6 4) -> (gcd 4 (remainder 6 4)) -> (gcd 4 2)
;(gcd 4 2) -> (gcd 2 (remainder 4 2)) -> (gcd 2 0)
;(gcd 2 0) -> 2
; при вычисление выполняется 4 операции remainder
;
;
; нормальный порядок вычисления
; "полная подстановка, затем редукция"
;(gcd 206 40)
;
;(gcd 206 40)
;     (if (= 40 0)
;         206
;         (gcd 40 (remainder 206 40))
;     )
; )

;
;
;     (if (= (remainder 206 40) 0)
;         40
;         (gcd (remainder 206 40) (remainder 40 (remainder 206 40))
;     )
; )
;
;
;     (if (= (remainder 40 (remainder 206 40)) 0)
;         (remainder 206 40)
;         (gcd (remainder 40 (remainder 206 40)) (remainder ((remainder 206 40))(remainder 40 (remainder 206 40))))
;     )
; )

;
;     (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;          a = (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          b = (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) = 0

; При нормальном порядке вычисления функция remainder вызывается 18 раз: 7 раз в условии if и 11 раз в теле.