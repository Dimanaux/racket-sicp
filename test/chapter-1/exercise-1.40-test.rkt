#lang racket

(require rackunit
         "../../src/lib/lib.rkt"
         "../../src/lib/newtons-method.rkt"
         "../../src/chapter-1/exercise-1.40.rkt")

(define tolerance 0.00001)

(check-=
    (newtons-method (cubic 1 -1 -1) 2)
    1
    tolerance
    "positive root of x^3 + x^2 - x - 1 = 0 is 1")

(check-=
    (newtons-method (cubic 1 -1 -1) -2)
    -1
    tolerance
    "negative root of x^3 + x^2 - x - 1 = 0 is -1")
