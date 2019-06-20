#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.38.rkt")

(check-=
    (e-2)
    (- (exp 1) 2)
    0.0001
    "e - 2 is 0.71828182846...")
