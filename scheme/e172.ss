(import (euler)
        (prefix (patricia) t:))

(define (digit-table n)
  (fold-right (lambda (x t)
                (t:insert x 0 t))
              (t:insert (1- n) 1 (t:singleton n 9))
              (iota (1- n))))

(defmemo (tree digits N) << (make-hashtable equal-hash t:tree-equal?) >>
  (if (zero? N)
      1
      (t:tree-ifold-right (lambda (n k ways)
                            (+ ways
                               (if (zero? (* n k))
                                   0
                                   (* k (tree (t:modify 1+ (1- n) (t:modify 1- n digits))
                                              (1- N))))))
                          0
                          digits)))

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
