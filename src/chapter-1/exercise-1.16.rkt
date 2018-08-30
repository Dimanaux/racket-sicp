#lang racket


(provide fast-expt)


(define (fast-expt base n)
    (fast-expt-iter base n 1))


(define (fast-expt-iter base power acc)
    (cond
        ((= power 0) acc)
        ((even? power) (fast-expt-iter (sqr base) (/ power 2) acc))
        (else (fast-expt-iter base (- power 1) (* acc base))
