#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.33.rkt")

; a.
; the sum of the squares of the prime numbers in the
; interval a to b (assuming that you have a prime?
; predicate already written)
; (sum-of-squared-primes a b)

(check-equal?
    (sum-of-squared-primes 2 5)
    38
    "sum-of-squared-primes 2..5 = 2^2 + 3^2 + 5^2 = 38")


(check-equal?
    (sum-of-squared-primes 3 8)
    83
    "sum-of-squared-primes 3..8 = 3^2 + 5^2 + 7^2 = 83")

; b.
; the product of all the positive integers less than n
; that are relatively prime to n (i.e., all positive;
; integers i < n such that GCD(i,n) = 1).
; (complex-product n)

(check-equal?
    (complex-product 5)
    24
    "complex-product 5 = 1 * 2 * 3 * 4 = 24")

(check-equal?
    (complex-product 12)
    385
    "complex-product 12 = 1 * 5 * 7 * 11 = 385")
