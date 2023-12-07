package main

import (
	"fmt"
	"math"
)

const MAX = 1000000

func main() {
	sieve := [MAX]bool{}

	for i := range sieve {
		sieve[i] = true
	}
	sieve[0] = false
	sieve[1] = false

	top := int(math.Sqrt(MAX))
	for i := 0; i < top; i++ {
		if sieve[i] {
			for j := i + i; j < MAX; j += i {
				sieve[j] = false
			}
		}
	}

	fmt.Print("2")
	for i := 3; i < MAX; i++ {
		if sieve[i] {
			fmt.Printf(", %d", i)
		}
	}
	fmt.Println()
}
