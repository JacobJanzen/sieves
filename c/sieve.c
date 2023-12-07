#include <math.h>
#include <stdbool.h>
#include <stdio.h>

#define MAX 1000000

int main(void)
{
    bool sieve[MAX];

    sieve[0] = false;
    sieve[1] = true;
    for (int i = 2; i < MAX; ++i) sieve[i] = true;

    int top = sqrt(MAX);
    for (int i = 2; i < top; ++i) {
        if (sieve[i]) {
            for (int j = i + i; j < MAX; j += i) {
                sieve[j] = false;
            }
        }
    }

    printf("2");
    for (int i = 3; i < MAX; ++i) {
        if (sieve[i])
            printf(", %d", i);
    }
    printf("\n");
}
