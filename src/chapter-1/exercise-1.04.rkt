#lang racket

; Exercise 1.4.
; Observe that our model of evaluation allows for
; combinations whose operators are compound expressions.
; Use this observation to describe the behavior of the
; following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; expression (if (> b 0) + -)
; returns + if b > 0 else returns -

; and we get expression (+ a b) or (- a b)
; as the procedure body depending on the sign of b

; if b > 0 we get a + b,
; else we got a - b = a - (- |b|) (sinse b < 0)
; = a + |b|

; in both cases we get a + |b|
