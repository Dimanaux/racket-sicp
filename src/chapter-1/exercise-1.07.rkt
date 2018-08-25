#lang racket

(provide my-sqrt
         new-sqrt)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< (abs (- (sqr guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (my-sqrt x)
    (sqrt-iter 1.0 x))


; new good-enough? procedure

(define (new-good-enough? current-guess previous-guess)
    (< (abs (- current-guess previous-guess)) 0.001))


; new sqrt-iter procedure

(define (new-sqrt-iter guess x)
    (if (new-good-enough? (improve guess x) guess)
        guess
        (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x)
    (new-sqrt-iter 1.0 x))

