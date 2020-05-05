#lang sicp



(define (smallest-devisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))


(define (square x) (* x x))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (prime? n)
  (= n (smallest-devisor n)))

(define (search-for-primes start-number end-number)
  (if (> end-number 0)
      (if (prime? start-number)
          (if (timed-prime-test start-number)
              (search-for-primes (+ start-number 1) (- end-number 1)))
          (search-for-primes (+ start-number 1) end-number))))

;(search-for-primes 1000 3)
;1009 *** 35
;1013 *** 4
;1019 *** 4

;(search-for-primes 10000 3)
;10007 *** 34
;10009 *** 10
;10037 *** 9

; (search-for-primes 100000 3)
; 100003 *** 70
; 100019 *** 28
; 100043 *** 28

(search-for-primes 1000000 3)
; 1000003 *** 55
; 1000033 *** 27
; 1000037 *** 18
