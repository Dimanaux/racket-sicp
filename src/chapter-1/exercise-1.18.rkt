#lang racket


(provide fast-*)


(define (double x)
    (+ x x))


(define (halve x)
    (/ x 2))


(define (fast-* a b)
    (define (iter count product)
        (cond
            ((= count 0) 0)
            ((= count 1) product)
            ((even? count) (iter (halve count) (double product)))
            (else (iter (- count 1) (+ product b)))))
    (iter a 1))

