#lang racket

(require "fermat-test.rkt")

(define (fast-prime? n times)
    (cond
        ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(provide fast-prime?)
