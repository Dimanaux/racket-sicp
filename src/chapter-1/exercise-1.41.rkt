#lang racket

; Exercise 1.41.
; Define a procedure double that takes a procedure of one
; argument as argument and returns a procedure that applies
; the original procedure twice. For example, if inc is a
; procedure that adds 1 to its argument, then (double inc)
; should be a procedure that adds 2. What value is returned
; by (((double (double double)) inc) 5)?

(provide double)

(define (double f)
    (lambda (x)
        (f (f x))))

;;; (((double (double double)) inc) 5)
; pseudo Haskell
; double :: (t -> t) -> t -> t
; double f = \x -> f (f x)
; OR
; double = \f -> (\x -> f (f x))
;
; double double = \g -> double (double g)
; double double = \g -> double ((\f -> (\x -> f (f x))) g)
; double double = \g -> double (\x -> g (g x))
; double double = \g -> ((\h -> [\y -> h (h y)] {\x -> g (g x)})
; double double = \g -> [\y -> {\x -> g (g x)} ({\x -> g (g x)} y)]
; double double = \g -> [\y -> {\x -> g (g x)} (g (g y))]
; double double = \g -> [\y -> g (g (g (g y)))]
;
; double (double double) = (\F -> [\H -> F (F H)]) (\g -> [\y -> g (g (g (g y)))])
; double (double double) = [\H -> (\g -> [\y -> g (g (g (g y)))]) ((\g -> {\y -> g (g (g (g y)))}) H)]
; double (double double) = [\H -> (\g -> [\y -> g (g (g (g y)))]) {\y -> H (H (H (H y)))}]
; double (double double) = [\H -> [\y -> {\y -> H (H (H (H y)))} ({\y -> H (H (H (H y)))} ({\y -> H (H (H (H y)))} ({\y -> H (H (H (H y)))} y)))]]
; double (double double) = [\H -> [\y -> {\y -> H (H (H (H y)))} ({\y -> H (H (H (H y)))} ({\y -> H (H (H (H y)))} [H (H (H (H y)))]))]]
; double (double double) = [\H -> [\y -> {\y -> H (H (H (H y)))} ({\y -> H (H (H (H y)))} {H (H (H (H [H (H (H (H y)))])))})]]
; double (double double) = [\H -> [\y -> {\y -> H (H (H (H y)))} [H (H (H (H {H (H (H (H [H (H (H (H y)))])))})))]]]
; double (double double) = [\H -> [\y -> H (H (H (H [H (H (H (H {H (H (H (H [H (H (H (H y)))])))})))])))]]
; double (double double) = a procedure that takes a procedure and argument and applies it 16 times
;
; So the result is 21
