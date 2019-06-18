#lang racket

; Exercise 1.31.
; a.
; The sum procedure is only the simplest of a vast number
; of similar abstractions that can be captured as
; higher-order procedures. Write an analogous procedure
; called product that returns the product of the values of
; a function at points over a given range. Show how to
; define factorial in terms of product. Also use product
; to compute approximations to  using the formula:
;
; Pi    2 * 4 * 4 * 6 * 6 * 8 * ...
; -- == ---------------------------
;  4    3 * 3 * 5 * 5 * 7 * 7 * ...
;
; b.
; If your product procedure generates a recursive process,
; write one that generates an iterative process. If it
; generates an iterative process, write one that generates
; a recursive process.

(require "../lib/lib.rkt")

(provide product
         pi/4
         factorial)

(define (product f a next b)
    (define (iter i acc)
        (if (> i b)
            acc
            (iter (next i) (* (f i) acc))))
    (iter a 1))

(define (product-recursive term a next b)
    (if (> a b)
        1
        (product-recursive term (next a) next b)))

(define (factorial n)
    (product identity 1 inc n))

; Idea is to combine terms like that:
; Pi    2 * 4 * 4 * 6 * 6 * 8 * ...
; -- == ---------------------------
;  4    3 * 3 * 5 * 5 * 7 * 7 * ...
; ==>
; Pi        4 * 4 * 6 * 6 * 8 * ...
; -- == 2 * --------------------------
;  4        3 * 3 * 5 * 5 * 7 * 7 * ...
; So we have
; Pi/4 = 2 * (4/3 * 6/5 * 8/7 * ...)^2
; 4/3 > 6/5 > 8/7... so we start with 100/99
; and go up to 4/3

(define (pi-next x)
    (/ (- (numerator x) 2)
       (- (denominator x) 2)))

; Note that we have to exclude 1 extra numerator term
; because we must have equal number of terms in numerator
; and denominator. So we divide the ratio by the last extra
; numerator 5000
(define (pi/4)
    (* 2.0 1/5000 (product sqr 5000/4999 pi-next 4/3)))
