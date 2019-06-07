#lang racket

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp) (remainder (sqr (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(provide expmod)
