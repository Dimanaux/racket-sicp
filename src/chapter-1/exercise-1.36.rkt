#lang racket

; Exercise 1.36.
; Modify fixed-point so that it prints the sequence of
; approximations it generates, using the newline and
; display primitives shown in exercise 1.22. Then find a
; solution to x^x = 1000 by finding a fixed point of x ->
; log(1000)/log(x). (Use Scheme's primitive log procedure,
; which computes natural logarithms.) Compare the number of
; steps this takes with and without average damping. (Note
; that you cannot start fixed-point with a guess of 1, as
; this would cause division by log(1) = 0.)

(define tolerance 0.00001)

(define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
    (define (try guess)
        (display guess)
        (newline)
        (let ([next (f guess)])
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (fixed-point-damped f first-guess)
    (define (try guess)
        (display guess)
        (newline)
        (let ([next (f guess)])
            (if (close-enough? guess next)
                next
                (try (/ (+ next guess) 2)))))
    (try first-guess))

(define (x-to-x-is-1000 x)
    (/ (log 1000) (log x)))

; takes 34 steps
(define (solution)
    (fixed-point x-to-x-is-1000 (exp 1)))

; takes 10 steps
(define (damped-solution)
    (fixed-point-damped x-to-x-is-1000 (exp 1)))
