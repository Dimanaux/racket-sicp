#lang racket

; Exercise 1.11.
; A function f is defined by the rule that f(n) = n if n<3
; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>=3.
; Write a procedure that computes f by means of a
; recursive process.
; Write a procedure that computes f by means of an
; iterative process.

(provide f-recursive
         f-iterative)


(define (f-recursive n)
    (cond ((< n 3) n)
        (else
            (+
                (* 1 (f-recursive (- n 1)))
                (* 2 (f-recursive (- n 2)))
                (* 3 (f-recursive (- n 3)))))))


(define (f-iterative n)
    (f-iter 0 1 2 n))


(define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter
            b
            c
            (+ (* 3 a) (* 2 b) c)
            (- count 1))))
