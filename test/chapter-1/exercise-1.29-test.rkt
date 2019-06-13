#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.29.rkt")

(define (distance a b) (abs (- a b)))

(define (cube x) (* x x x))

(check-true
    (<=
        (distance (simpson-rule cube 0 1 100 ) 1/4)
        (distance (integral     cube 0 1 0.01) 1/4))
    "Simpon's rule must be more accurate (100 steps)")

(check-true
    (<=
        (distance (simpson-rule cube 0 1 1000 ) 1/4)
        (distance (integral     cube 0 1 0.001) 1/4))
    "Simpon's rule must be more accurate (1000 steps)")
