#include <stdio.h>
#include <math.h>
#include <stdlib.h>

typedef unsigned long long I;
typedef void V;

#define N 1000001
#define R return

I X[N] = {0};
I hi = N-1;

I gcd(I a,I b) { I t; while (b) {t=a; a=b; b=t%b;} R a; }

int main () {
  for (I i=1;i<N;i++) for (I j=i;j<N;j+=i) X[j] += i; // div sieve
  for (I i=1;i<N;i++) X[i] += X[i-1];                 // accum divs
  // ans starts with real contrib and the imag from 1+i
  I ans = 2*X[hi/2] + X[hi], M = (I) sqrt(hi);
  for (I a=1;a<=M;a++)
    for (I b=a+1;b<=sqrt(N-a*a);b++)
      if ((a|b)&1&&gcd(a,b)==1)
        ans += 2*(a+b)*X[hi/(a*a+b*b)]; // imag contrib
  printf("%lld\n",ans);
  return 1;
}
