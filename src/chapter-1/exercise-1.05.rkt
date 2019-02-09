#lang racket

; Exercise 1.5.
; Ben Bitdiddle has invented a test to determine whether
; the interpreter he is faced with is using
; applicative-order evaluation or normal-order evaluation.
; He defines the following two procedures:

(define (p) (p))

(define (test x y)
    (if (= x 0)
        0
        y))

(write (test 0 (p)))

; applicative means that first we calculate arguments,
; then we make a procedure call

; normal means that we use substitution

; if we use applicative order evaluation,
; we get an infinite loop, because of (define (p) (p))
; but if we use normal order ev. we won't calculate values
; of arguments and procedure returns 0. 
