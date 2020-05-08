#lang racket

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp)
        (remainder (square (expmod base (/ exp 2) m))
            m))
        (else
        (re))
        ))
