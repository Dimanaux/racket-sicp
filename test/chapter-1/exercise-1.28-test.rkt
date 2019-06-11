#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.28.rkt")

; tests for Miller-Rabin Test

(check-false (prime? 4)  "4  is composite")
(check-true  (prime? 7)  "7  is prime    ")
(check-true  (prime? 13) "13 is prime    ")
(check-false (prime? 21) "21 is composite")
(check-true  (prime? 29) "29 is prime    ")
(check-true  (prime? 31) "31 is prime    ")
(check-false (prime? 33) "33 is composite")
(check-true  (prime? 41) "41 is prime    ")
(check-false (prime? 42) "42 is composite")
(check-true  (prime? 43) "43 is prime    ")
(check-false (prime? 45) "45 is composite")
(check-true  (prime? 47) "47 is prime    ")
(check-false (prime? 49) "49 is composite")
(check-true  (prime? 53) "53 is prime    ")
(check-false (prime? 54) "54 is composite")
(check-true  (prime? 59) "59 is prime    ")
(check-false (prime? 60) "60 is composite")
(check-true  (prime? 67) "67 is prime    ")
(check-false (prime? 72) "72 is composite")
(check-true  (prime? 79) "79 is prime    ")
(check-false (prime? 99) "99 is composite")
(check-true  (prime? 101) "101 is prime  ")
; total: 10 composites, 12 primes

; Some Carmichael's numbers
(check-false (prime? 561)  "561  is a Carmicheal number (composite)")
(check-false (prime? 1105) "1105 is a Carmicheal number (composite)")
(check-false (prime? 1729) "1729 is a Carmicheal number (composite)")
(check-false (prime? 2465) "2465 is a Carmicheal number (composite)")
(check-false (prime? 2821) "2821 is a Carmicheal number (composite)")
(check-false (prime? 6601) "6601 is a Carmicheal number (composite)")
