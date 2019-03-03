#lang racket

; Exercise 1.16.
; Design a procedure that evolves an iterative
; exponentiation process that uses successive squaring
; and uses a logarithmic number of steps, as does
; fast-expt. (Hint: Using the observation that
; (b^(n/2))^2 = (b^2)^(n/2), keep, along with the exponent
; n and the base b, an additional state variable a, and
; define the state transformation in such a way that the
; product a bn is unchanged from state to state. At the
; beginning of the process a is taken to be 1, and the
; answer is given by the value of a at the end of the
; process. In general, the technique of defining an
; invariant quantity that remains unchanged from state to
; state is a powerful way to think about the design of
; iterative algorithms.)

(provide fast-expt)

(define (fast-expt base n)
    (fast-expt-iter base n 1))

(define (fast-expt-iter base power acc)
    (cond
        ((= power 0) acc)
        ((even? power) (fast-expt-iter (sqr base) (/ power 2) acc))
        (else (fast-expt-iter base (- power 1) (* acc base)))))
