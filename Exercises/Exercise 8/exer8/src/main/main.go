package main

import (
	"fmt"
	"exer8"
)

func main(){
	fmt.Println(exer8.Message)
	fmt.Println(exer8.Hailstone(17))
	fmt.Println(exer8.Hailstone(18))
	fmt.Println(exer8.HailstoneSequenceAppend(5))
	fmt.Println(exer8.HailstoneLength(5))
	fmt.Println(exer8.HailstoneSequenceAllocate(5))
	pt := exer8.NewPoint(3, 4.5)
	fmt.Println(pt) // should print (3, 4.5)
	fmt.Println(pt.String() == "(3, 4.5)") // should print true

	p := exer8.NewPoint(3, 4)
	fmt.Println(p.Norm() == 5.0)
	

}