#lang racket


(require rackunit
         "../../src/chapter-1/exercise-1.18.rkt")


(check-equal? (fast-* 3 2) 6)
(check-equal? (fast-* 1 2) 2)
(check-equal? (fast-* 0 2) 0)
(check-equal? (fast-* 3 0) 0)
(check-equal? (fast-* 3 1) 3)
(check-equal? (fast-* 2 2) 4)
(check-equal? (fast-* 5 5) 25)
(check-equal? (fast-* 3 7) 21)
(check-equal? (fast-* 7 2) 14)
(check-equal? (fast-* 4 6) 24)
(check-equal? (fast-* 6 4) 24)

