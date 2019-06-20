#lang racket

; Exercise 1.38.
; In 1737, the Swiss mathematician Leonhard Euler published
; a memoir De Fractionibus Continuis, which included a
; continued fraction expansion for e - 2, where e is the
; base of the natural logarithms. In this fraction, the Ni
; are all 1, and the Di are successively 1, 2, 1, 1, 4, 1,
; 1, 6, 1, 1, 8, .... Write a program that uses your
; cont-frac procedure from exercise 1.37 to approximate e,
; based on Euler's expansion.

(require "exercise-1.37.rkt")

(provide e-2)

; not ones at indeces
; 2, 5, 8, 11...
; 2 -> 2, 5 -> 4, 8 -> 6, 11 -> 8, 14 -> 10
; so Ni: i -> (i + 1) div 3 * 2
(define (e-di i)
    (if (= (remainder i 3) 2)
        (* (quotient (+ i 1) 3) 2)
        1))

(define (e-2)
    (cond-frac one e-di 20))
