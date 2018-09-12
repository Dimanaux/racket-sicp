#lang racket


(require "../lib/fast-prime.rkt")

; TASK
; modify procedure timed-prime-test so
; it will use fast-prime?
; check all 12 numbers from 1.22

(define runtime current-inexact-milliseconds)


(define (timed-prime-test n)
    (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
    (if (fast-prime? n 10)
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


