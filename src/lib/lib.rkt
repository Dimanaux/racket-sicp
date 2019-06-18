#lang racket

(provide inc
         square
         runtime
         cube
         average
         average-damp
         fixed-point)

(define (inc x) (+ x 1))

(define square sqr)

(define runtime current-inexact-milliseconds)

(define (cube x) (* x x x))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (average a b)
    (/ (+ a b) 2))

(define (fixed-point f first-guess)
    (define (try guess)
        (let ([next (f guess)])
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define tolerance 0.00001)

(define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
