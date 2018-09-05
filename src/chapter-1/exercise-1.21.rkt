#lang racket


(define (smallest-divisor n)
    (find-devisor n 2))


(define (find-divisor n test-divisor)
    (cond
        ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b)
    (= (remainder b a) 0))


(define (prime? n)
    (= n (smallest-divisor n)))




