#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.39.rkt")

(check-=
    (tan-cf pi 10)
    0
    0.0001
    "tan pi = 0")

(check-=
    (tan-cf (/ pi 4) 20)
    1
    0.0001
    "tan (pi/4) = 1")
