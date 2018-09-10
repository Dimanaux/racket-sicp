#lang racket


(require "../lib/prime.rkt")

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


(define runtime current-inexact-milliseconds)


(define (timed-prime-test n)
    (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n (- (runtime) start-time))
        #f))


(define (report-prime number elapsed-time)
    (display number)
    (display " is prime. ")
    (display elapsed-time)
    (display "ms")
    (newline))


(define (search-for-primes number count)
    (cond ((> count 0)
        (cond
            ((timed-prime-test number) (search-for-primes (+ number 1) (- count 1)))
            (else (search-for-primes (+ number 1) count))))))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)


