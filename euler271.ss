(import (euler))

(define M 13082761331670030)

(define (choosing X)
  (if (null? X)
      '(())
      (let ((xs (choosing (cdr X))))
        (apply append
               (map (lambda (x)
                      (map (lambda (xs)
                             (cons x xs))
                           xs))
                    (car X))))))

(define (cube-roots n)
  (filter (lambda (x)
            (= 1 (expt-mod x 3 n)))
          (iota n)))

(define (rabbit n)
  (let* ((ds (factorize n))
         (as (choosing (map cube-roots ds))))
    (fold-left +
               -1 ;; -1 to ignore 1
               (map car
                    (map (lambda (a)
                           (crt-system (map cons a ds)))
                         as)))))

