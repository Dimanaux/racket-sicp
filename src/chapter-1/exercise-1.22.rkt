#lang racket

; TASK
; Write procedure search-for-primes
; that tests for primeness all odd
; number in range.
; Find 3 smallest prime numbers
; greater than 1 000,
; greater than 10 000,
; greater than 100 000,
; greater than 1 000 000.
; How many time does it takes?
; Does this algorithm takes Tetha(sqrt(n))?


(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))


(define (start-prime test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))


(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))


