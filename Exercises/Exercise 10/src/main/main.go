package main

import (
	"fmt"
	"math"
	// "testing"
	"exer10"
)

func main() {
	fmt.Printf("================== fibonacci ================== \n")
	
	n := uint(10)
	fmt.Println("n Fibonacci FibMemoized Fib")	
	for i:=uint(0); i < n; i++ {
		fmt.Println(i, exer10.Fibonacci(i) , exer10.FibMemoized(i), exer10.Fib(i,5))	
	}
	
	fmt.Printf("================== triangle ================== \n")
	pt := exer10.NewPoint(3, 4)
	fmt.Println(pt)
	exer10.TurnDouble(&pt, 3*math.Pi/2)
	fmt.Println(pt)
	
	tri := exer10.Triangle{exer10.NewPoint(1, 2), exer10.NewPoint(-3, 4), exer10.NewPoint(5, -6)}
	exer10.TurnDouble(&tri, math.Pi)
	fmt.Println(tri)

	
	fmt.Printf("================== image ================== \n")
	exer10.DrawCircle(40,20,"out.png")
	exer10.DrawCircle(100,50,"out2.png")
}
