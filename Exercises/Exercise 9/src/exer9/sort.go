package exer9

import (
	"math/rand"
	// "fmt"
)

// Partition the slice arr around a random pivot (in-place), and return the pivot location.
func partition(arr []float64) int {
	// Adapted from https://stackoverflow.com/a/15803401/6871666
	left := 0
	right := len(arr) - 1

	// Choose random pivot
	pivotIndex := rand.Intn(len(arr))

	// Stash pivot at the right of the slice
	arr[pivotIndex], arr[right] = arr[right], arr[pivotIndex]

	// Move elements smaller than the pivot to the left
	for i := range arr {
		if arr[i] < arr[right] {
			arr[i], arr[left] = arr[left], arr[i]
			left++
		}
	}

	// Place the pivot after the last-smaller element
	arr[left], arr[right] = arr[right], arr[left]
	return left
}


// Sorting
// There is a built-in sort package in Go, but that doesn't have to stop us from implementing some sorting algorithms. In sort.go…

// Insertion Sort
// Implement an insertion sort that sorts an array slice in-place:

// func InsertionSort(arr []float64) { … }

func InsertionSort(arr []float64){
	// TODO: implement insertion sort
	for i := 1; i < len(arr); i++ {
		for j := i; j != 0 && arr[j] < arr[j-1] ; j -= 1{
			arr[j], arr[j-1] = arr[j-1], arr[j]
		}
	}
}

const insertionSortCutoff = 120



func QuickSort(arr []float64) {
	// TODO: implement Quicksort:
	//   do nothing for length < 2
	//   do insertion sort for length < insertionSortCutoff
	//   do Quicksort otherwise.
	// TODO: decide on a good value for insertionSortCutoff

	if len(arr) < 2 { return }
	if len(arr) < insertionSortCutoff { 
		InsertionSort(arr)
		return
	}
	leftIndex := partition(arr)
	QuickSort(arr[:leftIndex])
	QuickSort(arr[leftIndex+1:])
}
