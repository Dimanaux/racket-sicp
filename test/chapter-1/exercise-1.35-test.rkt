#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.35.rkt")

(check-=
    (golden-ratio)
    1.61803398875
    0.0001
    "Golden ratio is 1.618033988...")
