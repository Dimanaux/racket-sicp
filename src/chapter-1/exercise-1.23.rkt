#lang racket


(define (next current)
    (cond
        ((= current 2) 3)
        (else (+ current 2))))


(define (smallest-divisor n)
    (find-divisor n 2))


(define (find-divisor n test-divisor)
    (cond
        ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (esle (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))




(define (timed-prime-test n)
    ; (newline)
    ; (display n)
    (start-prime-test n (runtime)))


(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n (- (runtime) start-time))
        #f))


(define (report-prime number elapsed-time)
    ; (display " *** ")
    ; (newline)
    (display number)
    (display " is prime. ")
    (display elapsed-time)
    (display "ms")
    (newline))




