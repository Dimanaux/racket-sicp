#lang racket


(require rackunit
         "../../src/chapter-1/exercise-1.11.rkt")


(check-equal? (f-recursive 0) 0 "f-r 0")
(check-equal? (f-recursive 1) 1 "f-r 1")
(check-equal? (f-recursive 2) 2 "f-r 2")

