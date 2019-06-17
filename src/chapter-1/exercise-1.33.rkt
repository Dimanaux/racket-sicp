#lang racket

; Exercise 1.33.
; You can obtain an even more general version of accumulate
; (exercise 1.32) by introducing the notion of a filter on
; the terms to be combined. That is, combine only those
; terms derived from values in the range that satisfy a
; specified condition. The resulting filtered-accumulate
; abstraction takes the same arguments as accumulate,
; together with an additional predicate of one argument that
; specifies the filter. Write filtered-accumulate as a
; procedure. Show how to express the following using
; filtered-accumulate:
; a.
; the sum of the squares of the prime numbers in the
; interval a to b (assuming that you have a prime?
; predicate already written)
; b.
; the product of all the positive integers less than n
; that are relatively prime to n (i.e., all positive;
; integers i < n such that GCD(i,n) = 1).

(require "exercise-1.28.rkt")

(provide sum-of-squared-primes
         complex-product)

(define (filtered-accumulate
        combiner null-value term a next b predicate)
    (define (iter i acc)
        (if (> i b)
            acc
            (if (predicate i)
                (iter (next i) (combiner (term i) acc))
                (iter (next i) acc))))
    (iter a null-value))

(define (inc x) (+ x 1))

; a.
(define (sum-of-squared-primes a b)
    (filtered-accumulate + 0 sqr a inc b prime?))

; b.
(define (complex-product n)
    (define (relatively-prime? x)
        (= (gcd x n) 1))
    (filtered-accumulate * 1 identity 1 inc n relatively-prime?))
