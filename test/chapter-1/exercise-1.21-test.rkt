#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.21.rkt")

(check-equal? (smallest-divisor 199) 199 "smallest divisor of 199 must be 199")
(check-equal? (smallest-divisor 1999) 1999 "smallest divisor of 1999 must be 1999")
(check-equal? (smallest-divisor 19999) 7 "smallest divisor of 19999 must be 7")
