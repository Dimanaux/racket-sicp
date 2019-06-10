#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.19.rkt")

(check-equal? (fib 0) 0)
(check-equal? (fib 1) 1)
(check-equal? (fib 2) 1)
(check-equal? (fib 3) 2)
(check-equal? (fib 4) 3)
(check-equal? (fib 5) 5)
(check-equal? (fib 6) 8)
(check-equal? (fib 7) 13)
(check-equal? (fib 8) 21)
(check-equal? (fib 9) 34)
(check-equal? (fib 10) 55)
(check-equal? (fib 11) 89)
(check-equal? (fib 12) 144)
(check-equal? (fib 13) 233)
(check-equal? (fib 14) 377)
