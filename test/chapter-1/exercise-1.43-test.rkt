#lang racket

(require rackunit
         "../../src/lib/lib.rkt"
         "../../src/chapter-1/exercise-1.43.rkt")

(check-equal?
    ((repeated square 2) 5)
    625
    "(repeated square 2) 5 = 625")

(check-equal?
    ((repeated inc 11) 5)
    16
    "(repeated inc 11) 5 = 16")
