#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.30.rkt")

(define (inc x) (+ x 1))

(check-equal? (sum identity 1 inc 10) 55 "sum of naturals [1...10] = 55")
(check-equal? (sum sqr 1 inc 10) 385 "sum of squares of [1...10] = 385")
(check-equal? (sum identity -5 inc 5) 0 "sum [-5...5] = 0")
(check-equal? (sum abs -5 inc 5) 30 "(sum (abs [-5...5])) = 2*(sum [1...5]) = 30")
