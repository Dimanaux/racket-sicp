#lang racket

; Exercise 1.15.
; The sine of an angle (specified in radians) can be
; computed by making use of the approximation sin x ~= x
; if x is sufficiently small, and the trigonometric
; identity
; sin r = 3 sin (r / 3) - 4 (sin (r / 3))^3
; to reduce the size of the argument of sin. (For purposes
; of this exercise an angle is considered "sufficiently
; small" if its magnitude is not greater than 0.1 radians.)
; These ideas are incorporated in the following procedures:

(require "../lib/lib.rkt")

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; a. How many times is the procedure p applied when
; (sine 12.15) is evaluated?

; b. What is the order of growth in space and number of
; steps (as a function of a) used by the process generated
; by the sine procedure when (sine a) is evaluated?

(sine 12.15)
; ## A
; (sine 12.15)
; (p (sine (/ 12.15 3.0))) ; 1
; (p (sine 4.05))
; (p (p (sine (/ 4.05 3.0)))) ; 2
; (p (p (sine 1.35)))
; (p (p (p (sine (/ 1.35 3.0))))) ; 3
; (p (p (p (sine 0.35))))
; (p (p (p (p (sine 0.116666))))) ; 4
; (p (p (p (p (p (sine 0.03888888)))))) ; 5
; procedure p wil be called 5 times

; ## B
; Theta(log a) -- space and time complexity
