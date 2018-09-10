#lang racket


(require "fermat-test.rkt")


(define (fast-prime? n times)
    (cond
        ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))


(provide fast-prime?)

