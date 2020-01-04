(import (euler))

(define (e351 L)
  (define T (totient-sieve (1+ L)))
  (do ((n 1 (1+ n))
       (s 0 (+ s n (- (fxvector-ref T n)))))
      ((< L n) (* 6 s))))
