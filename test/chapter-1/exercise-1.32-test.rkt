#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.32.rkt")

;;; (accumulate combiner null-value term a next b)

(define (succ x) (+ x 1))

(define (tests accumulate-f)
    (define (assert combiner null-value term a next b expected message)
        (check-equal?
            (accumulate-f combiner null-value term a next b)
            expected
            (format "~a at ~a" message accumulate-f)))
    (assert
        + 0 identity 0 succ 10
        55
        "sum [0...10] = 55")
    (assert
        * 1 identity 1 succ 5
        120
        "product [1...5] = 120")
    (assert
        * 1 identity -2 succ 3
        0
        "product [-2...3] = 0")
    (assert
        * 0 identity 1 succ 5
        0
        "product with null-value 0 is 0"))

(tests accumulate)
(tests accumulate-recursive)
