package main

import (
	"exer9"
	"fmt"
	"math"
)

func main() {
	fmt.Println(exer9.Message)

	pt := exer9.NewPoint(3, 4.5)
	fmt.Println(pt)                        // should print (3, 4.5)
	fmt.Println(pt.String() == "(3, 4.5)") // should print true

	p1 := exer9.NewPoint(3, 4)
	fmt.Println(p1.Norm() == 5.0)
	p1.Scale(5)
	fmt.Println(p1)

	p2 := exer9.NewPoint(1, 0)
	p2.Rotate(math.Pi / 2)
	fmt.Println(p2)
	p2.Rotate(math.Pi / 2)
	fmt.Println(p2)

	fmt.Println(exer9.RandomArray(5,10))
	fmt.Println(exer9.RandomArray(5,10))
	fmt.Println(exer9.RandomArray(5,10))

	arr := []int{1,2,3,4,5,6,7,8,9,10}
	results := make(chan int)
	go exer9.GenerateSum(arr, results)
	sum := <- results
	fmt.Println("Sum of ", arr, " is ", sum)
	chunks := 5
	mean,stddev := exer9.MeanStddev(arr,chunks)
	fmt.Println("MeanStddev(", arr, chunks, ") = ", mean, ", ", stddev)

	arr2 := []float64{10,9,8,7,6,5,4,3,2,1}
	fmt.Println(arr2)
	exer9.InsertionSort(arr2)
	fmt.Println(arr2)
	
	arr3 := []float64{10,9,8,7,6,5,4,3,2,1}
	fmt.Println(arr3)
	exer9.QuickSort(arr3)
	fmt.Println(arr3)
}
