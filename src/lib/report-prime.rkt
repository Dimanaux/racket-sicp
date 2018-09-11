#lang racket


(define (report-prime number elapsed-time)
    (display number)
    (display " is prime. ")
    (display elapsed-time)
    (display "ms")
    (newline))


(provide report-prime)

