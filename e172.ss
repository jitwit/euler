(import (euler))

(define (sub-one xs)
  (filter-map (lambda (n)
                (let ((x (list-ref xs n)))
                  (and (< 0 x)
                       (sort < (append (list-head xs n)
                                       (list (1- x))
                                       (list-tail xs (1+ n)))))))
              (enumerate xs)))

(defmemo (build digits n)
  (cond ((ormap (lambda (d) (< d 0)) digits) 0)
        ((zero? n) 1)
        (else (fold-left (lambda (ways digits)
                           (+ ways (build digits (1- n))))
                         0
                         (sub-one digits)))))

(define (e172)
  (* 9 (build (cons 2 (make-list 9 3))
              17)))
