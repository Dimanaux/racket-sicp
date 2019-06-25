#lang racket

(require rackunit
         "../../src/lib/lib.rkt"
         "../../src/chapter-1/exercise-1.41.rkt")

(check-equal?
    (((double (double double)) inc) 5)
    21
    "(((double (double double)) inc) 5) = 21")
