#lang racket

(require rackunit
         "../../src/lib/lib.rkt"
         "../../src/chapter-1/exercise-1.42.rkt")

(check-equal?
    ((compose square inc) 6)
    49
    "((compose square inc) 6) = (square (inc 6)) = (square 7) = 49")
