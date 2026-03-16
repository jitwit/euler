#include <stdio.h>
typedef unsigned long long I;
#define N 200000
#define R return

I V2[N-1] = {0};I V5[N-1] = {0};

// legendre p-adic valuation (how many times p divides n!)
I v_p(I p,I n) { I x = 0; for (I pk=p; pk<=n; pk*=p) x += n/pk; R x; }

I main () {
  I ans = 0; for (I k=1; k <= N; k++) { V2[k] = v_p(2,k); V5[k] = v_p(5,k); }
  
  for (I i=0; i <= N/3; i++) {
    for (I j = i; j <= (N-i)/2; j++) { I k = N-i-j;
      if (12 <= V2[N]-V2[i]-V2[j]-V2[k] && 12 <= V5[N]-V5[i]-V5[j]-V5[k]) {
	if      (i != j && j != k) ans += 6;
	else if (i != j || j != k) ans += 3;
	else                       ans += 1; } } }

  printf("%lld\n",ans);
  return 1; }
