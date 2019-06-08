#lang racket

; Exercise 1.20.
; The process that a procedure generates is of course
; dependent on the rules used by the interpreter. As an
; example, consider the iterative gcd procedure given
; above. Suppose we were to interpret this procedure using
; normal-order evaluation, as discussed in section 1.1.5.
; (The normal-order-evaluation rule for if is described in
; exercise 1.5.) Using the substitution method (for normal
; order), illustrate the process generated in evaluating
; (gcd 206 40) and indicate the remainder operations that
; are actually performed. How many remainder operations are
; actually performed in the normal-order evaluation of
; (gcd 206 40)? In the applicative-order evaluation?

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))


(gcd 206 40)
; applicative
; (gcd 206 40)
; (gcd 40 (remainder 206 40)) ; 1
; (gcd 40 6)
; (gcd 6 (remainder 40 6)) ; 2
; (gcd 6 4)
; (gcd 4 (remainder 6 4)) ; 3
; (gcd 4 2);
; (gcd 2 (remainder 4 2)) ; 4
; (gcd 2 0)
; 2
; 4 remainder procedure call

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)
    40
    (gcd
        (remainder 206 40)
        (remainder 40 (remainder 206 40))))
; reduce (= (remainder 206 40) 0) -> (= 6 0) -> false
; +1

(gcd
    (remainder 206 40)
    (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd
        (remainder 40 (remainder 206 40))
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))))
; reduce (= (remainder 40 (remainder 206 40)) 0)
; -> (= (remainder 40 6) 0) -> (= 4 0) -> false
; +2

(gcd
    (remainder 40 (remainder 206 40))
    (remainder
        (remainder 206 40)
        (remainder 40 (remainder 206 40))))

(if (=
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))
        0)
    (remainder 40 (remainder 206 40))
    (gcd
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))
        (remainder
            (remainder 40 (remainder 206 40))
            (remainder
                (remainder 206 40)
                (remainder 40 (remainder 206 40))))))
; reduce (=
;           (remainder
;               (remainder 206 40)
;               (remainder 40 (remainder 206 40)))
;           0)
; -> (= (remainder (remainder 206 40) (remainder 40 6)) 0)
; -> (= (remainder 6 (remainder 40 6)) 0)
; -> (= (remainder 6 4) 0) -> (= 2 0) -> false
; +4

(gcd
    (remainder
        (remainder 206 40)
        (remainder 40 (remainder 206 40)))
    (remainder
        (remainder 40 (remainder 206 40))
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))))

(if (=
        (remainder
            (remainder 40 (remainder 206 40))
            (remainder
                (remainder 206 40)
                (remainder 40 (remainder 206 40))))
        0)
    (remainder
        (remainder 206 40)
        (remainder 40 (remainder 206 40)))
    (gcd
        (remainder
            (remainder 40 (remainder 206 40))
            (remainder
                (remainder 206 40)
                (remainder 40 (remainder 206 40))))
        (remainder
            (remainder
                (remainder 206 40)
                (remainder 40 (remainder 206 40)))
            (remainder
                (remainder 40 (remainder 206 40))
                (remainder
                    (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))))
; reduce (=
;            (remainder
;                (remainder 40 (remainder 206 40))
;                (remainder
;                    (remainder 206 40)
;                    (remainder 40 (remainder 206 40))))
;            0)
; -> (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder
;                (remainder 206 40)
;                (remainder 40 6)))
;        0)
; -> (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder (remainder 206 40) 4))
;        0)
; -> (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder 6 4))
;        0)
; -> (= (remainder (remainder 40 6) (remainder 6 4)) 0)
; -> (= (remainder 4 (remainder 6 4)) 0)
; -> (= (remainder 4 2) 0) -> (= 0 0) -> true
; +7

(remainder
    (remainder 206 40)
    (remainder 40 (remainder 206 40)))
; -> +1
(remainder
    (remainder 206 40)
    (remainder 40 6))
; -> +1
(remainder (remainder 206 40) 4)
; -> +1
(remainder 6 4)
; -> +1
2
; 18 remainder procedure call(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)
    40
    (gcd
        (remainder 206 40)
        (remainder 40 (remainder 206 40))))
; reduce (= (remainder 206 40) 0) -> (= 6 0) -> false
; +1

(gcd
    (remainder 206 40)
    (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd
        (remainder 40 (remainder 206 40))
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))))
; reduce (= (remainder 40 (remainder 206 40)) 0)
; -> (= (remainder 40 6) 0) -> (= 4 0) -> false
; +2

(gcd
    (remainder 40 (remainder 206 40))
    (remainder
        (remainder 206 40)
        (remainder 40 (remainder 206 40))))

(if (=
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))
        0)
    (remainder 40 (remainder 206 40))
    (gcd
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))
        (remainder
            (remainder 40 (remainder 206 40))
            (remainder
                (remainder 206 40)
                    (remainder 40 (remainder 206 40))))))
; reduce (=
;           (remainder
;               (remainder 206 40)
;               (remainder 40 (remainder 206 40)))
;           0)
; -> (= (remainder (remainder 206 40) (remainder 40 6)) 0)
; -> (= (remainder 6 (remainder 40 6)) 0)
; -> (= (remainder 6 4) 0) -> (= 2 0) -> false
; +4

(gcd
    (remainder
        (remainder 206 40)
        (remainder 40 (remainder 206 40)))
    (remainder
        (remainder 40 (remainder 206 40))
        (remainder
            (remainder 206 40)
            (remainder 40 (remainder 206 40)))))

(if (=
        (remainder
            (remainder 40 (remainder 206 40))
            (remainder
                (remainder 206 40)
                    (remainder 40 (remainder 206 40))))
        0)
    (remainder
        (remainder 206 40)
            (remainder 40 (remainder 206 40)))
    (gcd
        (remainder
            (remainder 40 (remainder 206 40))
            (remainder
                (remainder 206 40)
                (remainder 40 (remainder 206 40))))
        (remainder
            (remainder
                (remainder 206 40)
                (remainder 40 (remainder 206 40)))
            (remainder
                (remainder 40 (remainder 206 40))
                (remainder
                    (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))))
; reduce (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder
;                (remainder 206 40)
;                (remainder 40 (remainder 206 40))))
;        0)
; -> (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder
;                (remainder 206 40)
;                (remainder 40 6)))
;        0)
; -> (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder (remainder 206 40) 4))
;        0)
; -> (=
;        (remainder
;            (remainder 40 (remainder 206 40))
;            (remainder 6 4))
;        0)
; -> (= (remainder (remainder 40 6) (remainder 6 4)) 0)
; -> (= (remainder 4 (remainder 6 4)) 0)
; -> (= (remainder 4 2) 0) -> (= 0 0) -> true
; +7

(remainder
    (remainder 206 40)
    (remainder 40 (remainder 206 40)))
; -> +1
(remainder (remainder 206 40) (remainder 40 6))
; -> +1
(remainder (remainder 206 40) 4)
; -> +1
(remainder 6 4)
; -> +1
2
; 18 remainder procedure call
