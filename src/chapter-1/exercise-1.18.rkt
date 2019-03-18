#lang racket

; Exercise 1.18.
; Using the results of exercises 1.16 and 1.17, devise a
; procedure that generates an iterative process for
; multiplying two integers in terms of adding, doubling,
; and halving and uses a logarithmic number of steps.

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
