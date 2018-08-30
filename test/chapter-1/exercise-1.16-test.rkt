#lang racket


(require rackunit
         "../../src/chapter-1/exercise-1.16.rkt")

(define (assert b p r)
    (check-equals (fast-expt b p) r (format "~a^~a exptected to be ~a" b p r)))

(assert 10 2 100)
(assert 3 4 81)
(assert 2 16 65536)
(assert 2 10 1024)
(assert 10 1 10)
(assert 16 0 1)
(assert 20 2 400)

