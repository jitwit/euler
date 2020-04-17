(import (euler))

(define MOD 4503599627370517)
(define G 1504170715041707)
(define G^-1 (inverse-modulo G MOD))

(define (e700)
  (s:map (lambda (x)
           (mod (* x G) MOD))
         (s:iter 1+ 1)))

(define (clean p s)
  (if (null? s)
      s
      (s:cons (car s) (clean p (s:filter (lambda (y)
                                           (p y (car s)))
                                         (s:cdr s))))))

(define smallish-coin 15806432)

(define (index-of coin)
  (mod (* coin G^-1) MOD))

(define (coin-of index)
  (mod (* G index) MOD))

(define (grow cut)
  (let walk ((i 2) (total G) (prev G))
    (if (> i cut)
        (shrink total prev)
        (let ((c-i (coin-of i)))
          (if (< c-i prev) ;; (begin (display (list i c-i)) (newline))
              (walk (1+ i) (+ total c-i) c-i)
              (walk (1+ i) total prev))))))

;; looking for coins
(define (shrink total coin)
  (display (list coin total)) (newline)
  (for-all (lambda (c)
             (when (< c coin)
               (set! coin c)
               (set! total (+ c total))))
           (map cdr (rank-on index-of (cdr (iota coin)))))
  total)
