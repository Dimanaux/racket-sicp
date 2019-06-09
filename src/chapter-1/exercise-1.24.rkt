#lang racket

; TASK
; modify procedure timed-prime-test so
; it will use fast-prime?
; check all 12 numbers from 1.22

(require "../lib/fast-prime.rkt")

(define runtime current-inexact-milliseconds)

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 20)
        (report-prime (- (runtime) start-time))
        false))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (search-for-primes number count)
    (cond ((> count 0)
        (cond
            ((timed-prime-test number) (search-for-primes (+ number 1) (- count 1)))
            (else (search-for-primes (+ number 1) count))))))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)
(search-for-primes 1000000 3)
