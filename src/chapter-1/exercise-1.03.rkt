#lang racket

; Exercise 1.3.
; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger
; numbers.

(provide sum-of-squares-of-two-max)

(define (sum-of-squares-of-two-max x y z)
    (if (> x y)
        (+ (sqr x) (sqr (max y z)))
        (+ (sqr y) (sqr (max x z)))))
