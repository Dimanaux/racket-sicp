#lang racket

(provide newtons-method)

(require "lib.rkt")

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess))

;
;          g(x + dx) - g(x)
; Dg(x) = ------------------
;                 dx
; where Dg(x) is the derivative of g evaluated at x.
(define (newton-transform g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))


(define dx 0.00001)

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
            dx)))
