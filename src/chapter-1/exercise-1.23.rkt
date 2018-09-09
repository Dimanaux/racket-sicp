#lang racket


(require "../lib/runtime.rkt")


; TASK
; find-divisor checked all the numbers 2, 3, 4, 5, 6, 7...
; but there is no need in that
; we can improve our time checking 2, 3, 5, 7, 9...
; create procedure next and use.
; Does it improve the algorithm?
; Why or why not?

(define (prime? x)
    (= (smallest-divisor x) x))


(define (next current)
    (cond
        ((= current 2) 3)
        (else (+ current 2))))


(define (smallest-divisor n)
    (find-divisor n 2))


(define (find-divisor n test-divisor)
    (cond
        ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))


(define (divides? a b)
    (= (remainder b a) 0))


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

; Time measures are different for exercises 1.22 and 1.23.
; Solution used in 1.23 is 2 times faster than 1.22 one.

