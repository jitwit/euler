(import (euler))

(define (sub-one xs)
  (filter-map (lambda (n)
                (let ((x (list-ref xs n)))
                  (and (< 0 x)
                       (merge <
                              (list (1- x))
                              (append (list-head xs n)
                                      (list-tail xs (1+ n)))))))
              (enumerate xs)))

(defmemo (build digits n)
  (cond ((ormap (lambda (d) (< d 0)) digits) 0)
        ((zero? n) 1)
        (else (fold-left (lambda (ways digits)
                           (+ ways (build digits (1- n))))
                         0
                         (sub-one digits)))))

(define (e172 n)
  (* 9 (build (cons 2 (make-list 9 3))
              (1- n))))
