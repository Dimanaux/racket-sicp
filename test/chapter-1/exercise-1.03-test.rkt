#lang racket

(require rackunit
         "../../src/chapter-1/exersize-1.03.rkt")

(check-equal? (sum-of-squares-of-two-max 2 3 4) 25 "ascending")
(check-equal? (sum-of-squares-of-two-max 4 3 4) 32 "two max equal")
(check-equal? (sum-of-squares-of-two-max 5 4 4) 41 "one max equals to min")
(check-equal? (sum-of-squares-of-two-max 4 2 3) 25 "ascending random order")
(check-equal? (sum-of-squares-of-two-max -3 7 1) 50 "random order with negative")
(check-equal? (sum-of-squares-of-two-max 0 -3 -1) 1 "negatives with zero")

