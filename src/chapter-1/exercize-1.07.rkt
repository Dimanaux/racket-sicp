#lang racket


(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (sqrt x)
    (sqrt-iter 1.0 x))


; new good-enough? procedure

(define (good-enough? current-guess previous-guess)
    (< (abs (- current-guess previous-guess)) 0.001))


; new sqrt-iter procedure

(define (sqrt-iter guess x)
    (if (good-enough? (improve guess x) guess)
        guess
        (sqrt-iter (improve guess x) x)))

