#lang racket


(provide fast-*)


; assume we have double procedure that multiplies a number by 2
; assume we have halve procudure that divides a number by 2

(define (double x)
    (+ x x))


(define (halve x)
    (/ x 2))

; assume we don't have * operation
; how to implement it?


(define (fast-* a b)
    (cond
        ((= a 0) 0)
        ((= a 1) b)
        ((even? a) (double (fast-* (halve a) b)))
        (else (+ (fast-* (- a 1) b) b))))



