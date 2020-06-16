#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 10000019)
(timed-prime-test 10000079)
(timed-prime-test 100000007)
(timed-prime-test 100000037)
(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 100000000000031)



; процедура timed-prime-test использующая isprime?
; 1009 *** 30
; 1013 *** 1
; 10007 *** 3
; 10009 *** 3
; 100003 *** 7
; 100019 *** 7
; 1000003 *** 19
; 1000033 *** 18
; 10000019 *** 57
; 10000079 *** 65
; 100000007 *** 177
; 100000037 *** 186
; 1000000007 *** 800
; 1000000009 *** 792
; 10000000019 *** 2484
; 10000000033 *** 1917
; 100000000003 *** 6360
; 100000000019 *** 6288
; 1000000000039 *** 18610
; 1000000000061 *** 17035
; 10000000000037 *** 56296
; 10000000000051 *** 56767
; 100000000000031 *** 175907
