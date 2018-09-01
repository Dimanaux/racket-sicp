#lang racket


(provide fast-*)


(define (double x)
    (+ x x))


(define (halve x)
    (/ x 2))


(define (fast-* a b)
    (define (iter a b product)
        (cond
            ((= a 0) product)
            ((even? a) (iter (halve a) (double b) product))
            (else (iter (- a 1) b (+ product b)))))
    (iter a b 0))

