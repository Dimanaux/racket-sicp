#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.37.rkt")

(check-=
    (+ 1 (cond-frac one one 10))
    1.61803398875
    0.0001
    "Golden ratio is 1.618033988... (iterative)")

(check-=
    (+ 1 (cond-frac-recursive one one 10))
    1.61803398875
    0.0001
    "Golden ratio is 1.618033988... (recursive)")
