#lang racket

; Exercise 1.27.
; Demonstrate that the Carmichael numbers listed in footnote
; 47 really do fool the Fermat test. That is, write a
; procedure that takes an integer n and tests whether an
; is congruent to a modulo n for every a < n, and try your
; procedure on the given Carmichael numbers.

; Footnote 47.
; Numbers that fool the Fermat test are called Carmichael
; numbers, and little is known about them other than that
; they are extremely rare. There are 255 Carmichael numbers
; below 100,000,000. The smallest few are 561, 1105, 1729,
; 2465, 2821, and 6601. In testing primality of very large
; numbers chosen at random, the chance of stumbling upon
; a value that fools the Fermat test is less than the
; chance that cosmic radiation will cause the computer
; to make an error in carrying out a "correct" algorithm.
; Considering an algorithm to be inadequate for the first
; reason but not for the second illustrates the difference
; between mathematics and engineering.

(require "../lib/expmod.rkt")

(define (full-fermat-prime? n)
    (define (iter a)
        (cond ((= a n) true)
              ((= (expmod a n n) a) (iter (+ a 1)))
              (else false)))
    (iter 1))

(provide full-fermat-prime?)
; see test/chapter-1/exercise-1.27-test.rkt
