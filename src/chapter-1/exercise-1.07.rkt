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

; Exercise 1.7
; The good-enough? test used in computing square roots will
; not be very effective for finding the square roots of
; very small numbers. Also, in real computers, arithmetic
; operations are almost always performed with limited
; precision. This makes our test inadequate for very large
; numbers. Explain these statements, with examples showing
; how the test fails for small and large numbers. An
; alternative strategy for implementing good-enough? is to
; watch how guess changes from one iteration to the next
; and to stop when the change is a very small fraction of
; the guess. Design a square-root procedure that uses this
; kind of end test. Does this work better for small and
; large numbers?

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

