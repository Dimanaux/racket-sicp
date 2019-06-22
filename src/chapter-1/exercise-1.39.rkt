#lang racket

; Exercise 1.39.
; A continued fraction representation of the tangent
; function was published in 1770 by the German
; mathematician J.H. Lambert:
;                x
; tan x = -----------------
;                  x^2
;          1 - ------------
;                     x^2
;               3 - -------
;                    5 - ..
; where x is in radians. Define a procedure (tan-cf x k)
; that computes an approximation to the tangent function
; based on Lambert's formula. K specifies the number of
; terms to compute, as in exercise 1.37.

(require "exercise-1.37.rkt")

(provide tan-cf)

(define (odd-number i)
    (+ (* (- i 1) 2) 1))
; 2i + 1, but i starts with 1, so use i - 1

(define (tan-cf x k)
    (define (tan-cf-ni i)
        (if (= i 1) x (- (sqr x))))
    (cond-frac tan-cf-ni odd-number k))
