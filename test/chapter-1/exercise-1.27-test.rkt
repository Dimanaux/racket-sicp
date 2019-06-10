#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.27.rkt")

; The smallest Carmichael numbers are 561, 1105, 1729,
; 2465, 2821, and 6601.

(check-false (full-fermat-prime? 4) "4 is composite")
(check-true (full-fermat-prime? 7) "7 is prime")
(check-true (full-fermat-prime? 13) "13 is prime")
(check-false (full-fermat-prime? 21) "21 is prime")

; Composite numbers that fails Fermat's test
(check-true (full-fermat-prime? 561) "561 is a Carmicheal number")
(check-true (full-fermat-prime? 1105) "1105 is a Carmicheal number")
(check-true (full-fermat-prime? 1729) "1729 is a Carmicheal number")
(check-true (full-fermat-prime? 2465) "2465 is a Carmicheal number")
(check-true (full-fermat-prime? 2821) "2821 is a Carmicheal number")
(check-true (full-fermat-prime? 6601) "6601 is a Carmicheal number")
