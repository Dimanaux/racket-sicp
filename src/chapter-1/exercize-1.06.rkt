#lang racket

(provide sqrt)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))

; the last definition with new-if inside
; will loop forever, since new-if is a
; procedure, and it's arguments is being
; evaluated before procedure call.
; so even if guess is good enough,
; next sqrt-iter call will be invoked. 

