#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.31.rkt")

(check-equal? (factorial 5) 120 "5! must be equals to 120")
(check-equal? (factorial 4) 24 "4! must be equal to 24")
(check-equal? (factorial 1) 1 "1! must be equals to 1")
(check-equal? (factorial 0) 1 "0! must be equals to 1")

(check-= (pi/4) (/ pi 4) 0.0001 "pi/4 equals pi/4")
