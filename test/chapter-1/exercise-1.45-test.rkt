#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.45.rkt")

(define tolerance 0.0001)

(check-= (fourth-root 16 ) 2 tolerance "4th root of 16")
(check-= (fourth-root 81 ) 3 tolerance "4th root of 81")
(check-= (fourth-root 256) 4 tolerance "4th root of 256")

(check-= (nth-root 128 7) 2 tolerance "7th root of 128")
(check-= (nth-root 65536 16) 2 tolerance "16th root of 65536")
(check-= (nth-root 1048576 20) 2 tolerance "20th root of 1048576")

(check-= (nth-root 729 6) 3 tolerance "6th root of 729")
(check-= (nth-root 59049 10) 3 tolerance "10th root of 59049")
