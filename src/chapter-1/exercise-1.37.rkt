#lang racket

; Exercise 1.37.
; a. An infinite continued fraction is an expression of the
; form
;               N1
;  f = --------------------
;                  N2
;       D1 + --------------
;                     N3
;              D2 + -------
;                   D3 + ...
; As an example, one can show that the infinite continued
; fraction expansion with the Ni and the Di all equal to 1
; produces 1/φ, where φ is the golden ratio (described in
; section 1.2.2). One way to approximate an infinite
; continued fraction is to truncate the expansion after a
; given number of terms. Such a truncation -- a so-called
; k-term finite continued fraction -- has the form
;        N1
; ----------------
;           N2
;  D1 + ----------
;       .      Nk
;        .  + ----
;         .    Dk
; Suppose that n and d are procedures of one argument (the
; term index i) that return the Ni and Di of the terms of
; the continued fraction. Define a procedure cont-frac such
; that evaluating (cont-frac n d k) computes the value of
; the k-term finite continued fraction. Check your procedure
; by approximating 1/φ using
;;; (cont-frac (lambda (i) 1.0)
;;;            (lambda (i) 1.0)
;;;            k)
; for successive values of k. How large must you make k in
; order to get an approximation that is accurate to 4 decimal
; places?

; k must be at least 10

(provide one
         cond-frac
         cond-frac-recursive)

(define (one x) 1.0)

(define (cond-frac n d k)
    (define (iter i acc)
        (if (< i 1)
            acc
            (iter (- i 1) (/ (n i) (+ (d i) acc)))))
    (iter (- k 1) (/ (n k) (d k))))

;;; (+ 1 (cond-frac one one 20))
; > 1.6180339985218035

; b. If your cont-frac procedure generates a recursive
; process, write one that generates an iterative process. If
; it generates an iterative process, write one that
; generates a recursive process.

(define (cond-frac-recursive n d k)
    (define (recursion i)
        (if (= i k)
            (/ (n k) (d k))
            (/ (n i) (+ (d i) (recursion (+ i 1))))))
    (recursion 1))

;;; (+ 1 (cond-frac-recursive one one 20))
; > 1.618033985017358
