(import (euler))

(define (solve-bisect f a b err)
  (let loop ((a a) (b b))
    (display-ln (list a b))
    (if (< (- b a) err)
        a
        (let ((x (average a b)))
          (if (< (f x) 0)
              (loop x b)
              (loop a x))))))

(define (s689 x)
  (/ 1 (square x) (expt 2 x)))

;; will this work with brute?
(define tolerance
  (make-parameter 1e-4))

(define (G x n err)
  (if (<= x 0)
      1.0
      (if (< (s689 n) err)
          0.0
          (* 1/2 (+ (G x (1+ n) err)
                    (G (- x (/ (square n))) (1+ n) err))))))

(define (F x)
  (G x 1 (tolerance)))

(define (f-slow x iters)
  (let loop ((f-x 0.0) (i 1) (x x))
    (if (= i iters)
        f-x
        (let* ((2*x (* 2 x)) (y (floor 2*x)))
          (loop (+ f-x (/ y (square i)))
                (1+ i)
                (- 2*x y))))))

(define (expected n iters)
  (do ((x 0.0 (+ x (f-slow (random 1.) iters)))
       (i 0 (1+ i)))
      ((= i n) (/ x n))))

(define (experiment n iters)
  (let loop ((k 0) (total 0))
    (cond ((= k n)
           (/ total 1. n))
          ((< (f-slow (random 1.) iters) 1/2)
           (loop (1+ k) (1+ total)))
          (else
           (loop (1+ k) total)))))
