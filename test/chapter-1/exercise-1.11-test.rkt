#lang racket

; Exercise 1.11.
; A function f is defined by the rule that f(n) = n if n<3
; and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>=3.
; n:     0 1 2 3 4  5  6  7   8   9   10   11
; f(n):  0 1 2 4 11 25 59 142 335 796 1892 4489

(require rackunit
         "../../src/chapter-1/exercise-1.11.rkt")

(define (assert f arg expected)
    (check-equal? (f arg) expected
        (format "(~a ~a) expected to be ~a"
                f arg expected)))

(define (tests f)
    (assert f 0 0)
    (assert f 1 1)
    (assert f 2 2)
    (assert f 3 4)
    (assert f 4 11)
    (assert f 5 25)
    (assert f 6 59)
    (assert f 7 142)
    (assert f 8 335)
    (assert f 9 796)
    (assert f 10 1892)
    (assert f 11 4489))
 
(tests f-recursive)
(tests f-iterative)
