(import (euler))

(define M 13082761331670030)

(define (cube-roots n)
  (filter (lambda (x)
            (= 1 (expt-mod x 3 n)))
          (iota n)))

(define (euler271 N)
  (let ((ds (factorize N)))
    (1- (apply + (map (lambda (a)
                        (car (crt-system (map cons a ds))))
                      (cartesian-product (map cube-roots ds)))))))
